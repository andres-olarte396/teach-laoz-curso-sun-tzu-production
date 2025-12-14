# BANCO DE EJERCICIOS: MÓDULO 1.1.2 - TERRENO, LIDERAZGO Y MÉTODO

## METADATA
- **Subtema**: 1.1.2
- **Nivel**: Intermedio

---

## EJERCICIO 1: CLASIFICACIÓN DE TERRENO

### ENUNCIADO
Clasifica los siguientes entornos técnicos según los 6 tipos de terreno de Sun Tzu (adaptados):

1. **Start-up Greenfield**: Sin código previo, todo AWS serverless.
2. **Banco Legacy**: Mainframe COBOL, release cada 6 meses, burocracia extrema.
3. **Monolito Spaghetti**: Código PHP de 10 años, sin tests, altamente acoplado, base de datos compartida por 20 apps.

### SOLUCIÓN PREVISTA
1. **Terreno Accesible (Open)**: Fácil de moverse, el primero en ocupar posiciones altas (arquitectura correcta) gana.
2. **Terreno Estrecho (Constricted)**: Entradas bloqueadas (burocracia). Requiere maniobras especiales y paciencia. No se puede ganar con velocidad pura.
3. **Terreno Pantanoso/Enredado (Entangled)**: Fácil de entrar (añadir código rápido), imposible de salir (refactorizar es un infierno). Si atacas sin preparación, pierdes.

---

## EJERCICIO 2: DIAGNÓSTICO DE LIDERAZGO (LAS 5 VIRTUDES)

### SITUACIÓN
Un Tech Lead es técnicamente brillante (**Sabiduría**) y muy exigente con el Code Review (**Disciplina**). Sin embargo, nunca defiende al equipo de los plazos imposibles de Product (**Falta de Coraje**) y hace trabajar al equipo los fines de semana constantemente (**Falta de Benevolencia**).

**Pregunta**: ¿Cuál es el resultado predecible de este equipo en 3 meses?

### RESPUESTA
**Colapso o Motín**. 
A pesar de la calidad técnica (Sabiduría/Disciplina), la falta de Benevolencia causa **Burnout**. La falta de Coraje hace que el equipo pierda respeto por el líder ("Es un títere del negocio"). Los mejores ingenieros se irán.

---

## EJERCICIO 3: OPTIMIZACIÓN DEL MÉTODO (DORA METRICS)

### ENUNCIADO
Tu equipo tiene un **Deployment Frequency** de "1 vez al mes" y un **Change Failure Rate** del 40%.
Propón una mejora de "Método" (`法`) para corregir esto.

### SOLUCIÓN
El Método está roto (Lotes grandes, alto riesgo).
**Estrategia**:
1. Implementar CI/CD automatizado (Logística).
2. Reducir el tamaño del lote (Batch size). Deployar 1 vez por semana o por día.
3. Añadir tests automatizados antes del merge.

**Objetivo**: Aumentar frecuencia -> Disminuye el riesgo por deploy -> Baja el Failure Rate.
