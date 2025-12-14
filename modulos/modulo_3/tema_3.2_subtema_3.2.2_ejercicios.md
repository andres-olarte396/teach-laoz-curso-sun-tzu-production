# BANCO DE EJERCICIOS: MÓDULO 3.2 - REDES DE ESPIONAJE

## METADATA
- **Subtema**: 3.2.2 (Observabilidad Distribuida)
- **Nivel**: Avanzado

---

## EJERCICIO 1: EL TRACE PERDIDO

### ENUNCIADO
Un usuario reporta un error. Te da la hora: "14:02 PM".
Tienes 5 microservicios.
En los logs del Servicio A a las 14:02 hay 10,000 peticiones.
¿Cómo encuentras la petición del usuario *sin* Trace-ID?
¿Cuánto tiempo te tomaría?

### SOLUCIÓN
**Sin Trace-ID**: Es casi imposible. Tienes que buscar por IP (si se loguea), o correlación temporal aproximada. Te tomará horas. Es "buscar una aguja en un pajar".
**Lección**: El costo de no implementar Tracing es el tiempo perdido de tus ingenieros más caros durante incidentes.

---

## EJERCICIO 2: SAMPLING STRATEGY

### ENUNCIADO
Tu sistema procesa 10,000 peticiones por segundo (RPS).
El proveedor de Observabilidad (Datadog/New Relic) cobra por Gb de logs. El equipo de Finanzas te pide reducir costos un 90%.
Diseña una estrategia de muestreo (Sampling) inteligente.

### SOLUCIÓN
**Head-based Sampling**:
1.  **Tráfico Sano (HTTP 200)**: Guardar aleatoriamente solo el 1% (1 de cada 100). Sirve para estadísticas generales.
2.  **Tráfico Enfermo (HTTP 5xx, 4xx)**: Guardar el **100%**. Necesitamos cada detalle forense de los errores.
3.  **Tráfico Lento (Latencia > 2s)**: Guardar el **100%**.
**Resultado**: Reduces el volumen masivamente (>90%) sin perder la información crítica (errores y lentitud).

---

## EJERCICIO 3: CONTEXT PROPAGATION

### ENUNCIADO
Tienes un Frontend (React), un API Gateway (Node) y un Backend (Python).
El Frontend genera un `x-request-id: uuid-123`.
El API Gateway recibe la petición, hace un log, y llama al Backend.
El Backend recibe la petición pero *no recibe* el header `x-request-id`.

¿Dónde está el error de "Espionaje"? Diagrama la corrección.

### SOLUCIÓN
**Error**: El API Gateway está rompiendo la cadena de custodia. No está reenviando (propagando) los headers de contexto.
**Corrección**:
En el código del Gateway (Node):
```javascript
const upstreamRequest = {
  headers: {
    // CRÍTICO: Copiar el ID entrante al saliente
    'x-request-id': req.headers['x-request-id'] || generateNewId() 
  }
};
http.get(backendUrl, upstreamRequest);
```
Sin propagación explícita, el Trace se rompe.
