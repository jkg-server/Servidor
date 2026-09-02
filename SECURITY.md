# Seguridad

## Contenido permitido

- Scripts genéricos.
- Documentación pública sin datos reales.
- Plantillas con valores vacíos o marcadores.
- Pruebas y validaciones que no requieran secretos.

## Contenido prohibido

- Credenciales, tokens, claves o certificados privados.
- `.env` reales.
- Direcciones, dominios, puertos, rutas o inventarios de producción.
- Código, nombres, catálogos o datos específicos de clientes.
- Backups, volcados, evidencias, facturas y archivos empaquetados de configuración.

Si se detecta una exposición, retira el contenido de la rama activa, revoca cualquier secreto afectado y evalúa una limpieza controlada del historial. No publiques el secreto en una incidencia.
