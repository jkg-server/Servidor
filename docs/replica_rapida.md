# Réplica rápida

Este repositorio prepara el sistema base; no restaura aplicaciones ni datos reales.

## Orden seguro

1. Instalar un sistema operativo compatible y crear un usuario administrador.
2. Revisar `bootstrap.env` y ejecutar el bootstrap por fases.
3. Verificar SSH antes de activar UFW.
4. Recuperar la infraestructura desde repositorios privados y copias verificadas.
5. Restaurar datos siguiendo el runbook privado correspondiente.
6. Validar cada servicio antes de publicar tráfico.
7. Documentar el punto estable y el rollback.

No uses este repositorio como sustituto de una copia de seguridad.
