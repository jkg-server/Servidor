#!/usr/bin/env bash
set -Eeuo pipefail
export LC_ALL=C.UTF-8 LANG=C.UTF-8
umask 077

TAG="$(date +%Y%m%d_%H%M%S)"
MODULE="jkg_melocoton_product_ops"
REPO_BASE="https://raw.githubusercontent.com/jkg-server/Servidor/main/deploy/melocoton-product-ops-20260722/module/$MODULE"
ODOO_WEB="jkg-odoo-web"
ODOO_DB="jkg-odoo-db"
DB_NAME="odoo"
DB_USER="odoo"
ADDONS="/srv/odoo/addons"
DEST="$ADDONS/$MODULE"
OUT="/var/backups/jkg/odoo-productos/automatizacion_melocoton_${TAG}"
STAGE="$OUT/stage/$MODULE"
DB_DUMP="$OUT/odoo_before.dump"
CODE_BACKUP="$OUT/module_before.tar.gz"
INSTALL_LOG="$OUT/install_production.log"
TEST_LOG="$OUT/test_clone.log"
ROLLBACK="$OUT/ROLLBACK_AUTOMATIZACION_MELOCOTON.sh"
TMP_DB="jkg_melocoton_ops_test_${TAG}"
TMP_DUMP="/tmp/${TMP_DB}.dump"
TMP_DATA="$OUT/test-data"
CONFIG="$OUT/odoo-test.conf"

mkdir -p "$STAGE/models" "$STAGE/wizard" "$STAGE/security" "$TMP_DATA"
chmod 0700 "$OUT" "$TMP_DATA"

cleanup() {
    set +e
    docker exec "$ODOO_DB" psql -U "$DB_USER" -d postgres -X -A -t -c "SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname='$TMP_DB' AND pid <> pg_backend_pid();" >/dev/null 2>&1 || true
    docker exec "$ODOO_DB" dropdb --if-exists -U "$DB_USER" "$TMP_DB" >/dev/null 2>&1 || true
    docker exec "$ODOO_DB" rm -f "$TMP_DUMP" >/dev/null 2>&1 || true
    rm -rf "$TMP_DATA"
}
trap cleanup EXIT

fail() {
    echo "ERROR=$1"
    [ -f "$TEST_LOG" ] && tail -n 160 "$TEST_LOG" || true
    [ -f "$INSTALL_LOG" ] && tail -n 160 "$INSTALL_LOG" || true
    echo "EVIDENCE_DIR=$OUT"
    exit 1
}

http_code() {
    curl -LksS --connect-timeout 5 --max-time 15 -o /dev/null -w '%{http_code}' https://odoo.thejoseka.com/web/login || true
}

echo "============================================================"
echo " JKG · AUTOMATIZACIÓN PRODUCTOS · EL MELOCOTÓN"
echo "============================================================"

echo
echo "===== 1. PRECHECK ====="
[ "$(id -u)" -eq 0 ] || fail ROOT_REQUIRED
for container in "$ODOO_WEB" "$ODOO_DB"; do
    [ "$(docker inspect -f '{{.State.Running}}' "$container")" = "true" ] || fail "CONTAINER_NOT_RUNNING:$container"
done
case "$(http_code)" in 200|302|303) ;; *) fail ODOO_HTTP_PRECHECK ;; esac
[ -d "$ADDONS" ] || fail ADDONS_NOT_FOUND

echo "PRECHECK=OK"

echo
echo "===== 2. DESCARGAR Y VALIDAR MÓDULO ====="
files=(
    "__init__.py"
    "__manifest__.py"
    "models/__init__.py"
    "models/operation_log.py"
    "wizard/__init__.py"
    "wizard/product_ops_wizard.py"
    "wizard/product_ops_views.xml"
    "security/ir.model.access.csv"
)
for file in "${files[@]}"; do
    mkdir -p "$(dirname "$STAGE/$file")"
    curl -fL --retry 3 --connect-timeout 10 --max-time 60 "$REPO_BASE/$file" -o "$STAGE/$file" || fail "DOWNLOAD:$file"
