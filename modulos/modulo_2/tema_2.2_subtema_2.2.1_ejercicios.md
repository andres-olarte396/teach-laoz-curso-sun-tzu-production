# BANCO DE EJERCICIOS: MÓDULO 2.2 - ORQUESTACIÓN

## METADATA

- **Subtema**: 2.2.1 (Directo e Indirecto)
- **Nivel**: Intermedio

---

## EJERCICIO 1: ARQUITECTURA ZHENG/QI

### ENUNCIADO

Tienes que diseñar un "Uber for Dog Walkers".
Tienes 3 "Innovation Tokens".
Clasifica las siguientes decisiones tecnológicas como **Zheng** (Estándar/Aburrido) o **Qi** (Innovador/Costoso) y decide qué combinación usar.

1. Base de datos: PostgreSQL.
2. Base de datos: Datomic (Inmutable, Time-travel).
3. Frontend: React Native.
4. Frontend: Framework propio en Rust compilado a WASM.
5. Matching Algorithm: GeoGeous queries (SQL estándar).
6. Matching Algorithm: AI Neural Net en tiempo real.

### SOLUCIÓN

**Clasificación**:

- Postgres (Zheng)
- Datomic (Qi - 1 token)
- React Native (Zheng)
- Rust Custom (Qi - 2 tokens, muy arriesgado)
- SQL Geo (Zheng)
- AI Neural (Qi - 1 token)

**Estrategia Recomendada**:

- Usa **Postgres** y **React Native** (Zheng). Ahorra tokens.
- Gasta tu Token de Innovación en el **AI Neural Net** para el matching. Ese es tu diferencial de negocio ("Encontramos el paseador perfecto").
- No gastes tokens en la base de datos o el framework UI a menos que sea crítico.
- **Resultado**: Estructura sólida, diferencial potente.

---

## EJERCICIO 2: IDENTIFICAR HYPE

### ENUNCIADO

Tu equipo quiere reescribir el microservicio de "Envío de Emails" usando **Kubernetes Operators** y **Go channels** complejos, porque "es más rápido".
El servicio actual es un script de Python que funciona bien pero es "viejo".
Aplica la teoría Zheng/Qi.

### SOLUCIÓN

**Veredicto**: Rechazar la reescritura.
**Análisis**:

- El envío de emails es una commodity. No es el núcleo del negocio.
- Hacerlo "Qi" (complejo/innovador) no aporta valor al usuario final (quien solo quiere recibir el mail).
- Mantén el enfoque **Zheng** (Python simple).
- Guarda la energía "Qi" para problemas que el usuario ame/pague.
