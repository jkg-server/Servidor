# Variables de `bootstrap.env`

| Variable | Valores | Predeterminado | Función |
|---|---:|---:|---|
| `SSH_PORT` | `1`–`65535` | `22` | Puerto que UFW debe permitir. |
| `UFW_ENABLE` | `0` o `1` | `0` | Activa el firewall. |
| `FAIL2BAN_ENABLE` | `0` o `1` | `1` | Instala y activa Fail2ban. |
| `DOCKER_ENABLE` | `0` o `1` | `1` | Instala Docker Engine y Compose. |
| `TAILSCALE_ENABLE` | `0` o `1` | `0` | Instala Tailscale. |
| `TS_AUTHKEY` | texto o vacío | vacío | Clave efímera de Tailscale; nunca se versiona. |
| `TS_EXTRA_ARGS` | texto o vacío | vacío | Argumentos adicionales para `tailscale up`. |

El fichero real debe estar en `config/bootstrap.env`, con permisos `0600`, y está ignorado por Git.
