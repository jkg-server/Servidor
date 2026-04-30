# Servidor · Bootstrap genérico seguro

Repositorio público para preparar una máquina Ubuntu/Debian desde cero con una base mínima, reproducible y sin datos de JKG-SERVER real.

## Objetivo

Dejar un servidor limpio con:

- Paquetes base de administración.
- Firewall UFW opcional.
- Fail2ban opcional.
- Docker + Docker Compose opcional.
- Tailscale opcional.

## Límites de seguridad

Este repositorio **no debe contener nunca**:

- IPs reales de producción.
- Dominios reales.
- Credenciales.
- Tokens.
- Claves privadas.
- Backups.
- Ficheros `.env` reales.

Lo específico de producción va en repositorios privados separados.

## Relación con otros repositorios

| Repo | Función |
|---|---|
| `Servidor` | Bootstrap genérico y público. |
| `jkg-server-bootstrap` | Orquestador privado para una recuperación o alta nueva. |
| `jkg-server-restore` | Manuales y utilidades de restauración controlada. |
| `jkg-server-infra` | Infraestructura privada, plantillas y disaster-recovery saneado. |

## Uso rápido

```bash
git clone https://github.com/jkg-server/Servidor.git
cd Servidor
cp config/bootstrap.env.example config/bootstrap.env
sudo ./run.sh bootstrap
```

## Ejecutar por fases

```bash
sudo ./run.sh step init
sudo ./run.sh step security
sudo ./run.sh step docker
sudo ./run.sh step tailscale
```

## Configuración

Edita `config/bootstrap.env` antes de ejecutar:

```bash
SSH_PORT=22
UFW_ENABLE=1
FAIL2BAN_ENABLE=1
DOCKER_ENABLE=1
TAILSCALE_ENABLE=0
TS_AUTHKEY=
TS_EXTRA_ARGS=
```

## Validación posterior

```bash
systemctl status docker --no-pager || true
systemctl status fail2ban --no-pager || true
ufw status verbose || true
docker --version || true
docker compose version || true
tailscale status || true
```

## Criterio de diseño

- Seguro por defecto.
- Idempotente cuando sea razonable.
- Sin secretos.
- Sin datos de clientes.
- Fácil de leer, auditar y repetir.