done
python3 -m py_compile "$STAGE/__init__.py" "$STAGE/models/__init__.py" "$STAGE/models/operation_log.py" "$STAGE/wizard/__init__.py" "$STAGE/wizard/product_ops_wizard.py" || fail PYTHON_SYNTAX
python3 - "$STAGE/__manifest__.py" "$STAGE/wizard/product_ops_views.xml" <<'PY'
import ast
import sys
import xml.etree.ElementTree as ET
from pathlib import Path
manifest = ast.literal_eval(Path(sys.argv[1]).read_text(encoding="utf-8"))
assert manifest["version"].startswith("19.0.")
assert manifest["installable"] is True
ET.parse(sys.argv[2])
print("STATIC_VALIDATION=OK")
PY
find "$STAGE" -type d -exec chmod 0755 {} +
find "$STAGE" -type f -exec chmod 0644 {} +
echo "MODULE_DOWNLOAD=OK"

echo
echo "===== 3. BACKUP ====="
docker exec "$ODOO_DB" pg_dump -U "$DB_USER" -d "$DB_NAME" -Fc > "$DB_DUMP"
[ -s "$DB_DUMP" ] || fail DATABASE_BACKUP_EMPTY
if [ -d "$DEST" ]; then
    tar -C "$ADDONS" -czf "$CODE_BACKUP" "$MODULE"
else
    printf 'ABSENT\n' > "$OUT/module_before_absent.txt"
fi
sha256sum "$DB_DUMP" > "$OUT/odoo_before.dump.sha256"
echo "BACKUP=OK"

echo
echo "===== 4. PRUEBA AISLADA EN CLON ====="
ODOO_IMAGE="$(docker inspect -f '{{.Config.Image}}' "$ODOO_WEB")"
NETWORK="$(python3 - "$ODOO_WEB" "$ODOO_DB" <<'PY'
import json, subprocess, sys
def nets(c):
    return set(json.loads(subprocess.check_output(["docker","inspect","-f","{{json .NetworkSettings.Networks}}",c], text=True)))
common=sorted(nets(sys.argv[1]) & nets(sys.argv[2]))
if not common: raise SystemExit(2)
print(common[0])
PY
)" || fail NO_COMMON_NETWORK

docker cp "$ODOO_WEB:/tmp/odoo-runtime.conf" "$CONFIG"
python3 - "$CONFIG" <<'PY'
from pathlib import Path
import sys
p=Path(sys.argv[1])
changes={
 "addons_path":"/usr/lib/python3/dist-packages/odoo/addons,/usr/lib/python3/dist-packages/addons,/mnt/extra-addons,/mnt/jkg-new-addons",
 "data_dir":"/mnt/jkg-data",
 "workers":"0",
 "max_cron_threads":"0",
 "list_db":"False",
}
out=[]; done=set()
for line in p.read_text(encoding="utf-8").splitlines():
    key=line.split("=",1)[0].strip() if "=" in line else ""
    if key in changes:
        out.append(f"{key} = {changes[key]}"); done.add(key)
    else: out.append(line)
for key,value in changes.items():
    if key not in done: out.append(f"{key} = {value}")
p.write_text("\n".join(out)+"\n",encoding="utf-8")
PY
chown root:101 "$CONFIG"
chmod 0640 "$CONFIG"
chown -R 100:101 "$TMP_DATA"

docker exec "$ODOO_DB" pg_dump -U "$DB_USER" -d "$DB_NAME" -Fc -f "$TMP_DUMP"
docker exec "$ODOO_DB" createdb -U "$DB_USER" "$TMP_DB"
docker exec "$ODOO_DB" pg_restore -U "$DB_USER" -d "$TMP_DB" --no-owner --no-privileges --exit-on-error "$TMP_DUMP"

set +e
docker run --rm --network "$NETWORK" --user 100:101 \
    -v "$ADDONS:/mnt/extra-addons:ro" \
    -v "$OUT/stage:/mnt/jkg-new-addons:ro" \
    -v "$CONFIG:/mnt/jkg-test/odoo.conf:ro" \
    -v "$TMP_DATA:/mnt/jkg-data:rw" \
    --entrypoint /usr/bin/odoo "$ODOO_IMAGE" server \
    --config=/mnt/jkg-test/odoo.conf --database="$TMP_DB" \
    --init="$MODULE" --stop-after-init --no-http > "$TEST_LOG" 2>&1
TEST_RC=$?
set -e
[ "$TEST_RC" -eq 0 ] || fail CLONE_INSTALL_FAILED

