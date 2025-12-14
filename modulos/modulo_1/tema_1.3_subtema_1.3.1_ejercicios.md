# BANCO DE EJERCICIOS: MÓDULO 1.3 - ESTRATEGIA OFENSIVA

## METADATA

- **Subtema**: 1.3.1 (Resolver en Capas)
- **Nivel**: Intermedio

---

## EJERCICIO 1: ÁRBOL DE DECISIÓN DE CONFLICTO

### ENUNCIADO

El cliente pide: "Quiero que el sistema detecte automáticamente si el usuario subió una foto de un perro o un gato y cambie el tema de la app a azul o rojo respectivamente."
Presupuesto: Bajo. Deadline: Ayer.

Aplica el algoritmo `solver_conflict_layer()` para encontrar la solución en la capa más alta posible.

1. **Capa 1 (Negocio)**: ¿Cómo negociarías esto?
2. **Capa 2 (Arquitectura)**: Si no puedes negociar, ¿qué usas?
3. **Capa 3 (Código)**: ¿Qué sería el peor escenario?

### SOLUCIÓN

1. **Capa 1**: Preguntar "¿Por qué?".
    - Posible respuesta: "Queremos personalizar la experiencia".
    - _Solución_: "En lugar de IA costosa, ¿qué tal un switch manual al registrarse: 'Soy Team Perro / Team Gato'?" (Solución de UX, 0 IA).
2. **Capa 2**: Usar API externa (AWS Rekognition / Google Vision). No entrenar modelos propios. Pagar por uso.
3. **Capa 3**: Contratar Data Scientists, entrenar una red neuronal convulocional desde cero, hostearla en GPUs. (Failure total por presupuesto/tiempo).

---

## EJERCICIO 2: IDENTIFICAR "HERO SYNDROME"

### ENUNCIADO

Un desarrollador Senior lleva 3 días optimizando una función de ordenamiento en C++ para reducirla de 15ms a 12ms. El sistema es un portal de empleados que se usa 5 veces al día.

**Diagnóstico**:

- ¿Es esto una victoria estratégica?
- Calcula el ROI si el salario del dev es $50/hora.

### SOLUCIÓN

- **Diagnóstico**: No. Es vanidad técnica.
- **Análisis**: Un portal de empleados no necesita latencia de 12ms. Nadie nota la diferencia de 3ms.
- **ROI**: 3 días _8 horas_ $50 = $1200 USD gastados para ganar 3ms de tiempo de CPU irrelevante. ROI Negativo masivo.
- **Acción del Lead**: Redirigir al dev a tareas de valor de negocio real.
