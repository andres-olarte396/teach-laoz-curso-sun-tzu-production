# CUESTIONARIO Y SOLUCIONARIO: TEMA 3.3 (ADAPTABILIDAD Y CAOS)

## CUESTIONARIO

### Instrucciones
¿Estás listo para cuando todo salga mal?

### Pregunta 1: Principio de Chaos Engineering
¿Cuál es el objetivo principal de inyectar fallos (Chaos Engineering) en un sistema?
- [ ] a) Divertirse rompiendo cosas.
- [ ] b) Generar "Inmunidad Sistémica" encontrando debilidades ocultas de forma controlada antes de que ocurran en la realidad.
- [ ] c) Comprobar si los desarrolladores están trabajando.

### Pregunta 2: Roles de Incidente
Durante una caída crítica del sistema, el CTO empieza a escribir comandos SQL directamente en la base de datos mientras atiende la llamada con el CEO.
¿Qué anti-patrón de Command & Control está ocurriendo?
- [ ] a) Ninguno, el CTO es el más capacitado.
- [ ] b) Falla de Roles. El "Incident Commander" (CTO) está actuando como "Ops Lead", perdiendo la visión global y convirtiéndose en un cuello de botella.
- [ ] c) Multitasking eficiente.

### Pregunta 3: Blameless Post-Mortem
Un Post-Mortem concluye: "El incidente ocurrió porque el ingeniero Pedro no leyó la documentación antes del deploy".
¿Es esto un buen Post-Mortem?
- [ ] a) Sí, identifica la causa raíz (Pedro).
- [ ] b) No, es una "Cacería de Brujas". No explica por qué el sistema permitió desplegar sin validación. La causa raíz real es la falta de guardarraíles (Guardrails).
- [ ] c) Sí, Pedro debe ser sancionado.

---

## SOLUCIONARIO

### Respuesta 1
**Correcta: b) Generar "Inmunidad Sistémica".**
**Explicación**: Chaos Engineering es entrenamiento y vacunación. El caos no planeado es destructivo; el caos planeado es educativo y fortalecedor.

### Respuesta 2
**Correcta: b) Falla de Roles.**
**Explicación**: El principio de ICS (Incident Command System) dicta la separación de "Comando" y "Ejecución". Si el comandante está ocupado tecleando, nadie está mirando el reloj, coordinando comunicaciones o pensando en el Plan B.

### Respuesta 3
**Correcta: b) No, es una "Cacería de Brujas".**
**Explicación**: Culpar a un humano ignora el hecho de que los humanos somos falibles por naturaleza. Un buen sistema robusto (Anti-frágil) debe protegerse contra el error humano (ej. automatización, linters, pre-checks). Si el sistema depende de que Pedro sea perfecto, el sistema está mal diseñado.
