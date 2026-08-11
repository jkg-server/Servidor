# Inicio rápido

## Requisitos

- Ubuntu o Debian con `apt-get`.
- Usuario con `sudo`.
- Conectividad a Internet para instalar componentes opcionales.

## Preparación

```bash
mkdir -p config
install -m 0600 templates/bootstrap.env.example config/bootstrap.env
nano config/bootstrap.env
bash tools/config-check.sh
```

Antes de activar UFW, confirma el puerto real de SSH. La plantilla lo deja desactivado por seguridad.

## Ejecución

```bash
sudo ./run.sh bootstrap
```

También puedes ejecutar una única fase con `sudo ./run.sh step <fase>`.

## Verificación

```bash
./run.sh check
bash tools/validate.sh
```
