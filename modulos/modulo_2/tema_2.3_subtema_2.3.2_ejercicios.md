# BANCO DE EJERCICIOS: MÓDULO 2.3 - CONCENTRACIÓN DE FUERZA (SWARMING)

## METADATA
- **Subtema**: 2.3.2 (Swarming)
- **Nivel**: Intermedio

---

## EJERCICIO 1: SIMULACIÓN DE WIP

### ENUNCIADO
Un equipo de 3 personas tiene 3 tareas (A, B, C). Cada tarea toma 2 días-persona.

**Escenario 1 (Dispersión)**: Cada persona toma una tarea.
-   Día 1: Todos avanzan 50%.
-   Día 2: Todos terminan. (Pero asumiendo 0 bloqueos).
-   Realidad con bloqueos: Code review cruzado, contexto. Tarda 3 días.
-   **Entrega**: Las 3 tareas se entregan el Día 3.

**Escenario 2 (Swarm)**: Los 3 trabajan en la Tarea A. Luego B. Luego C.
-   Calcula cuándo se entrega la Tarea A.
-   Calcula el beneficio de negocio.

### SOLUCIÓN
**Cálculo Escenario 2**:
-   Esfuerzo total tarea A: 2 días-persona.
-   Equipo: 3 personas.
-   Tiempo teórico: 2 / 3 = 0.66 días.
-   Con overhead de comunicación: Digamos **1 día**.

**Resultado**:
-   Día 1: Tarea A entregada. (Valor entregado al usuario ya).
-   Día 2: Tarea B entregada.
-   Día 3: Tarea C entregada.

**Beneficio**: En el escenario Swarm, el usuario disfruta la Tarea A dos días antes. El feedback llega antes. El riesgo baja.

---

## EJERCICIO 2: WAR ROOM

### ENUNCIADO
El sitio está caído (Error 500).
-   Dev 1: Mira los logs de DB.
-   Dev 2: Mira el código del último deploy.
-   Dev 3: Está en su casa haciendo una feature nueva.
-   Dev 4: Está en una reunión de planning.

Critica esta distribución de fuerza.

### SOLUCIÓN
**Crítica**: Pésima concentración.
-   Dev 3 y 4 están desperdiciados. En una crisis (Terreno Mortal), la prioridad 1, 2 y 3 es sobrevivir.
-   La feature nueva de Dev 3 no importa si el sitio no existe.
-   La reunión de Dev 4 es irrelevante.

**Acción Correcta (Swarm)**:
-   Aborta reunión.
-   Dev 3 para feature.
-   Todos a la llamada (Zoom/Meet).
-   Roles: 1 Comandante (coordina comunicación), 1-2 Investigadores, 1 Ejecutor de fixes.
-   Fuerza total sobre el problema único.
