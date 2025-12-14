# ANÁLISIS DE PRECONCEPTOS: TEMA 2.1 (DISEÑO ANTI-FRÁGIL)

## 1. CONCEPTOS FUNDAMENTALES

- **Mascotas vs. Ganado (Pets vs Cattle)**: El cambio de paradigma de servidores cuidados a servidores desechables.
- **Idempotencia**: La propiedad de ejecutar una operación N veces y obtener el mismo resultado.
- **SLA/SLO/SLI**: Definiciones básicas de acuerdos de nivel de servicio.

## 2. ANALOGÍAS BASE

- **El Fénix**: Un servidor que muere y renace automáticamente (Auto-scaling).
- **La Inmunidad**: El Error Budget es el sistema inmune. Permite enfermedades leves (errores) para fortalecerse, pero reacciona ante fiebre alta.

## 3. TRAMPAS COGNITIVAS

- _Trampa_: "Cero errores es la meta".
  - _Corrección_: Cero errores es infinitamente caro y frena la innovación. La meta es "errores aceptables".
