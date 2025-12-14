# EJERCICIOS: 0.2 - CONFIGURACIÓN DEL DOJO

## EJERCICIO 1: EL RITUAL DE INICIACIÓN (DOCKER)

Tu primera misión no es estratégica, es logística.

1. Crea un archivo `docker-compose.yml` que levante una base de datos Postgres (imagen `postgres:alpine`).
2. Configura las variables de entorno para usuario/password.
3. Conéctate a ella desde una herramienta externa (DBeaver o extensión de VSCode).
    **Objetivo**: Demostrar que puedes provisionar infraestructura en 2 minutos sin instalar nada en tu OS base.

## EJERCICIO 2: LIMPIEZA DEL ARSENAL

1. Destruye el contenedor (`docker-compose down`).
2. Elimina el volumen asociado.
3. Vuelve a levantarlo.
    **Reflexión**: ¿Perdiste datos? Si sí, acabas de aprender la importancia de los Volúmenes Persistentes antes de tocar Producción.
