# Servidor (Bootstrap genérico)

Repo base para arrancar Ubuntu/Debian desde cero (seguridad + Docker + opcional Tailscale).

Regla:
- Nada específico del JKG-SERVER real aquí (IPs, dominios, rutas reales, credenciales).
- Lo específico va en `jkg-server-infra`.
- El plan de desastre va en `jkg-server-restore`.

Uso:
  sudo ./run.sh bootstrap
