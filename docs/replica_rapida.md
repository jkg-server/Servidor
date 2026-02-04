# Réplica rápida (PÚBLICO)

Objetivo: tener una guía para reconstruir el servidor **sin exponer secretos**.

## Pasos (alto nivel)
1. Provisionar Ubuntu LTS + usuario admin.
2. Instalar Nginx + Docker (si aplica) + dependencias base.
3. Restaurar estructura de vhosts (sin puertos/secretos aquí).
4. En entorno real: aplicar la Biblia privada (puertos, upstreams, rutas, servicios).
5. Validación: `nginx -t` y test por dominios.

> Los detalles exactos (puertos internos, upstreams, rutas sensibles) están en el repo privado.
