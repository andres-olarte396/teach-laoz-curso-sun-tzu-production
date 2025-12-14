# BANCO DE EJERCICIOS: MÓDULO 2.2 - MOMENTUM

## METADATA
- **Subtema**: 2.2.2 (Momentum de Release)
- **Nivel**: Intermedio

---

## EJERCICIO 1: DESBLOQUEAR EL FLUJO

### ENUNCIADO
Eres el Tech Lead. Miras el tablero Kanban y ves:
-   Columna "In Progress": 15 tickets.
-   Columna "Code Review": 8 tickets (algunos llevan 5 días).
-   Columna "Done": 2 tickets esta semana.
-   Equipo: 5 personas.

Calcula el WIP promedio por persona y diagnostica el problema de Momentum. Propón 2 acciones.

### SOLUCIÓN
**Cálculo**: (15 + 8) / 5 = **4.6 tareas por persona**.
**Diagnóstico**: **Colapso Cognitivo**. Nadie puede concentrarse en 4 cosas a la vez. El Context Switching está matando la velocidad. Los PRs se acumulan porque todos están ocupados programando lo nuevo en lugar de revisar lo viejo.

**Acciones**:
1.  **Stop Starting, Start Finishing**: Nadie puede mover un ticket a "In Progress" hasta que la columna "Code Review" esté vacía.
2.  **Swarming**: Todo el equipo se dedica hoy *solo* a revisar y mergear los 8 PRs pendientes.

---

## EJERCICIO 2: ESTRATEGIA DE RELEASE

### ENUNCIADO
Tienes una feature gigante ("Dark Mode") que toca 50 archivos CSS.
Método A: Trabajar en una rama `feature/dark-mode` durante 3 semanas y mergear al final.
Método B: Usar Feature Flags.

Analiza el riesgo de Momentum de ambas.

### SOLUCIÓN
**Método A (Rama Larga)**:
-   Riesgo de Momentum: **Muy Alto**.
-   Durante 3 semanas, otros devs cambiarán CSS. Al intentar mergear, tendrás cientos de conflictos. El "Merge Hell" detendrá al equipo por días.

**Método B (Feature Flags)**:
-   Riesgo de Momentum: **Bajo**.
-   Creas la flag. Cambias 5 archivos CSS hoy. Mergeas. (Flag apagada).
-   Mañana otros 5. Mergeas.
-   Cero conflictos de larga duración. El código fluye diariamente.
-   **Sun Tzu**: *"La rapidez es la esencia de la guerra"*.
