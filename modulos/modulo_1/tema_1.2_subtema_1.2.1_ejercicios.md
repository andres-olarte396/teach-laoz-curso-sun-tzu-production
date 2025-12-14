# BANCO DE EJERCICIOS: MÓDULO 1.2 - ECONOMÍA Y LOGÍSTICA

## METADATA
- **Módulo**: 1. Análisis y Planificación Estratégica
- **Subtema**: 1.2.1 (Cycle Time) y 1.2.2 (Automatización)
- **Nivel**: Intermedio

---

## EJERCICIO 1: CÁLCULO DEL COSTO DE RETRASO

### METADATA
- **ID**: EJ-MOD1-004
- **Dificultad**: ⭐ Básico
- **Herramienta**: Calculadora

### ENUNCIADO
Tu equipo de 4 personas ($20k USD/mes costo total) está trabajando en una feature que se espera genere $5k USD/mes una vez lanzada.
Debido a discusiones sobre el color del botón ("Bike-shedding"), el lanzamiento se retrasa 2 meses.

Calcula el **Costo Total de Retraso**.

### SOLUCIÓN
1. **Costo Operativo (Burn-rate)**: $20k * 2 meses = $40k.
2. **Lucro Cesante (Opportunity Cost)**: $5k * 2 meses = $10k.
3. **Total**: $50,000 USD.

*Reflexión*: ¿Valía la pena discutir el color del botón por $50,000 dólares?

---

## EJERCICIO 2: DISEÑO DE PIPELINE LOGÍSTICO

### METADATA
- **ID**: EJ-MOD1-005
- **Dificultad**: ⭐⭐ Intermedio
- **Tipo**: Diseño de Sistemas

### ENUNCIADO
Diseña (en diagrama o pseudocódigo) un pipeline de CI/CD para una aplicación crítica (Fintech) que optimice la velocidad pero **garantice** que no lleguen bugs graves a producción.
Requisito: Debe incluir una estrategia de "Rollback Automático".

### SOLUCIÓN MODELO

```mermaid
graph TD
    Commit --> UnitTests[Unit Tests (Rápido)]
    UnitTests -->|Pass| BuildDocker
    BuildDocker --> Scan[Vuln Scan (Seguridad)]
    Scan -->|Pass| DeployStaging
    DeployStaging --> E2ETests[Cypress/Selenium]
    E2ETests -->|Pass| DeployCanary[Deploy a 5% Usuarios]
    DeployCanary --> MonitorErrors{¿Error Rate < 1%?}
    MonitorErrors -->|No!| AutoRollback[Revertir a versión anterior]
    MonitorErrors -->|Sí| PromoteFull[Deploy a 100%]
```

---

## EJERCICIO 3: REFÁCTOR vs. REWRITE (DECISIÓN DE PROVISIONES)

### METADATA
- **ID**: EJ-MOD1-006
- **Dificultad**: ⭐⭐⭐ Avanzado
- **Tipo**: Toma de Decisiones

### ENUNCIADO
Tienes un sistema de autenticación viejo y feo, pero seguro. El equipo quiere reescribirlo desde cero porque usa una librería antigua.
Estimar tiempo de reescritura: 3 meses.
Opción alternativa: Usar Auth0/Firebase (Managed Service) -> Tiempo integración: 2 semanas. Costo: $500/mes.

Usa el principio de *"Forrajear del Enemigo"* para decidir.

### SOLUCIÓN
**Decisión Estratégica**: Usar Managed Service (Auth0/Firebase).
**Racional**:
- Reescribir es "Traer suministros de casa" (Caro, lento, maintenance burden).
- Managed Service es "Usar lo que provee el terreno" (Rápido, delega responsabilidad).
- El costo de $500/mes es insignificante comparado con 3 meses de salarios de ingenieros ($60k+) y el riesgo de seguridad de hacerlo in-house.