set +e
docker run --rm -i --network "$NETWORK" --user 100:101 \
    -v "$ADDONS:/mnt/extra-addons:ro" \
    -v "$OUT/stage:/mnt/jkg-new-addons:ro" \
    -v "$CONFIG:/mnt/jkg-test/odoo.conf:ro" \
    -v "$TMP_DATA:/mnt/jkg-data:rw" \
    --entrypoint /usr/bin/odoo "$ODOO_IMAGE" shell \
    --config=/mnt/jkg-test/odoo.conf --database="$TMP_DB" --no-http >> "$TEST_LOG" 2>&1 <<'PY'
import base64, io
from openpyxl import Workbook
module=env["ir.module.module"].sudo().search([("name","=","jkg_melocoton_product_ops")],limit=1)
assert module.state == "installed"
user_env=env(user=13)
new_wizard=user_env["jkg.melocoton.new.product.wizard"].create({"name":"JKG PRUEBA AUTOMATIZACION","price":1.23})
product=new_wizard._create_product(new_wizard.name,new_wizard.price,new_wizard.barcode)
assert product.available_in_pos and product.active and product.sale_ok and product.image_1920
price_wizard=user_env["jkg.melocoton.price.wizard"].create({"product_id":product.id,"new_price":1.24})
price_wizard.action_change_price()
assert abs(product.list_price-1.24)<0.001
wb=Workbook(); ws=wb.active; ws.append(["EAN","Nombre","Precio"]); ws.append(["","JKG PRUEBA EXCEL",2.34])
buf=io.BytesIO(); wb.save(buf)
import_wizard=user_env["jkg.melocoton.import.wizard"].create({"file_data":base64.b64encode(buf.getvalue()),"file_name":"test.xlsx"})
import_wizard.action_import()
assert env["product.template"].sudo().search_count([("name","=","JKG PRUEBA EXCEL")]) == 1
assert env["jkg.melocoton.product.operation.log"].sudo().search_count([]) >= 3
env.cr.rollback()
print("FUNCTIONAL_SMOKE=OK")
PY
SMOKE_RC=$?
set -e
[ "$SMOKE_RC" -eq 0 ] || fail FUNCTIONAL_SMOKE_FAILED
grep -q '^FUNCTIONAL_SMOKE=OK$' "$TEST_LOG" || fail FUNCTIONAL_MARKER_MISSING
cleanup
trap cleanup EXIT
echo "CLONE_INSTALL=OK"
echo "FUNCTIONAL_SMOKE=OK"

echo
echo "===== 5. PREPARAR ROLLBACK ====="
cat > "$ROLLBACK" <<ROLLBACK_EOF
#!/usr/bin/env bash
set -Eeuo pipefail
export LC_ALL=C.UTF-8 LANG=C.UTF-8
MODULE="$MODULE"
ADDONS="$ADDONS"
DEST="$DEST"
DB_DUMP="$DB_DUMP"
CODE_BACKUP="$CODE_BACKUP"
ODOO_WEB="$ODOO_WEB"
ODOO_DB="$ODOO_DB"
DB_NAME="$DB_NAME"
DB_USER="$DB_USER"
docker stop "\$ODOO_WEB"
docker exec "\$ODOO_DB" psql -U "\$DB_USER" -d postgres -X -v ON_ERROR_STOP=1 -c "SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname='\$DB_NAME' AND pid <> pg_backend_pid();"
docker exec "\$ODOO_DB" dropdb -U "\$DB_USER" "\$DB_NAME"
docker exec "\$ODOO_DB" createdb -U "\$DB_USER" "\$DB_NAME"
docker exec -i "\$ODOO_DB" pg_restore -U "\$DB_USER" -d "\$DB_NAME" --no-owner --no-privileges --exit-on-error < "\$DB_DUMP"
rm -rf "\$DEST"
if [ -s "\$CODE_BACKUP" ]; then tar -C "\$ADDONS" -xzf "\$CODE_BACKUP"; fi
docker start "\$ODOO_WEB"
for i in \$(seq 1 60); do
  code=\$(curl -LksS --connect-timeout 3 --max-time 8 -o /dev/null -w '%{http_code}' https://odoo.thejoseka.com/web/login || true)
  case "\$code" in 200|302|303) echo "ROLLBACK=OK"; exit 0;; esac
  sleep 2
done
echo "ROLLBACK_HTTP_FAILED" >&2
exit 1
ROLLBACK_EOF
chmod 0700 "$ROLLBACK"
bash -n "$ROLLBACK"
echo "ROLLBACK_READY=YES"

