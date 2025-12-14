# CUESTIONARIO Y SOLUCIONARIO: TEMA 2.1 (DISEÑO ANTI-FRÁGIL)

## CUESTIONARIO

### Instrucciones

Valida tu comprensión sobre la inmutabilidad y la gestión del riesgo.

### Pregunta 1: El Servidor Mascota

Descubres un error crítico de configuración en un servidor de producción. La solución rápida es entrar por SSH y cambiar una línea en `nginx.conf`.
¿Por qué esta acción viola el principio de "Defensa Primero"?

- [ ] a) Porque es inseguro usar SSH.
- [ ] b) Porque crea "Configuration Drift" (desviación), haciendo que el servidor sea una "Mascota" única e irreproducible.
- [ ] c) Porque Nginx no debe usarse en producción.

### Pregunta 2: El Costo del 100%

Tu jefe te pide garantizar que el sistema nunca, jamás, se caiga.
¿Cuál es la respuesta basada en SRE?

- [ ] a) "¡Sí, señor! Lo haremos."
- [ ] b) "Imposible. El 100% de confiabilidad significa 0% de velocidad de innovación. Necesitamos un margen de error (Budget) para poder hacer cambios."
- [ ] c) "Necesitamos comprar servidores más caros."

### Pregunta 3: Política de Error Budget

Tu equipo ha consumido todo el "Error Budget" del mes debido a una mala actualización. Aún quedan 10 días del mes. El Product Owner quiere lanzar una nueva feature mañana.
¿Cuál es la decisión correcta?

- [ ] a) Lanzar la feature con cuidado.
- [ ] b) Declarar "Feature Freeze". Solo se permiten deploys que mejoren la estabilidad hasta que se recargue el presupuesto.
- [ ] c) Ignorar el presupuesto y lanzar, porque el negocio manda.

---

## SOLUCIONARIO

### Respuesta 1

**Correcta: b) Porque crea "Configuration Drift"**
**Explicación**: El principio de Inmutabilidad exige que cualquier cambio se haga en el código (IaC/Dockerfile) y se despliegue reemplazando el recurso. Editar en vivo crea un estado desconocido que no sobrevive a un reinicio o escalado automático.

### Respuesta 2

**Correcta: b) Imposible. El 100% frena la innovación.**
**Explicación**: La confiabilidad total es asintóticamente cara y bloqueante. Para que un sistema evolucione (ataque), debe asumir riesgos. El Error Budget cuantifica ese riesgo aceptable.

### Respuesta 3

**Correcta: b) Declarar "Feature Freeze".**
**Explicación**: El Error Budget es un contrato. Si se gasta, la prioridad cambia de "Velocidad" a "Fiabilidad" obligatoriamente. Si no se respeta esta regla, el sistema se degradará hasta el colapso.
