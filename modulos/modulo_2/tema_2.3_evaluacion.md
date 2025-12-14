# CUESTIONARIO Y SOLUCIONARIO: TEMA 2.3 (SHARDING DE ATENCIÓN)

## CUESTIONARIO

### Instrucciones

Valida tu capacidad para enfocar recursos limitados.

### Pregunta 1: Atacar el Vacío

Tu competidor tiene un producto Enterprise complejo, caro y difícil de configurar (Shi/Plenitud).
¿Cuál es la estrategia correcta para atacarlo?

- [ ] a) Crear un clon con las mismas features pero más barato.
- [ ] b) Identificar un nicho que ellos ignoran (ej. Freelancers) y crear un producto ultra-simple que resuelva solo su problema principal (Atacar el Vacío).
- [ ] c) Demandarlos por monopolio.

### Pregunta 2: Swarming

Tienes un Bug Crítico en producción (P0).
¿Cuál es la respuesta de equipo correcta?

- [ ] a) Asignárselo al Tech Lead y dejar que el resto siga con sus tareas para no afectar el Sprint.
- [ ] b) Todo el equipo detiene lo que hace. Se unen en una llamada. Uno comparte pantalla, otros investigan logs, otros escriben tests. (Concentración de fuerza).
- [ ] c) Ignorarlo hasta el próximo Sprint Planning.

### Pregunta 3: The Scout Rule

Estás arreglando un bug en un archivo de 2000 líneas. Ves una función "spaghetti" que no tiene nada que ver con tu bug pero es fea.
¿Qué haces según la estrategia de Vacíos/Oportunismo?

- [ ] a) Reescribir todo el archivo de 2000 líneas (Refactor masivo).
- [ ] b) Ignorarlo totalmente. "Si no está roto, no lo toques".
- [ ] c) Si el refactor toma < 15 mins y es seguro (tiene tests), limpiarlo. Dejar el campamento un poco mejor. No intentar limpiar todo el bosque.

---

## SOLUCIONARIO

### Respuesta 1

**Correcta: b) Atacar el Vacío (Nicho/Simplicidad).**
**Explicación**: Atacar la fortaleza (clonar features) es una guerra de desgaste que perderás. Atacar donde ellos son débiles (complejidad/precio para pequeños usuarios) es donde tienes ventaja táctica.

### Respuesta 2

**Correcta: b) Todo el equipo (Swarming).**
**Explicación**: En una crisis, la velocidad de resolución es lo único que importa. Dividir la atención extiende la crisis. Concentrar la fuerza resuelve el problema en tiempo récord. El costo de oportunidad de "parar el sprint" es menor que el costo de tener el sitio caído.

### Respuesta 3

**Correcta: c) Scout Rule (Mejora incremental).**
**Explicación**: La opción (a) es peligrosa (Shi) y bloqueante. La opción (b) perpetúa la deuda. La opción (c) es la estrategia sostenible: mejoras constantes, atómicas y de bajo riesgo en el punto de contacto.
