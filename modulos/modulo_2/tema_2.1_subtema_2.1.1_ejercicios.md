# BANCO DE EJERCICIOS: MÓDULO 2.1 - DISEÑO ANTI-FRÁGIL

## METADATA
- **Subtema**: 2.1.1 (Inmutabilidad)
- **Nivel**: Intermedio

---

## EJERCICIO 1: AUDITORÍA DE INMUTABILIDAD

### ENUNCIADO
Analiza los siguientes escenarios e indica si violan el principio de Infraestructura Inmutable. Si lo hacen, explica por qué y cómo corregirlo.

1.  **Escenario A**: Un script cron se conecta cada noche a las instancias EC2 para borrar logs antiguos (`rm /var/log/*.log`).
2.  **Escenario B**: La aplicación escribe las fotos subidas por usuarios en `/app/uploads` dentro del contenedor.
3.  **Escenario C**: Para actualizar la versión de Node.js, Terraform destruye la instancia vieja y crea una nueva con la nueva AMI.

### SOLUCIÓN
1.  **Escenario A**: **VIOLACIÓN**. Modificar un servidor en ejecución (borrar archivos) es mutabilidad.
    -   *Corrección*: Configurar el driver de logs de Docker para enviar logs a un servicio externo (CloudWatch/Splunk) y que roten solos. El servidor no debe tener estado que limpiar.
2.  **Escenario B**: **VIOLACIÓN GRAVE**. El sistema de archivos del contenedor es efímero. Si el contenedor muere, las fotos se pierden.
    -   *Corrección*: Usar almacenamiento de objetos externo (S3, Azure Blob) o montar un volumen persistente de red.
3.  **Escenario C**: **CORRECTO**. Cumple el principio de "Reemplazar, no arreglar".

---

## EJERCICIO 2: DOCKERFILE STRATEGY

### ENUNCIADO
Tienes una aplicación que necesita un archivo de configuración `config.json` que cambia entre Dev, Staging y Prod.
Un desarrollador propone: "Hagamos 3 imágenes Docker distintas: `miap:dev`, `miap:stag`, `miap:prod`, cada una con su `COPY config.json` dentro."

¿Es esto estratégico? ¿Por qué?

### SOLUCIÓN
**No, es un anti-patrón**.
-   **Razón**: Violas el principio de "Build Once, Deploy Anywhere". Si la imagen de Prod es diferente a la de Dev, no has probado realmente lo que vas a desplegar.
-   **Estrategia Inmutable Correcta**: La imagen debe ser agnóstica (`miap:v1`). La configuración se inyecta en tiempo de ejecución vía **Variables de Entorno** o Montaje de ConfigMaps (Kubernetes). La *imagen* es inmutable; el *entorno* le da el contexto.
