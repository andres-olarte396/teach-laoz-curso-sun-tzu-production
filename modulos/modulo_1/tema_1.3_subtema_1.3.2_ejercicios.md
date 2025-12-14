# BANCO DE EJERCICIOS: MÓDULO 1.3 - ESTRATEGIA OFENSIVA (ARQUITECTURA)

## METADATA

- **Subtema**: 1.3.2 (Ganar por Diseño)
- **Nivel**: Avanzado

---

## EJERCICIO 1: PATRÓN STRANGLER (DISEÑO)

### ENUNCIADO

Eres el arquitecto. Tienes un e-commerce monolítico en PHP 5.6 (Legacy, miedoso).
El negocio quiere lanzar un nuevo módulo de "Recomendaciones con IA" en Python.
No puedes tocar el PHP porque se rompe.
¿Cómo diseñas la integración usando el principio de "Ganar primero"?

### SOLUCIÓN (DIAGRAMA CONCEPTUAL)

**Uso del Strangler Fig Pattern**:

1. Colocar un **Reverse Proxy (Nginx/Kong)** frente al PHP.
2. Todo el tráfico va al PHP por defecto.
3. Nueva ruta `/api/recommendations` se enruta al nuevo servicio Python.
4. La página del producto (PHP) hace una llamada AJAX a `/api/recommendations`.
    **Victoria**: Integramos tecnología moderna (Python) sin arriesgar ni refactorizar el núcleo inestable (PHP). El sistema nuevo vive "al lado" y asfixia al viejo lentamente.

---

## EJERCICIO 2: RESOLUCIÓN DE CONFLICTO HUMANO VÍA CÓDIGO

### ENUNCIADO

Dos equipos (Mobile App y Backend API) se culpan mutuamente cada vez que la App crashea.
Mobile: "La API cambió el formato sin avisar".
Backend: "La App no parsea bien el JSON".
El conflicto escala a los managers.

Diseña una solución técnica que elimine la **posibilidad** de este conflicto.

### SOLUCIÓN

**Implimentar Contract Testing o Schemas Tipados Compartidos**.

- **Opción A (Schema Registry)**: Usar Protobuf o GraphQL. El esquema es la ley. Si Backend cambia algo que rompe el esquema, su build falla (CI/CD). No puede desplegar.
- **Opción B (Consumer Driven Contracts)**: Mobile define un "Pact file" (expectativas). Backend corre este Pact como parte de sus tests. Si rompe el Pact, Backend build falla.
  **Resultado**: El sistema impide el error. La discusión desaparece.
