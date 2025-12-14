# GUIÓN: REDES DE ESPIONAJE (OBSERVABILIDAD)

## FICHA TÉCNICA
- **Duración**: 10 Minutos
- **Tono**: Investigador forense.

---

### 00:00 - INTRODUCCIÓN

**[LOCUTOR]**:
Tienes un sistema de Microservicios. 20 servicios hablando entre sí.
El usuario hace click. Falla.
¿Quién fue?
¿Fue el servicio de Auth? ¿El de Pagos? ¿La Base de Datos? ¿La Red?
Sin espías, no lo sabes. Solo ves el cadáver (el error 500).

**[LOCUTOR]**:
Sun Tzu dedica el último capítulo a los espías.
En software, esto se llama **Traza Distribuida** (Distributed Tracing).
Es ponerle una etiqueta, un GPS, a cada petición que entra.

---

### 03:00 - EL HILO DE ARIADNA

**[LOCUTOR]**:
El concepto es el Trace-ID.
Imagina que cuando entras al banco, te pegan una calcomanía en la espalda con el número "88".
Vas a la ventanilla A. El cajero anota: "Atendí al 88".
Vas a la ventanilla B. El gerente anota: "Atendí al 88".
Sales.

**[LOCUTOR]**:
Si te roban la cartera, la policía solo busca "88" y reconstruye tu camino paso a paso.
En sistemas, esto te permite ver la "Cascada".
Ves exactamente dónde se frenó la petición. Dónde se rompió.
Conviertes una caja negra en una caja de cristal.

---

### 06:00 - EL COSTO DE LA INTELIGENCIA

**[LOCUTOR]**:
Pero espiar cuesta dinero. Guardar trillones de logs es caro.
Sun Tzu dice: *"No uses espías si no puedes pagarles"*.
La solución es el Muestreo (Sampling).
No guardes todo. Guarda los errores. Guarda lo lento.
Y tira a la basura el 99% de lo que salió bien. Lo que salió bien no te enseña nada.

---

### 09:00 - CIERRE

**[LOCUTOR]**:
Implementar OpenTelemetry o Datadog no es opcional hoy en día.
Si estás construyendo sistemas distribuidos sin Tracing, estás operando a ciegas.
Y en la guerra, el general ciego siempre pierde.

Hasta la próxima.
