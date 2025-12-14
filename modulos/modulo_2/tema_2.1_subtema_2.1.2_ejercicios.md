# BANCO DE EJERCICIOS: MÓDULO 2.1 - ERROR BUDGETING

## METADATA
- **Subtema**: 2.1.2 (Error Budget)
- **Nivel**: Avanzado
- **Herramienta**: Hoja de cálculo / Matemáticas

---

## EJERCICIO 1: CÁLCULO DE PRESUPUESTO

### ENUNCIADO
Tu servicio tiene un SLO de **99.5%** de disponibilidad mensual (30 días).
1.  Calcula tu Error Budget en minutos.
2.  Ocurre un incidente que dura 2 horas. ¿Cuánto presupuesto te queda?
3.  ¿Qué acción política debes tomar inmediatamente después del incidente?

### SOLUCIÓN
1.  **Cálculo**:
    -   Total minutos/mes: 30 * 24 * 60 = 43,200 min.
    -   Budget permitido (0.5%): 43,200 * 0.005 = **216 minutos** (3 horas y 36 min).
2.  **Incidente**: 2 horas = 120 minutos.
    -   Restante: 216 - 120 = **96 minutos**.
3.  **Acción Política**:
    -   Todavía tienes saldo positivo (verde). No es necesario declarar "Feature Freeze", pero se debe hacer un Post-Mortem para entender por qué se gastó el 55% del presupuesto en un solo golpe.

---

## EJERCICIO 2: NEGOCIACIÓN DE SLOs

### ENUNCIADO
El CEO exige: "Quiero 100% de disponibilidad para el Black Friday. Cero errores."
Tú eres el SRE Lead. ¿Cómo respondes usando el concepto de Error Budget sin decir simplemente "no"?

### SOLUCIÓN (Roleplay)
"Entendido, CEO. Para acercarnos matemáticamente al 100% (digamos 99.999%), el costo de infraestructura se multiplicará por 10 (redundancia global) y la velocidad de desarrollo bajará a cero (Code Freeze total durante el mes previo).
¿Está el negocio dispuesto a pagar ese precio de 'Seguro Premium', o preferimos mantener nuestro 99.9% actual que nos permite seguir lanzando ofertas rápidas si algo cambia en el mercado?"
-   *Estrategia*: Traducir fiabilidad técnica a **Trade-offs de Negocio**.