echo
echo "===== 6. INSTALAR EN PRODUCCIÓN ====="
rm -rf "$DEST.new"
cp -a "$STAGE" "$DEST.new"
chown -R root:root "$DEST.new"
find "$DEST.new" -type d -exec chmod 0755 {} +
find "$DEST.new" -type f -exec chmod 0644 {} +
rm -rf "$DEST"
mv "$DEST.new" "$DEST"

MODULE_STATE="$(docker exec "$ODOO_DB" psql -U "$DB_USER" -d "$DB_NAME" -X -A -t -v ON_ERROR_STOP=1 -c "SELECT COALESCE((SELECT state FROM ir_module_module WHERE name='$MODULE' LIMIT 1),'ABSENT');")"
MODE="--init=$MODULE"
[ "$MODULE_STATE" = "installed" ] && MODE="--update=$MODULE"
set +e
docker exec "$ODOO_WEB" /usr/bin/odoo server --config=/tmp/odoo-runtime.conf --database="$DB_NAME" "$MODE" --stop-after-init --no-http > "$INSTALL_LOG" 2>&1
INSTALL_RC=$?
set -e
if [ "$INSTALL_RC" -ne 0 ]; then
    echo "PRODUCTION_INSTALL_FAILED=YES"
    "$ROLLBACK" || true
    fail PRODUCTION_INSTALL_FAILED
fi

docker restart --timeout 30 "$ODOO_WEB" >/dev/null
for attempt in $(seq 1 60); do
    HTTP="$(http_code)"
    case "$HTTP" in 200|302|303) break;; esac
    sleep 2
done
case "$HTTP" in 200|302|303) ;; *) "$ROLLBACK" || true; fail ODOO_HTTP_AFTER ;; esac

echo
echo "===== 7. VERIFICACIÓN FINAL ====="
docker exec -i "$ODOO_WEB" /usr/bin/odoo shell --config=/tmp/odoo-runtime.conf --database="$DB_NAME" --no-http > "$OUT/final_validation.log" 2>&1 <<'PY'
module=env["ir.module.module"].sudo().search([("name","=","jkg_melocoton_product_ops")],limit=1)
assert module and module.state == "installed"
for model in (
 "jkg.melocoton.new.product.wizard",
 "jkg.melocoton.import.wizard",
 "jkg.melocoton.price.wizard",
 "jkg.melocoton.product.operation.log",
):
 assert model in env
user_env=env(user=13)
user_env["jkg.melocoton.new.product.wizard"].new({})._check_operator()
assert env["ir.ui.menu"].sudo().search_count([("name","=","Gestión rápida")]) >= 1
assert env["ir.actions.act_window"].sudo().search_count([("res_model","=","jkg.melocoton.new.product.wizard")]) == 1
assert env["ir.actions.act_window"].sudo().search_count([("res_model","=","jkg.melocoton.import.wizard")]) == 1
assert env["ir.actions.act_window"].sudo().search_count([("res_model","=","jkg.melocoton.price.wizard")]) == 1
env.cr.rollback()
print("PRODUCTION_FUNCTIONAL_VALIDATION=OK")
PY
grep -q '^PRODUCTION_FUNCTIONAL_VALIDATION=OK$' "$OUT/final_validation.log" || fail PRODUCTION_VALIDATION_FAILED

FINAL_STATE="$(docker exec "$ODOO_DB" psql -U "$DB_USER" -d "$DB_NAME" -X -A -t -v ON_ERROR_STOP=1 -c "SELECT state FROM ir_module_module WHERE name='$MODULE';")"
[ "$FINAL_STATE" = "installed" ] || fail MODULE_NOT_INSTALLED
sha256sum "$DB_DUMP" "$INSTALL_LOG" "$OUT/final_validation.log" > "$OUT/SHA256SUMS.txt"
chmod 0600 "$DB_DUMP" "$INSTALL_LOG" "$OUT/final_validation.log" "$OUT/SHA256SUMS.txt"

echo "MODULE_STATE=$FINAL_STATE"
echo "ODOO_HTTP=$HTTP"
echo "MERCEDES_USER_ID=13"
echo "NEW_PRODUCT_WIZARD=READY"
echo "EXCEL_IMPORT_WIZARD=READY"
echo "PRICE_CHANGE_WIZARD=READY"
echo "OPERATION_HISTORY=READY"
echo "ROLLBACK=$ROLLBACK"
echo "EVIDENCE_DIR=$OUT"
echo "OPENAI_API_USED=NO"
echo "JKG_MELOCOTON_PRODUCT_AUTOMATION=OK"
echo "============================================================"
