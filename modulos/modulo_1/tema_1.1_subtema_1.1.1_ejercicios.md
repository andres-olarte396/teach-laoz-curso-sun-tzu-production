# BANCO DE EJERCICIOS: MÓDULO 1 - ANÁLISIS ESTRATÉGICO

## METADATA

- **Módulo**: 1. Análisis y Planificación Estratégica
- **Subtema**: 1.1.1 Tao (Propósito) y Clima (Timing)
- **Objetivos evaluados**: Diagnosticar viabilidad de proyectos, identificar desalineación estratégica, evaluar riesgo temporal.
- **Nivel de ruta**: Intermedia
- **Tipo**: Formativa (Scenarios)

---

## EJERCICIO 1: DIAGNÓSTICO DE ALINEACIÓN (TAO)

### METADATA

- **ID**: EJ-MOD1-001
- **Dificultad**: ⭐ Básico
- **Nivel Bloom**: Analizar
- **Tipo**: Estudio de Caso

### ENUNCIADO

Eres el Tech Lead de una fintech.

**El CEO dice**: "Necesitamos blockchain para ser innovadores en el Q3."
**El Product Manager dice**: "Los usuarios se quejan de que la app es lenta al cargar transacciones."
**El Junior Dev dice**: "¡Sí, usemos Rust y reescribamos el backend en blockchain!"

Evalúa el **Factor Tao** de la propuesta "Blockchain en Q3".

### PREGUNTAS

1. ¿Existe alineación entre Soberano (CEO), General (Tú/Devs) y Pueblo (Usuarios)?
2. ¿Cuál es el riesgo principal si procedes con la orden del CEO?
3. Propón una contra-propuesta que alinee el Tao.

### SOLUCIÓN MODELO

1. **Alineación**: **Nula**.
   - CEO quiere "Hype" (Innovación percibida).
   - Usuarios quieren "Performance" (Velocidad).
   - Dev quiere "Juguetes nuevos" (Rust/Blockchain).
   - _Diagnóstico_: Proyecto condenado al fracaso. El blockchain probablemente hará la app más lenta, enfureciendo a los usuarios.

2. **Riesgo**: Construir una solución cara que empeora el problema real (lentitud). Pérdida de usuarios.

3. **Contra-propuesta**: "Para innovar (CEO) y mejorar velocidad (Usuarios), implementaremos un caché distribuido de alto rendimiento (Tecnología probada). Podemos marketinguearlo como 'Motor de Transacciones en Tiempo Real' (Hype para el CEO)."

---

## EJERCICIO 2: EVALUACIÓN DE CLIMA (TIMING)

### METADATA

- **ID**: EJ-MOD1-002
- **Dificultad**: ⭐⭐ Intermedio
- **Nivel Bloom**: Evaluar

### ENUNCIADO

Tu empresa de e-commerce planea migrar toda su base de datos de MySQL a una base de datos distribuida NoSQL nueva y "buzzy" (alpha v0.5).

**Fecha actual**: 1 de Septiembre.
**Deadline propuesto**: 15 de Noviembre.
**Evento crítico**: Black Friday comienza el 24 de Noviembre.

Evalúa el **Factor Clima**.

### ANÁLISIS REQUERIDO

Calcula el riesgo basado en:

1. Madurez de la tecnología.
2. Ventana de oportunidad vs. Evento crítico (Black Friday).

### SOLUCIÓN MODELO

**Evaluación de Clima: PÉSIMA (Riesgo Mortal)**

1. **Estación Tecnológica**: "Invierno cruel". Usar software alpha (v0.5) para infraestructura crítica (DB) es suicidio. No hay madurez ni soporte estable.
2. **Estación de Mercado**: "Tormenta inminente". Migrar bases de datos 2 semanas antes del pico de tráfico anual (Black Friday) viola la regla de oro: _Code Freeze_.
3. **Decisión**: **NO-GO absoluto**. Posponer migración para Enero (Q1), periodo de baja carga ("Primavera/Verano" para refactors).

---

## EJERCICIO 3: CÁLCULO DE VIABILIDAD (ALGORITMICO)

### METADATA

- **ID**: EJ-MOD1-003
- **Dificultad**: ⭐⭐⭐ Avanzado
- **Nivel Bloom**: Aplicar/Crear
- **Herramienta**: Python (Pseudocódigo)

### ENUNCIADO

Diseña una función `risk_score(project)` que penalice proyectos basándose en heurísticas de "Clima".

**Reglas de negocio**:

- Si `tech_maturity` es "Bleeding Edge", +50 riesgo.
- Si `months_to_deadline` < 3 y `scope` es "Large", +40 riesgo.
- Si `team_experience` con la tecnología es "Low", multiplicar riesgo total por 1.5.

### SOLUCIÓN MODELO

```python
def calculate_climate_risk(tech_maturity, months_to_deadline, scope, team_exp):
    risk = 0

    # Factor Madurez
    if tech_maturity == "Bleeding Edge":
        risk += 50
    elif tech_maturity == "New":
        risk += 20

    # Factor Tiempo/Alcance
    if months_to_deadline < 3 and scope == "Large":
        risk += 40
    elif months_to_deadline < 6 and scope == "Large":
        risk += 20

    # Factor Experiencia (Multiplicador de fuerza)
    if team_exp == "Low":
        risk *= 1.5
    elif team_exp == "Medium":
        risk *= 1.2

    return risk

# Test Case
# Migración a herramienta alpha (Bleeding Edge), en 2 meses (Large scope), equipo junior (Low exp)
# Risk = (50 + 40) * 1.5 = 135 (Riesgo Extremo)
```
