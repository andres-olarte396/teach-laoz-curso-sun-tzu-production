# REDES DE ESPIONAJE: OBSERVABILIDAD DISTRIBUIDA

**Tiempo estimado**: 50 minutos
**Nivel**: Arquitecto / Backend Dev
**Prerrequisitos**: Log levels, HTTP headers

## ¿Por qué importa este concepto?

Sun Tzu dedica todo un capítulo a los espías. _"El conocimiento previo no puede obtenerse de fantasmas... debe obtenerse de personas que conozcan la situación del enemigo"_.
En microservicios o sistemas complejos, una petición entra por el servicio A, llama al B, que llama a la DB y devuelve al C.
Si falla, ¿quién tiene la culpa?
Sin **Observabilidad Distribuida** (Tracing), somos ciegos peleando en la niebla.

## Conexión con conocimientos previos

Ya sabemos que el Mapa (Dashboard) miente (3.2.1). Ahora instalamos "rastreadores" en cada paquete de datos para construir un mapa verdadero en tiempo real.

---

## Comprensión intuitiva

### El ID de Correlación (El Hilo de Ariadna)

Imagina que cada petición HTTP que entra al sistema recibe una etiqueta invisible: `Trace-ID: abc-123`.

- El Servicio A recibe `abc-123`. Loguea: "Recibí abc-123".
- Llama al Servicio B y le pasa el header `abc-123`.
- El Servicio B loguea: "Procesando abc-123". Falla.
- Tú buscas en tus logs "abc-123" y ves toda la historia, paso a paso, a través de 50 servidores.
  Sin esto, tienes 50 archivos de log inconexos.

### Logs vs. Métricas vs. Traces

- **Métricas**: "¿Qué pasa?" (El síntoma). _Ej: La latencia subió._
- **Traces (Rastreo)**: "¿Dónde pasa?" (La localización). _Ej: El servicio de Pagos está lento._
- **Logs**: "¿Por qué pasa?" (La causa raíz). _Ej: NullPointerException en PagosController.java:45._
  Un buen sistema de espionaje usa los tres.

---

## Implementación práctica: OpenTelemetry

### Instrumentación Automática

No ensucies tu código con `print("llegué aquí")`.
Usa librerías de OpenTelemetry que interceptan el tráfico.

```python
# Flask App con Auto-instrumentación
from opentelemetry.instrumentation.flask import FlaskInstrumentor

app = Flask(__name__)
FlaskInstrumentor().instrument_app(app)

@app.route("/checkout")
def checkout():
    # Automáticamente genera un Trace Span
    # Automáticamente propaga el Trace-ID al microservicio de inventario
    requests.get("http://inventory-service/check")
    return "OK"
```

### Visualización en Cascada (Waterfall)

Herramientas como Jaeger/Grafana Tempo te muestran la "Cascada":

- `[==========] (Total 200ms)`
- `..[===] (Auth 30ms)`
- `.....[===============] (DB Query 150ms)` -> **Aquí está el culpable**.
- `....................[=] (Response 10ms)`

---

## Trampas y errores comunes

### ❌ Error: Logging Síncrono Bloqueante

Escribir logs a un archivo en disco o enviar a red dentro del hilo principal de la petición.

- **Efecto**: Tu sistema de espionaje ralentiza tu ejército.
- **Solución**: Logs asíncronos (`fire and forget`). Que el agente de logs lo recoja después.

### ❌ Error: "Espiarlo Todo" (Over-tracing)

Guardar el 100% de los traces.

- **Efecto**: Costo de almacenamiento astronómico.
- **Sun Tzu**: _"No uses espías si no puedes pagarles"_.
- **Solución**: Sampling (Muestreo). Guarda solo el 1% de las peticiones exitosas y el 100% de los errores. Conoces al enemigo sin arruinarte.

---

## Resumen

**En una frase**: Un error sin Trace-ID es un crimen sin resolver.

**Cuándo usarlo**:

- Obligatorio en cualquier arquitectura de Microservicios.
- Cuando los desarrolladores dicen "En mi máquina funciona" pero en prod falla.

**Siguiente paso**: Con la inteligencia asegurada, cerramos el Módulo 3. El sistema está operando. Módulo 4: **Crisis y Recuperación**.
