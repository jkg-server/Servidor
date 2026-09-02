# Servidor · bootstrap público seguro

Bootstrap genérico para preparar una máquina Ubuntu o Debian con una base mínima y auditable. Este repositorio es público y no representa una copia de JKG-SERVER ni de ningún cliente.

## Alcance

- Paquetes básicos de administración.
- UFW y Fail2ban opcionales.
- Docker Engine y Docker Compose opcionales.
- Tailscale opcional.
- Comprobaciones de sintaxis, seguridad y frontera pública.

La infraestructura real, los módulos de clientes, las rutas de producción y los procedimientos internos se mantienen en repositorios privados separados.

## Uso rápido

```bash
git clone https://github.com/jkg-server/Servidor.git
cd Servidor
mkdir -p config
install -m 0600 templates/bootstrap.env.example config/bootstrap.env
nano config/bootstrap.env
sudo ./run.sh bootstrap
```

UFW está desactivado en la plantilla para evitar bloquear un servidor remoto por una configuración SSH incorrecta. Actívalo solo después de revisar `SSH_PORT`.

## Ejecución por fases

```bash
sudo ./run.sh step init
sudo ./run.sh step security
sudo ./run.sh step docker
sudo ./run.sh step tailscale
./run.sh check
```

Cada ejecución escribe un registro local en `logs/`, ruta ignorada por Git.

## Validación del repositorio

```bash
bash tools/validate.sh
```

La validación comprueba sintaxis Bash, ShellCheck cuando está instalado y la frontera pública: no admite despliegues de clientes, copias de seguridad, volcados, archivos de configuración empaquetados ni `.env` reales.

## Relación con los repositorios privados

| Repositorio | Función |
|---|---|
| `Servidor` | Bootstrap público, genérico y sin datos reales. |
| `jkg-server-bootstrap` | Orquestación privada de altas y recuperación. |
| `jkg-server-restore` | Runbooks y utilidades de restauración controlada. |
| `jkg-server-infra` | Infraestructura saneada y documentación canónica privada. |
| `jkg-server-jkg-odoo-addons` | Addons Odoo propios y específicos, siempre privado. |

## Regla de seguridad

No se aceptan secretos, credenciales, tokens, claves privadas, `.env` reales, copias de seguridad, volcados SQL, datos de clientes, dominios o direcciones reales de producción. Consulta [SECURITY.md](SECURITY.md) y [la política pública](docs/PUBLIC_REPOSITORY_POLICY.md).
