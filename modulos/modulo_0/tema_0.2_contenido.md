# CONFIGURACIÓN DEL DOJO: LAS ARMAS DEL ESTRATEGA

**Tiempo estimado**: 30 minutos
**Tipo**: Taller Práctico

## OBJETIVO

Preparar el entorno de desarrollo local ("El Dojo") con las herramientas necesarias para ejecutar los ejercicios y simulaciones del curso.

## HERRAMIENTAS REQUERIDAS

### 1. Docker y Docker Compose

Sun Tzu dice: _"El que ocupa el terreno primero y espera al enemigo, está descansado"_.
Usaremos Docker para provisionar infraestructura (bases de datos, servicios) sin ensuciar tu sistema operativo.

- **Instalación**: [Docker Desktop](https://www.docker.com/products/docker-desktop) o Randancher Desktop.
- **Verificación**:

  ```bash
  docker --version
  docker-compose --version
  ```

### 2. Node.js (LTS)

Para ejecutar los scripts de simulación y herramientas de CLI.

- **Versión**: v18 o superior.
- **Verificación**: `node -v`

### 3. Visual Studio Code

El centro de mando.

- **Extensiones recomendadas**:
  - _Docker_: Para manejar contenedores visualmente.
  - _Mermaid.js Preview_: Para ver nuestros diagramas de arquitectura.
  - _Markdown All in One_: Para leer el contenido.

### 4. Git

Para clonar el repositorio de ejercicios y gestionar versiones.

---

## EJERCICIO DE CONFIGURACIÓN

1. Crea una carpeta `sun-tzu-dojo`.
2. Crea un archivo `docker-compose.yml` de prueba:

    ```yaml
    version: "3"
    services:
      hello-world:
        image: hello-world
    ```

3. Ejecuta `docker-compose up`.
4. Si ves "Hello from Docker!", tu armería está lista.

## FILOSOFÍA DEL ENTORNO

En este curso, trataremos la infraestructura como código. No instales bases de datos manualmente. Úsalas siempre en contenedores efímeros. Esto entrena la mentalidad "Ganado, no Mascotas" desde el día 0.
