# EL MAPA NO ES EL TERRITORIO: MÉTRICAS VS REALIDAD

**Tiempo estimado**: 40 minutos
**Nivel**: SRE / Data Analyst
**Prerrequisitos**: Conceptos básicos de monitoreo (CPU, RAM)

## ¿Por qué importa este concepto?

Sun Tzu dice: *"El espionaje es esencial para las operaciones militares... Anhelamos conocer la situación del enemigo"*.
Pero advierte: *"No se puede obtener la verdad de los espíritus, ni de las inferencias, ni de la analogía con el pasado"*.

En sistemas, tenemos dashboards. Creemos que el dashboard es la realidad.
-   El dashboard dice: "CPU al 20% (Todo OK)".
-   La realidad: El usuario está furioso porque el botón de "Pagar" no funciona.

Este subtema trata sobre la **Disociación Observacional**. Cómo evitar monitorizar "ruido" (CPU, RAM) y empezar a monitorizar "señal" (Experiencia de Usuario).

## Conexión con conocimientos previos

Ya controlamos el despliegue (3.1). Ahora necesitamos ojos en el campo. Pero ojos que vean lo que importa, no solo lucecitas verdes.

---

## Comprensión intuitiva

### Métricas de Vanidad vs. Métricas de Dolor
-   **Vanidad (El Mapa Interno)**: "Tengo 1 millón de hits", "La base de datos responde en 5ms".
    -   *Peligro*: Puedes tener una DB rapidísima respondiendo errores 500. El dashboard está verde, el negocio está rojo.
-   **Dolor (El Territorio Real)**: "¿Cuántos usuarios completaron una compra hoy comparado con ayer?".
    -   *Verdad*: Si las compras cayeron 50%, algo está roto, aunque la CPU esté fresca como una lechuga.

### El Fenómeno de las "Tinieblas Silenciosas"
Ocurre cuando un sistema falla parcialmente pero no envía alertas.
Ejemplo: Un script de frontend falla silenciosamente en iPhones. El servidor no ve errores (porque la petición nunca sale del teléfono). Tus logs están limpios. Tus usuarios se están yendo.
**Solución**: RUM (Real User Monitoring). Espías en el dispositivo del cliente.

---

## Implementación práctica: Las 4 Golden Signals (SRE)

Google define qué mirar para no perderse en el mapa.

1.  **Latencia**: Tiempo que tarda en servir una petición. (Distinguir éxito vs error).
2.  **Tráfico**: Cuánta demanda hay (RPS).
3.  **Errores**: Tasa de fallos (explícitos 500s e implícitos de contenido).
4.  **Saturación**: Cuán "lleno" está el sistema (uso de recursos).

### Monitorización de Caja Negra (Blackbox)
No le preguntes al servidor cómo está. Intenta usarlo desde fuera.
Un script externo ("Synthetics") que intenta hacer Login cada minuto.
Si el script falla, hay alerta. No importa lo que digan los logs internos.
Esto es **Verificación Independiente**.

---

## Trampas y errores comunes

### ❌ Error: Alerta de CPU
Recibir un email a las 3 AM porque "La CPU llegó al 90%".
-   *¿Por qué es malo?*: Una CPU al 90% podría ser un proceso batch nocturno normal. Si el usuario no sufre, no despiertes al ingeniero.
-   *Sun Tzu*: *"Si el general es molestado con informes triviales, el ejército se cansa"*.
-   *Corrección*: Alerta sobre **Síntomas** (Latencia alta, Errores), no sobre **Causas** (CPU, Disco).

### ❌ Error: Promedios Mentirosos
"La latencia promedio es 200ms".
-   *Realidad*: El 90% va a 50ms, y el 10% va a 10 segundos.
-   El promedio esconde la miseria.
-   *Corrección*: Usa **Percentiles** (p95, p99). "El 99% de los usuarios experimentan < 500ms". Eso es honestidad brutal.

---

## Resumen

**En una frase**: Monitoriza la experiencia del usuario, no la salud del servidor.

**Cuándo usarlo**:
-   Al definir alertas en PagerDuty/OpsGenie.
-   Cuando el dashboard está verde pero Soporte recibe quejas.

**Siguiente paso**: Profundizaremos en cómo construir esta red de inteligencia con **Observabilidad Distribuida** (3.2.2).
