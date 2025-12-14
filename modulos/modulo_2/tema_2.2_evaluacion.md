# CUESTIONARIO Y SOLUCIONARIO: TEMA 2.2 (ORQUESTACIÓN Y MOMENTUM)

## CUESTIONARIO

### Instrucciones

Valida tu capacidad para combinar innovación y velocidad.

### Pregunta 1: Zheng y Qi

Estás construyendo un sistema bancario crítico.
¿Cuál es la distribución de fuerzas recomendada?

- [ ] a) 100% Zheng (Todo tecnologías probadas de hace 20 años).
- [ ] b) 80% Zheng (Core fiable) y 20% Qi (Frontend moderno/AI antifraude).
- [ ] c) 100% Qi (Blockchain, Haskell, todo nuevo para ser "disruptivo").

### Pregunta 2: Innovation Tokens

Tienes 3 tokens de innovación. Tu equipo decide usar:

1. Lenguaje Rust (Nuevo para el equipo).
2. Base de datos Cassandra (Nueva para el equipo).
3. Arquitectura Event Sourcing (Nueva para el equipo).
4. Deploy en Kubernetes (Nuevo para el equipo).
   ¿Cuál es el diagnóstico estratégico?

- [ ] a) Excelente, es un proyecto muy moderno.
- [ ] b) Bancarrota cognitiva. Han gastado 4 tokens. El riesgo de fallo por complejidad desconocida es casi 100%.
- [ ] c) Aceptable si el equipo es Senior.

### Pregunta 3: Momentum Killer

¿Cuál de estas prácticas es la que MÁS daña el momentum del equipo?

- [ ] a) Tener muchas reuniones de daily standup.
- [ ] b) Mantener ramas de features (feature branches) abiertas durante semanas antes de integrar.
- [ ] c) Pedir que el código tenga pruebas unitarias.

---

## SOLUCIONARIO

### Respuesta 1

**Correcta: b) 80% Zheng y 20% Qi.**
**Explicación**: 100% Zheng lleva a la obsolescencia y falta de ventaja competitiva. 100% Qi lleva al caos operativo. El equilibrio permite estabilidad estructural (Banco sólido) con ventaja táctica (Detección de fraude con AI).

### Respuesta 2

**Correcta: b) Bancarrota cognitiva.**
**Explicación**: Cada tecnología nueva introduce una curva de aprendizaje y modos de fallo desconocidos. Sumar 4 riesgos simultáneos garantiza que cuando algo falle, no sabrán si es el lenguaje, la DB, la arquitectura o la infra. La regla general es máximo 3 tokens.

### Respuesta 3

**Correcta: b) Ramas de larga duración.**
**Explicación**: El "Merge Hell" es el asesino silencioso de la velocidad. Cuanto más tiempo vive una rama aislada, más diverge de la realidad (`main`). Integrar se vuelve un proyecto en sí mismo, deteniendo el flujo de valor.
