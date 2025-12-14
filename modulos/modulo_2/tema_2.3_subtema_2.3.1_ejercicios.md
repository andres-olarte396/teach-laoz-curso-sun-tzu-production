# BANCO DE EJERCICIOS: MÓDULO 2.3 - SHARDING DE ATENCIÓN

## METADATA
- **Subtema**: 2.3.1 (Vacíos y Plenitudes)
- **Nivel**: Intermedio

---

## EJERCICIO 1: MAPA DE CALOR DE DEUDA TÉCNICA

### ENUNCIADO
Tienes 4 módulos con deuda técnica. Tienes recursos para atacar solo uno.
Analiza según Xu (Vacío/Bajo Costo) y Shi (Plenitud/Alto Costo/Alto Valor).

1.  **Módulo A**: Core de facturación. Horrible spaghetti code. Si falla, perdemos dinero. (Muy Shi). Riesgo de rotura: Extremo.
2.  **Módulo B**: Sistema de avatares de usuario. Código feo. Poco impacto. (Poco Shi).
3.  **Módulo C**: Proceso de Onboarding. Código medio. Es crítico para growth. Los devs odian tocarlo pero no es peligroso. (Alto Valor, Costo Medio - Vacío Estratégico).
4.  **Módulo D**: Librería de utilidades legacy. Nadie la usa mucho.

### SOLUCIÓN
**Objetivo**: Atacar donde el ROI es mayor y la resistencia es manejable.
-   Módulo A: **NO**. Es una fortaleza enemiga. Atacar frontalmente será lento y doloroso. Requiere estrategia de estrangulamiento a largo plazo.
-   Módulo B: **NO**. Fácil de ganar, pero victoria irrelevante.
-   Módulo C: **SÍ (ATAQUE AQUÍ)**. Es el "Vacío". Mejorarlo impacta directamente el negocio (Growth) y el equipo puede manejarlo. Es la victoria rápida que genera momentum.
-   Módulo D: Ignorar.

---

## EJERCICIO 2: IDENTIFICAR "BLOAT"

### ENUNCIADO
Tu app tiene 50 features. Las métricas dicen que el 80% de los usuarios usan solo 5 features.
El equipo de ventas pide "Más features para competir con el rival X".
El equipo de ingeniería se queja de lentitud.

Aplica la ley de Xu/Shi.

### SOLUCIÓN
**Diagnóstico**: El sistema está "Lleno" (Shi) de Bloatware. Esto reduce la movilidad.
**Estrategia**:
1.  **Defensa**: Negarse a añadir features nuevas hasta limpiar.
2.  **Ataque**: Identificar las 10 features menos usadas (Vacío de uso) y **Eiminarlas**.
3.  Argumento: "Al eliminar estas 10 features que nadie usa, el sistema será 20% más rápido para las 5 features que todos aman".
4.  Ganar por sustracción, no por adición.
