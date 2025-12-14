# CUESTIONARIO Y SOLUCIONARIO: TEMA 1.2 (ECONOMÍA DEL CYCLE TIME)

## CUESTIONARIO

### Instrucciones

Valida tu entendimiento sobre la logística de guerra aplicada al software.

### Pregunta 1: El Costo Oculto

Estás liderando un proyecto. Un stakeholder pide un cambio de última hora ("Scope Creep") que retrasará el lanzamiento 1 mes. El costo del equipo es $10k y el beneficio esperado del producto es $5k/mes.
¿Cuál es el costo _real_ de decir "Sí" a ese cambio?

- [ ] a) $10,000 (Solo el salario del equipo)
- [ ] b) $15,000 (Salario + Lo que se dejó de ganar)
- [ ] c) $5,000 (Solo el beneficio perdido)

### Pregunta 2: Filosofía de Automatización

Tu equipo gasta 4 horas a la semana haciendo deploys manuales aburridos pero seguros. Automatizarlo tomaría 20 horas de trabajo.
Según la lógica del "Multiplicador de Logística", ¿deberías automatizarlo?

- [ ] a) No, porque 20 horas es mucho tiempo de inversión inicial.
- [ ] b) Sí, porque en 5 semanas recuperas la inversión (ROI) y eliminas el riesgo humano para siempre.
- [ ] c) No, porque es mejor que un humano supervise el proceso manualmente.

### Pregunta 3: Forrajear del Enemigo

Necesitas un sistema de comentarios para tu blog.
Opción A: Programar tu propio backend de comentarios (2 semanas).
Opción B: Usar Disqus/Giscus (1 hora de integración).
Opción C: No poner comentarios.
¿Cuál es la opción alineada con "Alimentarse del enemigo"?

- [ ] a) Opción A
- [ ] b) Opción B
- [ ] c) Opción C

---

## SOLUCIONARIO

### Respuesta 1

**Correcta: b) $15,000**
**Explicación**: El Costo de Retraso siempre suma el _Burn-rate_ (lo que gastas manteniento las luces encendidas, $10k) más el _Opportunity Cost_ (lo que hubieras ganado si estuvieras en el mercado, $5k). Ignorar el costo de oportunidad es el error más común de los managers novatos.

### Respuesta 2

**Correcta: b) Sí, automatizar.**
**Explicación**: La automatización es una inversión de capital (CapEx) para reducir el gasto operativo (OpEx). 20 horas se pagan en 5 semanas. Después de eso, es "tiempo gratis" y mayor seguridad. Estratégicamente, libera a tu "ejército" para pelear batallas reales, no para mover cajas.

### Respuesta 3

**Correcta: b) Opción B (Disqus/Giscus)**
**Explicación**: "Alimentarse del enemigo" significa usar los recursos que ya existen en el ecosistema en lugar de gastar tu propia logística (tiempo de dev) transportándolos/creándolos. Programar tu propio sistema de comentarios (Opción A) es una carga logística innecesaria a menos que tu negocio sea vender sistemas de comentarios.
