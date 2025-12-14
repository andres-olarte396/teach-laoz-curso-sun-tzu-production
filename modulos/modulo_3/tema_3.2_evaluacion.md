# CUESTIONARIO Y SOLUCIONARIO: TEMA 3.2 (LOGÍSTICA DE DATOS Y OBSERVABILIDAD)

## CUESTIONARIO

### Instrucciones

Prueba tu capacidad para distinguir la verdad del ruido en el campo de batalla de datos.

### Pregunta 1: El Promedio Tramposo

Tu jefe dice: "El tiempo de respuesta promedio es 200ms. ¡Vamos genial!".
Tú sabes que el 5% de los usuarios tarda 10 segundos.
¿Qué métrica usarías para demostrarle la realidad del dolor del usuario?

- [ ] a) La Mediana.
- [ ] b) El Percentil 95 (p95) o p99.
- [ ] c) La Desviación Estándar.

### Pregunta 2: Blackbox vs Whitebox

Tienes un dashboard interno lleno de luces verdes (Whitebox Monitoring).
Sin embargo, los usuarios en Twitter dicen que no pueden entrar.
¿Qué herramienta te falta para detectar esto automáticamente?

- [ ] a) Un script sintético externo (Blackbox) que intente loguearse como un usuario real.
- [ ] b) Más logs de la base de datos.
- [ ] c) Un firewall más potente.

### Pregunta 3: El Misterio del Microservicio

Una petición pasa por A -> B -> C -> D. Falla en D.
El ingeniero mira los logs de A y dice "Todo salió bien".
¿Qué pieza de tecnología falta para conectar la historia?

- [ ] a) Más memoria RAM en A.
- [ ] b) Un Trace-ID (Distributed Tracing) que se propague de A hasta D.
- [ ] c) Una base de datos compartida entre todos.

---

## SOLUCIONARIO

### Respuesta 1

**Correcta: b) El Percentil 95 (p95).**
**Explicación**: El p95 te dice el tiempo máximo que experimentan el 95% de tus usuarios (excluyendo solo el 5% peor). Si el p95 es 10 segundos, significa que 5 de cada 100 usuarios están sufriendo horriblemente. El promedio diluye ese dolor. En sistemas, optimizamos para el p95 o p99, nunca para el promedio.

### Respuesta 2

**Correcta: a) Script sintético externo (Blackbox).**
**Explicación**: El monitoreo interno (Whitebox) puede estar sesgado (ej. el balanceador de carga no está dejando pasar tráfico, así que los servidores internos están "ociosos y felices"). Solo un agente externo simulando ser un usuario te da la verdad del terreno.

### Respuesta 3

**Correcta: b) Un Trace-ID (Distributed Tracing).**
**Explicación**: Sin un ID único que viaje con la petición (Context Propagation), los logs son silos de información aislados. El Trace-ID es el hilo conductor que permite reconstruir la narrativa del crimen a través de múltiples fronteras de servicio.
