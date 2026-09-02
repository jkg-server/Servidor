# Arquitectura pública

Este repositorio contiene exclusivamente un bootstrap genérico. No describe la topología, dominios, direcciones, puertos internos, contenedores ni rutas de ningún entorno real.

## Capas

1. `run.sh`: orquestación y registro.
2. `tools/config-check.sh`: validación previa sin mostrar secretos.
3. `bootstrap/`: pasos independientes y legibles.
4. `tools/validate.sh`: sintaxis, ShellCheck y política pública.
5. `config/bootstrap.env`: configuración local no versionada.

La reconstrucción de un entorno real debe combinar este punto de partida con inventarios, plantillas y copias privadas verificadas.
