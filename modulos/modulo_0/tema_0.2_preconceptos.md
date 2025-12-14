# ANÁLISIS DE PRECONCEPTOS: TEMA 0.2 (CONFIGURACIÓN DEL DOJO)

## 1. CONCEPTOS FUNDAMENTALES

- **Contenerización (Docker)**: La idea de aislar aplicaciones para que funcionen igual en todas partes.
- **Infrastructure as Code (IaC)**: Definir el entorno en un archivo (`docker-compose.yml`) en lugar de instalar manualmente.
- **IDE (Environment)**: Tu mesa de trabajo digital.

## 2. ANALOGÍAS BASE

- **El Dojo**: Un lugar sagrado de entrenamiento donde el error es bienvenido. A diferencia del campo de batalla (Producción) donde el error es fatal.
- **Cattle (Ganado)**: Tus herramientas locales también deben ser desechables. Si tu PC explota, deberías poder levantar todo en otra PC en 10 minutos.

## 3. TRAMPAS COGNITIVAS

- _Trampa_: "Instalar Node en mi Windows es suficiente".
  - _Corrección_: Eso crea "Works on my machine". Usa Docker para evitar discrepancias de versiones.
