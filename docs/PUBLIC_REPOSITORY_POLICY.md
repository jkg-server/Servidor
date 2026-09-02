# Política del repositorio público

`Servidor` es una plantilla genérica, no la fuente de verdad de producción.

## Aceptación de cambios

Un cambio solo pertenece aquí cuando:

- puede reutilizarse sin conocer JKG-SERVER ni un cliente;
- funciona con marcadores y valores locales;
- no necesita datos, credenciales o rutas reales;
- incluye una verificación reproducible;
- mantiene una reversión clara cuando modifica el host.

Todo despliegue, módulo, inventario, runbook o configuración específica debe ir a su repositorio privado correspondiente.

## Control automático

`tools/repo-policy.sh` rechaza rutas de despliegue, backups, secretos, evidencias, volcados, archivos Base64, comprimidos de configuración, `.env` reales, ficheros grandes y direcciones privadas/CGNAT.

Gitleaks complementa esta frontera en GitHub Actions.
