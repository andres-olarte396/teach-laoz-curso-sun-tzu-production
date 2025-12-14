# PROTOCOLOS DE GUERRA: INCIDENT RESPONSE

**Tiempo estimado**: 50 minutos
**Nivel**: Tech Lead / Manager
**Prerrequisitos**: Liderazgo básico

## ¿Por qué importa este concepto?

Sun Tzu dice: *"El caos simulado nace de la disciplina; el miedo simulado nace del valor; la debilidad simulada nace de la fuerza"*.
Cuando el sistema cae a las 3 AM y Twitter arde, lo natural es el pánico (Caos real).
El objetivo de **Incident Response** es transformar ese pánico en un proceso militar disciplinado.

No importa qué tan buena sea tu arquitectura; vas a fallar. La diferencia entre una compañía mediocre y una de élite no es si fallan, sino qué tan rápido se recuperan (MTTR - Mean Time To Recovery).

## Conexión con conocimientos previos

Es la aplicación final de todo. Observabilidad (3.2) nos dice que hay fuego. Maniobra (3.1) nos da herramientas para apagarlo. Incident Response es la coordinación humana para usar esas herramientas.

---

## Comprensión intuitiva

### Roles de Batalla (ICS - Incident Command System)
Tomado de los bomberos. Cuando hay fuego, no hay democracia. Hay roles.

1.  **Incident Commander (IC)**: El jefe. No toca el teclado.
    -   *Función*: Toma decisiones, coordina, mantiene la visión global.
2.  **Ops Lead**: El táctico.
    -   *Función*: Toca el teclado. Ejecuta los cambios.
3.  **Comms Lead**: El diplomático.
    -   *Función*: Habla con clientes/internos. Actualiza la página de estado.

### El Anti-Patrón: "Todos ayudan"
Si 10 ingenieros entran al canal de Slack a tirar ideas y comandos al azar:
-   Aumenta el ruido.
-   Nadie sabe qué se ha probado.
-   Riesgo de empeorar el incidente.
**Regla**: Si no tienes rol asignado, te callas y observas.

---

## Implementación práctica: Fases del Incidente

### 1. Detección y Declaración
-   Alerta automática o reporte de usuario.
-   Alguien dice: "Declaro Incidente SEV-1". (Nivel de severidad).
-   Se abre canal de Slack `#incident-123`.
-   Se asigna el IC.

### 2. Contención (Torniquete)
-   **Objetivo**: Parar el sangrado. No arreglar la causa raíz.
-   *Ejemplo*: Si la DB está lenta por una feature nueva -> Rollback o Feature Flag OFF.
-   No investigues *por qué* la query es lenta ahora. Apágala. Recupera el servicio.

### 3. Remediación
-   Una vez el usuario está feliz (servicio arriba), investigamos la causa raíz con calma.

### 4. Post-Mortem (La Lección)
-   Documento escrito SIN CULPA (Blameless).
-   ¿Qué pasó? ¿Por qué? ¿Cómo evitamos que se repita?
-   Se generan tickets de mejora en Jira.

---

## Trampas y errores comunes

### ❌ Error: Buscar Culpables durante el fuego
"¿Quién pusheó este commit?"
-   **Efecto**: La gente se defiende en lugar de arreglar el problema. Miedo. Silencio.
-   **Sun Tzu**: *"Trata a tus soldados como a hijos amados y te seguirán al valle más profundo"*.
-   **Solución**: Enfócate en el sistema, no en la persona. "El sistema permitió que un error humano llegara a prod".

### ❌ Error: Fatiga de Alerta
Tener alertas PagerDuty para todo (Disco 80%, CPU 10%).
-   **Efecto**: El ingeniero ignora el teléfono. Cuando llega la alerta real (Sitio Caído), nadie responde.

---

## Resumen

**En una frase**: En la crisis, la disciplina vence al genio.

**Cuándo usarlo**:
-   Siempre que haya degradación del servicio.
-   Practicarlo con "Game Days" (simulacros).

**Siguiente paso**: Módulo 4 y 5. Hemos terminado el núcleo operativo. Pasamos a la **Carrera Profesional y Liderazgo Estratégico** (Módulo 4: El Liderazgo del General).

## 📊 ESTRUCTURA DE MANDO (ICS)
`mermaid
graph TD
    IC[Incident Commander] --> Ops[Ops Lead]
    IC --> Comms[Comms Lead]
    IC --> Planning[Planning Lead]
    Ops --> DB_Admin
    Ops --> Network_Admin
    style IC fill:#f00,color:#fff
`
"@
if (-not (# PROTOCOLOS DE GUERRA: INCIDENT RESPONSE

**Tiempo estimado**: 50 minutos
**Nivel**: Tech Lead / Manager
**Prerrequisitos**: Liderazgo básico

## ¿Por qué importa este concepto?

Sun Tzu dice: *"El caos simulado nace de la disciplina; el miedo simulado nace del valor; la debilidad simulada nace de la fuerza"*.
Cuando el sistema cae a las 3 AM y Twitter arde, lo natural es el pánico (Caos real).
El objetivo de **Incident Response** es transformar ese pánico en un proceso militar disciplinado.

No importa qué tan buena sea tu arquitectura; vas a fallar. La diferencia entre una compañía mediocre y una de élite no es si fallan, sino qué tan rápido se recuperan (MTTR - Mean Time To Recovery).

## Conexión con conocimientos previos

Es la aplicación final de todo. Observabilidad (3.2) nos dice que hay fuego. Maniobra (3.1) nos da herramientas para apagarlo. Incident Response es la coordinación humana para usar esas herramientas.

---

## Comprensión intuitiva

### Roles de Batalla (ICS - Incident Command System)
Tomado de los bomberos. Cuando hay fuego, no hay democracia. Hay roles.

1.  **Incident Commander (IC)**: El jefe. No toca el teclado.
    -   *Función*: Toma decisiones, coordina, mantiene la visión global.
2.  **Ops Lead**: El táctico.
    -   *Función*: Toca el teclado. Ejecuta los cambios.
3.  **Comms Lead**: El diplomático.
    -   *Función*: Habla con clientes/internos. Actualiza la página de estado.

### El Anti-Patrón: "Todos ayudan"
Si 10 ingenieros entran al canal de Slack a tirar ideas y comandos al azar:
-   Aumenta el ruido.
-   Nadie sabe qué se ha probado.
-   Riesgo de empeorar el incidente.
**Regla**: Si no tienes rol asignado, te callas y observas.

---

## Implementación práctica: Fases del Incidente

### 1. Detección y Declaración
-   Alerta automática o reporte de usuario.
-   Alguien dice: "Declaro Incidente SEV-1". (Nivel de severidad).
-   Se abre canal de Slack `#incident-123`.
-   Se asigna el IC.

### 2. Contención (Torniquete)
-   **Objetivo**: Parar el sangrado. No arreglar la causa raíz.
-   *Ejemplo*: Si la DB está lenta por una feature nueva -> Rollback o Feature Flag OFF.
-   No investigues *por qué* la query es lenta ahora. Apágala. Recupera el servicio.

### 3. Remediación
-   Una vez el usuario está feliz (servicio arriba), investigamos la causa raíz con calma.

### 4. Post-Mortem (La Lección)
-   Documento escrito SIN CULPA (Blameless).
-   ¿Qué pasó? ¿Por qué? ¿Cómo evitamos que se repita?
-   Se generan tickets de mejora en Jira.

---

## Trampas y errores comunes

### ❌ Error: Buscar Culpables durante el fuego
"¿Quién pusheó este commit?"
-   **Efecto**: La gente se defiende en lugar de arreglar el problema. Miedo. Silencio.
-   **Sun Tzu**: *"Trata a tus soldados como a hijos amados y te seguirán al valle más profundo"*.
-   **Solución**: Enfócate en el sistema, no en la persona. "El sistema permitió que un error humano llegara a prod".

### ❌ Error: Fatiga de Alerta
Tener alertas PagerDuty para todo (Disco 80%, CPU 10%).
-   **Efecto**: El ingeniero ignora el teléfono. Cuando llega la alerta real (Sitio Caído), nadie responde.

---

## Resumen

**En una frase**: En la crisis, la disciplina vence al genio.

**Cuándo usarlo**:
-   Siempre que haya degradación del servicio.
-   Practicarlo con "Game Days" (simulacros).

**Siguiente paso**: Módulo 4 y 5. Hemos terminado el núcleo operativo. Pasamos a la **Carrera Profesional y Liderazgo Estratégico** (Módulo 4: El Liderazgo del General).
 -match "mermaidd")) { Set-Content e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_3\tema_3.3_subtema_3.3.2_contenido.md -Value (# PROTOCOLOS DE GUERRA: INCIDENT RESPONSE

**Tiempo estimado**: 50 minutos
**Nivel**: Tech Lead / Manager
**Prerrequisitos**: Liderazgo básico

## ¿Por qué importa este concepto?

Sun Tzu dice: *"El caos simulado nace de la disciplina; el miedo simulado nace del valor; la debilidad simulada nace de la fuerza"*.
Cuando el sistema cae a las 3 AM y Twitter arde, lo natural es el pánico (Caos real).
El objetivo de **Incident Response** es transformar ese pánico en un proceso militar disciplinado.

No importa qué tan buena sea tu arquitectura; vas a fallar. La diferencia entre una compañía mediocre y una de élite no es si fallan, sino qué tan rápido se recuperan (MTTR - Mean Time To Recovery).

## Conexión con conocimientos previos

Es la aplicación final de todo. Observabilidad (3.2) nos dice que hay fuego. Maniobra (3.1) nos da herramientas para apagarlo. Incident Response es la coordinación humana para usar esas herramientas.

---

## Comprensión intuitiva

### Roles de Batalla (ICS - Incident Command System)
Tomado de los bomberos. Cuando hay fuego, no hay democracia. Hay roles.

1.  **Incident Commander (IC)**: El jefe. No toca el teclado.
    -   *Función*: Toma decisiones, coordina, mantiene la visión global.
2.  **Ops Lead**: El táctico.
    -   *Función*: Toca el teclado. Ejecuta los cambios.
3.  **Comms Lead**: El diplomático.
    -   *Función*: Habla con clientes/internos. Actualiza la página de estado.

### El Anti-Patrón: "Todos ayudan"
Si 10 ingenieros entran al canal de Slack a tirar ideas y comandos al azar:
-   Aumenta el ruido.
-   Nadie sabe qué se ha probado.
-   Riesgo de empeorar el incidente.
**Regla**: Si no tienes rol asignado, te callas y observas.

---

## Implementación práctica: Fases del Incidente

### 1. Detección y Declaración
-   Alerta automática o reporte de usuario.
-   Alguien dice: "Declaro Incidente SEV-1". (Nivel de severidad).
-   Se abre canal de Slack `#incident-123`.
-   Se asigna el IC.

### 2. Contención (Torniquete)
-   **Objetivo**: Parar el sangrado. No arreglar la causa raíz.
-   *Ejemplo*: Si la DB está lenta por una feature nueva -> Rollback o Feature Flag OFF.
-   No investigues *por qué* la query es lenta ahora. Apágala. Recupera el servicio.

### 3. Remediación
-   Una vez el usuario está feliz (servicio arriba), investigamos la causa raíz con calma.

### 4. Post-Mortem (La Lección)
-   Documento escrito SIN CULPA (Blameless).
-   ¿Qué pasó? ¿Por qué? ¿Cómo evitamos que se repita?
-   Se generan tickets de mejora en Jira.

---

## Trampas y errores comunes

### ❌ Error: Buscar Culpables durante el fuego
"¿Quién pusheó este commit?"
-   **Efecto**: La gente se defiende en lugar de arreglar el problema. Miedo. Silencio.
-   **Sun Tzu**: *"Trata a tus soldados como a hijos amados y te seguirán al valle más profundo"*.
-   **Solución**: Enfócate en el sistema, no en la persona. "El sistema permitió que un error humano llegara a prod".

### ❌ Error: Fatiga de Alerta
Tener alertas PagerDuty para todo (Disco 80%, CPU 10%).
-   **Efecto**: El ingeniero ignora el teléfono. Cuando llega la alerta real (Sitio Caído), nadie responde.

---

## Resumen

**En una frase**: En la crisis, la disciplina vence al genio.

**Cuándo usarlo**:
-   Siempre que haya degradación del servicio.
-   Practicarlo con "Game Days" (simulacros).

**Siguiente paso**: Módulo 4 y 5. Hemos terminado el núcleo operativo. Pasamos a la **Carrera Profesional y Liderazgo Estratégico** (Módulo 4: El Liderazgo del General).
 + 
## 🔬 SIMULACIÓN INTERACTIVA
> **Experimento**: ¿Cómo afecta el tamaño del lote a la velocidad de entrega?
> [🏠 ABRIR SIMULACIÓN DE PIPELINE](../../simulaciones/simulacion_m1_pipeline.html)

## 📊 GRÁFICO: LA CURVA J DEL RETRASO
`mermaid
xychart-beta
    title "Costo de No Desplegar (Deuda de Inventario)"
    x-axis [Día 1, Día 7, Día 14, Día 30]
    y-axis "Dinero Perdido" 0 --> 100
    line [10, 20, 50, 95]
`
"@
if (-not (# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 -match "simulacion_m1")) { Set-Content e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md -Value (# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 + 
## 📊 VISUALIZACIÓN ESTRATÉGICA: EL PENTÁGONO
`mermaid
graph TD
    Tao[Tao (Misión)] --> Clima
    Clima[Clima (Contexto)] --> Terreno
    Terreno[Terreno (Infra)] --> Liderazgo
    Liderazgo[Liderazgo (Equipo)] --> Metodo
    Metodo[Método (Proceso)] --> Tao
    style Tao fill:#f9f,stroke:#333,stroke-width:4px
    style Terreno fill:#ccf,stroke:#333,stroke-width:2px
`
*Fig 1.1: El ciclo de influencia de los 5 factores.*) -Encoding UTF8 }

# 1.3.1: Layers
e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md = "e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.3_subtema_1.3.1_contenido.md"
# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 = Get-Content e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md -Raw

## 📊 VISUALIZACIÓN ESTRATÉGICA: EL PENTÁGONO
`mermaid
graph TD
    Tao[Tao (Misión)] --> Clima
    Clima[Clima (Contexto)] --> Terreno
    Terreno[Terreno (Infra)] --> Liderazgo
    Liderazgo[Liderazgo (Equipo)] --> Metodo
    Metodo[Método (Proceso)] --> Tao
    style Tao fill:#f9f,stroke:#333,stroke-width:4px
    style Terreno fill:#ccf,stroke:#333,stroke-width:2px
`
*Fig 1.1: El ciclo de influencia de los 5 factores.* = @"

## 📊 ARQUITECTURA: DEFENSA EN CAPAS
`mermaid
graph BT
    L1[Capa Física (Difícil)] --> L2[Capa Lógica (Media)]
    L2 --> L3[Capa Conceptual (Fácil)]
    click L3 "Solución aquí: Barata"
    click L1 "Solución aquí: Cara"
    style L3 fill:#8f8,stroke:#333
    style L1 fill:#f88,stroke:#333
`
"@
if (-not (# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 -match "mermaidd")) { Set-Content e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md -Value (# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 + 
## 📊 VISUALIZACIÓN ESTRATÉGICA: EL PENTÁGONO
`mermaid
graph TD
    Tao[Tao (Misión)] --> Clima
    Clima[Clima (Contexto)] --> Terreno
    Terreno[Terreno (Infra)] --> Liderazgo
    Liderazgo[Liderazgo (Equipo)] --> Metodo
    Metodo[Método (Proceso)] --> Tao
    style Tao fill:#f9f,stroke:#333,stroke-width:4px
    style Terreno fill:#ccf,stroke:#333,stroke-width:2px
`
*Fig 1.1: El ciclo de influencia de los 5 factores.*) -Encoding UTF8 }


# --- MODULO 2 ---

# 2.1.1: Pets vs Cattle
e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md = "e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_2\tema_2.1_subtema_2.1.1_contenido.md"
# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 = Get-Content e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md -Raw

## 📊 VISUALIZACIÓN ESTRATÉGICA: EL PENTÁGONO
`mermaid
graph TD
    Tao[Tao (Misión)] --> Clima
    Clima[Clima (Contexto)] --> Terreno
    Terreno[Terreno (Infra)] --> Liderazgo
    Liderazgo[Liderazgo (Equipo)] --> Metodo
    Metodo[Método (Proceso)] --> Tao
    style Tao fill:#f9f,stroke:#333,stroke-width:4px
    style Terreno fill:#ccf,stroke:#333,stroke-width:2px
`
*Fig 1.1: El ciclo de influencia de los 5 factores.* = @"

## 📊 VISUALIZACIÓN: MASCOTAS VS GANADO
`mermaid
graph LR
    subgraph Pets [Mascotas (Tradicional)]
        S1(Server Zeus) --- S2(Server Apolo)
        style S1 fill:#f96
    end
    subgraph Cattle [Ganado (Cloud)]
        C1[Container 9a8b] -.- C2[Container 3x2y] -.- C3[Container 1z9p]
        style C1 fill:#69f
        style C3 fill:#69f
    end
`
"@
if (-not (# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 -match "mermaidd")) { Set-Content e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md -Value (# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 + 
## 📊 VISUALIZACIÓN ESTRATÉGICA: EL PENTÁGONO
`mermaid
graph TD
    Tao[Tao (Misión)] --> Clima
    Clima[Clima (Contexto)] --> Terreno
    Terreno[Terreno (Infra)] --> Liderazgo
    Liderazgo[Liderazgo (Equipo)] --> Metodo
    Metodo[Método (Proceso)] --> Tao
    style Tao fill:#f9f,stroke:#333,stroke-width:4px
    style Terreno fill:#ccf,stroke:#333,stroke-width:2px
`
*Fig 1.1: El ciclo de influencia de los 5 factores.*) -Encoding UTF8 }

# 2.2.1: Zheng/Qi + Sim Tokens
e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md = "e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_2\tema_2.2_subtema_2.2.1_contenido.md"
# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 = Get-Content e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md -Raw

## 📊 VISUALIZACIÓN ESTRATÉGICA: EL PENTÁGONO
`mermaid
graph TD
    Tao[Tao (Misión)] --> Clima
    Clima[Clima (Contexto)] --> Terreno
    Terreno[Terreno (Infra)] --> Liderazgo
    Liderazgo[Liderazgo (Equipo)] --> Metodo
    Metodo[Método (Proceso)] --> Tao
    style Tao fill:#f9f,stroke:#333,stroke-width:4px
    style Terreno fill:#ccf,stroke:#333,stroke-width:2px
`
*Fig 1.1: El ciclo de influencia de los 5 factores.* = @"

## 🔬 SIMULACIÓN INTERACTIVA
> **Reto**: Tienes 3 'Innovation Tokens'. ¿Puedes armar una arquitectura que no quiebre la empresa?
> [🏠 ABRIR JUEGO DE ARCHITECTURA](../../simulaciones/simulacion_m2_tokens.html)

## 📊 DISTRIBUCIÓN ÓPTIMA
`mermaid
pie title "Distribución de Arquitectura Sana"
    "Zheng (Estándar/Aburrido)" : 80
    "Qi (Innovador/Riesgoso)" : 20
`
"@
if (-not (# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 -match "simulacion_m2")) { Set-Content e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md -Value (# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 + 
## 📊 VISUALIZACIÓN ESTRATÉGICA: EL PENTÁGONO
`mermaid
graph TD
    Tao[Tao (Misión)] --> Clima
    Clima[Clima (Contexto)] --> Terreno
    Terreno[Terreno (Infra)] --> Liderazgo
    Liderazgo[Liderazgo (Equipo)] --> Metodo
    Metodo[Método (Proceso)] --> Tao
    style Tao fill:#f9f,stroke:#333,stroke-width:4px
    style Terreno fill:#ccf,stroke:#333,stroke-width:2px
`
*Fig 1.1: El ciclo de influencia de los 5 factores.*) -Encoding UTF8 }

# 2.3.2: Swarming
e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md = "e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_2\tema_2.3_subtema_2.3.2_contenido.md"
# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 = Get-Content e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md -Raw

## 📊 VISUALIZACIÓN ESTRATÉGICA: EL PENTÁGONO
`mermaid
graph TD
    Tao[Tao (Misión)] --> Clima
    Clima[Clima (Contexto)] --> Terreno
    Terreno[Terreno (Infra)] --> Liderazgo
    Liderazgo[Liderazgo (Equipo)] --> Metodo
    Metodo[Método (Proceso)] --> Tao
    style Tao fill:#f9f,stroke:#333,stroke-width:4px
    style Terreno fill:#ccf,stroke:#333,stroke-width:2px
`
*Fig 1.1: El ciclo de influencia de los 5 factores.* = @"

## 📊 TÁCTICA: SWARMING VS DISPERSIÓN
`mermaid
graph TD
    subgraph Escenario_Malo [Dispersión]
        D1(Dev 1) --> T1[Tarea A]
        D2(Dev 2) --> T2[Tarea B]
        D3(Dev 3) --> T3[Tarea C]
    end
    subgraph Escenario_Bueno [Swarming]
        D4(Dev 1) --> TA[Tarea A]
        D5(Dev 2) --> TA
        D6(Dev 3) --> TA
        TA --> |Done!| TB[Tarea B]
    end
    style TA fill:#6f6
`
"@
if (-not (# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 -match "mermaidd")) { Set-Content e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md -Value (# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 + 
## 📊 VISUALIZACIÓN ESTRATÉGICA: EL PENTÁGONO
`mermaid
graph TD
    Tao[Tao (Misión)] --> Clima
    Clima[Clima (Contexto)] --> Terreno
    Terreno[Terreno (Infra)] --> Liderazgo
    Liderazgo[Liderazgo (Equipo)] --> Metodo
    Metodo[Método (Proceso)] --> Tao
    style Tao fill:#f9f,stroke:#333,stroke-width:4px
    style Terreno fill:#ccf,stroke:#333,stroke-width:2px
`
*Fig 1.1: El ciclo de influencia de los 5 factores.*) -Encoding UTF8 }


# --- MODULO 3 ---

# 3.1.1: Maniobra (Wizard of Oz)
e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md = "e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_3\tema_3.1_subtema_3.1.1_contenido.md"
# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 = Get-Content e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md -Raw

## 📊 VISUALIZACIÓN ESTRATÉGICA: EL PENTÁGONO
`mermaid
graph TD
    Tao[Tao (Misión)] --> Clima
    Clima[Clima (Contexto)] --> Terreno
    Terreno[Terreno (Infra)] --> Liderazgo
    Liderazgo[Liderazgo (Equipo)] --> Metodo
    Metodo[Método (Proceso)] --> Tao
    style Tao fill:#f9f,stroke:#333,stroke-width:4px
    style Terreno fill:#ccf,stroke:#333,stroke-width:2px
`
*Fig 1.1: El ciclo de influencia de los 5 factores.* = @"

## 📊 SECUENCIA: MAGO DE OZ
`mermaid
sequenceDiagram
    participant U as Usuario
    participant F as Frontend (Fake)
    participant H as Humano (Backend Real)
    U->>F: Pide recomendación
    F->>H: Email de alerta
    Note over H: Analiza en Google
    H->>F: Respuesta JSON manual
    F->>U: Muestra "AI Result"
`
"@
if (-not (# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 -match "mermaidd")) { Set-Content e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md -Value (# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 + 
## 📊 VISUALIZACIÓN ESTRATÉGICA: EL PENTÁGONO
`mermaid
graph TD
    Tao[Tao (Misión)] --> Clima
    Clima[Clima (Contexto)] --> Terreno
    Terreno[Terreno (Infra)] --> Liderazgo
    Liderazgo[Liderazgo (Equipo)] --> Metodo
    Metodo[Método (Proceso)] --> Tao
    style Tao fill:#f9f,stroke:#333,stroke-width:4px
    style Terreno fill:#ccf,stroke:#333,stroke-width:2px
`
*Fig 1.1: El ciclo de influencia de los 5 factores.*) -Encoding UTF8 }

# 3.2.2 Intelligence (Trace)
e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md = "e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_3\tema_3.2_subtema_3.2.2_contenido.md"
# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 = Get-Content e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md -Raw

## 📊 VISUALIZACIÓN ESTRATÉGICA: EL PENTÁGONO
`mermaid
graph TD
    Tao[Tao (Misión)] --> Clima
    Clima[Clima (Contexto)] --> Terreno
    Terreno[Terreno (Infra)] --> Liderazgo
    Liderazgo[Liderazgo (Equipo)] --> Metodo
    Metodo[Método (Proceso)] --> Tao
    style Tao fill:#f9f,stroke:#333,stroke-width:4px
    style Terreno fill:#ccf,stroke:#333,stroke-width:2px
`
*Fig 1.1: El ciclo de influencia de los 5 factores.* = @"

## 📊 VISUALIZACIÓN: DISTRIBUTED TRACING
`mermaid
gantt
    title Trace ID: abc-123 (Cascada de Latencia)
    dateFormat X
    axisFormat %s
    section Frontend
    Auth Check :a1, 0, 50
    section Backend
    Process Logic :a2, 50, 80
    section Database
    SQL Query (Lento) :crit, a3, 80, 500
    section Response
    Send JSON :a4, 500, 510
`
"@
if (-not (# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 -match "mermaidd")) { Set-Content e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md -Value (# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 + 
## 📊 VISUALIZACIÓN ESTRATÉGICA: EL PENTÁGONO
`mermaid
graph TD
    Tao[Tao (Misión)] --> Clima
    Clima[Clima (Contexto)] --> Terreno
    Terreno[Terreno (Infra)] --> Liderazgo
    Liderazgo[Liderazgo (Equipo)] --> Metodo
    Metodo[Método (Proceso)] --> Tao
    style Tao fill:#f9f,stroke:#333,stroke-width:4px
    style Terreno fill:#ccf,stroke:#333,stroke-width:2px
`
*Fig 1.1: El ciclo de influencia de los 5 factores.*) -Encoding UTF8 }

# 3.3.1 Chaos Sim
e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md = "e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_3\tema_3.3_subtema_3.3.1_contenido.md"
# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 = Get-Content e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md -Raw

## 📊 VISUALIZACIÓN ESTRATÉGICA: EL PENTÁGONO
`mermaid
graph TD
    Tao[Tao (Misión)] --> Clima
    Clima[Clima (Contexto)] --> Terreno
    Terreno[Terreno (Infra)] --> Liderazgo
    Liderazgo[Liderazgo (Equipo)] --> Metodo
    Metodo[Método (Proceso)] --> Tao
    style Tao fill:#f9f,stroke:#333,stroke-width:4px
    style Terreno fill:#ccf,stroke:#333,stroke-width:2px
`
*Fig 1.1: El ciclo de influencia de los 5 factores.* = @"

## 🔬 SIMULACIÓN INTERACTIVA
> **Laboratorio**: Tienes acceso a la consola de Chaos Monkey. Destruye servidores y observa si el sistema se recupera.
> [🏠 ABRIR CONSOLA DE CAOS](../../simulaciones/simulacion_m3_chaos.html)) -Encoding UTF8 }


# --- MODULO 4 ---

# 4.1.1 Virtudes + RPG
e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_3\tema_3.3_subtema_3.3.2_contenido.md = "e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_4\tema_4.1_subtema_4.1.1_contenido.md"
# PROTOCOLOS DE GUERRA: INCIDENT RESPONSE

**Tiempo estimado**: 50 minutos
**Nivel**: Tech Lead / Manager
**Prerrequisitos**: Liderazgo básico

## ¿Por qué importa este concepto?

Sun Tzu dice: *"El caos simulado nace de la disciplina; el miedo simulado nace del valor; la debilidad simulada nace de la fuerza"*.
Cuando el sistema cae a las 3 AM y Twitter arde, lo natural es el pánico (Caos real).
El objetivo de **Incident Response** es transformar ese pánico en un proceso militar disciplinado.

No importa qué tan buena sea tu arquitectura; vas a fallar. La diferencia entre una compañía mediocre y una de élite no es si fallan, sino qué tan rápido se recuperan (MTTR - Mean Time To Recovery).

## Conexión con conocimientos previos

Es la aplicación final de todo. Observabilidad (3.2) nos dice que hay fuego. Maniobra (3.1) nos da herramientas para apagarlo. Incident Response es la coordinación humana para usar esas herramientas.

---

## Comprensión intuitiva

### Roles de Batalla (ICS - Incident Command System)
Tomado de los bomberos. Cuando hay fuego, no hay democracia. Hay roles.

1.  **Incident Commander (IC)**: El jefe. No toca el teclado.
    -   *Función*: Toma decisiones, coordina, mantiene la visión global.
2.  **Ops Lead**: El táctico.
    -   *Función*: Toca el teclado. Ejecuta los cambios.
3.  **Comms Lead**: El diplomático.
    -   *Función*: Habla con clientes/internos. Actualiza la página de estado.

### El Anti-Patrón: "Todos ayudan"
Si 10 ingenieros entran al canal de Slack a tirar ideas y comandos al azar:
-   Aumenta el ruido.
-   Nadie sabe qué se ha probado.
-   Riesgo de empeorar el incidente.
**Regla**: Si no tienes rol asignado, te callas y observas.

---

## Implementación práctica: Fases del Incidente

### 1. Detección y Declaración
-   Alerta automática o reporte de usuario.
-   Alguien dice: "Declaro Incidente SEV-1". (Nivel de severidad).
-   Se abre canal de Slack `#incident-123`.
-   Se asigna el IC.

### 2. Contención (Torniquete)
-   **Objetivo**: Parar el sangrado. No arreglar la causa raíz.
-   *Ejemplo*: Si la DB está lenta por una feature nueva -> Rollback o Feature Flag OFF.
-   No investigues *por qué* la query es lenta ahora. Apágala. Recupera el servicio.

### 3. Remediación
-   Una vez el usuario está feliz (servicio arriba), investigamos la causa raíz con calma.

### 4. Post-Mortem (La Lección)
-   Documento escrito SIN CULPA (Blameless).
-   ¿Qué pasó? ¿Por qué? ¿Cómo evitamos que se repita?
-   Se generan tickets de mejora en Jira.

---

## Trampas y errores comunes

### ❌ Error: Buscar Culpables durante el fuego
"¿Quién pusheó este commit?"
-   **Efecto**: La gente se defiende en lugar de arreglar el problema. Miedo. Silencio.
-   **Sun Tzu**: *"Trata a tus soldados como a hijos amados y te seguirán al valle más profundo"*.
-   **Solución**: Enfócate en el sistema, no en la persona. "El sistema permitió que un error humano llegara a prod".

### ❌ Error: Fatiga de Alerta
Tener alertas PagerDuty para todo (Disco 80%, CPU 10%).
-   **Efecto**: El ingeniero ignora el teléfono. Cuando llega la alerta real (Sitio Caído), nadie responde.

---

## Resumen

**En una frase**: En la crisis, la disciplina vence al genio.

**Cuándo usarlo**:
-   Siempre que haya degradación del servicio.
-   Practicarlo con "Game Days" (simulacros).

**Siguiente paso**: Módulo 4 y 5. Hemos terminado el núcleo operativo. Pasamos a la **Carrera Profesional y Liderazgo Estratégico** (Módulo 4: El Liderazgo del General).
 = Get-Content e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_3\tema_3.3_subtema_3.3.2_contenido.md -Raw

## 🔬 SIMULACIÓN INTERACTIVA
> **Experimento**: ¿Cómo afecta el tamaño del lote a la velocidad de entrega?
> [🏠 ABRIR SIMULACIÓN DE PIPELINE](../../simulaciones/simulacion_m1_pipeline.html)

## 📊 GRÁFICO: LA CURVA J DEL RETRASO
`mermaid
xychart-beta
    title "Costo de No Desplegar (Deuda de Inventario)"
    x-axis [Día 1, Día 7, Día 14, Día 30]
    y-axis "Dinero Perdido" 0 --> 100
    line [10, 20, 50, 95]
`
"@
if (-not (# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 -match "simulacion_m1")) { Set-Content e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md -Value (# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 + 
## 📊 VISUALIZACIÓN ESTRATÉGICA: EL PENTÁGONO
`mermaid
graph TD
    Tao[Tao (Misión)] --> Clima
    Clima[Clima (Contexto)] --> Terreno
    Terreno[Terreno (Infra)] --> Liderazgo
    Liderazgo[Liderazgo (Equipo)] --> Metodo
    Metodo[Método (Proceso)] --> Tao
    style Tao fill:#f9f,stroke:#333,stroke-width:4px
    style Terreno fill:#ccf,stroke:#333,stroke-width:2px
`
*Fig 1.1: El ciclo de influencia de los 5 factores.*) -Encoding UTF8 }

# 1.3.1: Layers
e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md = "e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.3_subtema_1.3.1_contenido.md"
# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 = Get-Content e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md -Raw

## 📊 VISUALIZACIÓN ESTRATÉGICA: EL PENTÁGONO
`mermaid
graph TD
    Tao[Tao (Misión)] --> Clima
    Clima[Clima (Contexto)] --> Terreno
    Terreno[Terreno (Infra)] --> Liderazgo
    Liderazgo[Liderazgo (Equipo)] --> Metodo
    Metodo[Método (Proceso)] --> Tao
    style Tao fill:#f9f,stroke:#333,stroke-width:4px
    style Terreno fill:#ccf,stroke:#333,stroke-width:2px
`
*Fig 1.1: El ciclo de influencia de los 5 factores.* = @"

## 📊 ARQUITECTURA: DEFENSA EN CAPAS
`mermaid
graph BT
    L1[Capa Física (Difícil)] --> L2[Capa Lógica (Media)]
    L2 --> L3[Capa Conceptual (Fácil)]
    click L3 "Solución aquí: Barata"
    click L1 "Solución aquí: Cara"
    style L3 fill:#8f8,stroke:#333
    style L1 fill:#f88,stroke:#333
`
"@
if (-not (# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 -match "mermaidd")) { Set-Content e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md -Value (# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 + 
## 📊 VISUALIZACIÓN ESTRATÉGICA: EL PENTÁGONO
`mermaid
graph TD
    Tao[Tao (Misión)] --> Clima
    Clima[Clima (Contexto)] --> Terreno
    Terreno[Terreno (Infra)] --> Liderazgo
    Liderazgo[Liderazgo (Equipo)] --> Metodo
    Metodo[Método (Proceso)] --> Tao
    style Tao fill:#f9f,stroke:#333,stroke-width:4px
    style Terreno fill:#ccf,stroke:#333,stroke-width:2px
`
*Fig 1.1: El ciclo de influencia de los 5 factores.*) -Encoding UTF8 }


# --- MODULO 2 ---

# 2.1.1: Pets vs Cattle
e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md = "e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_2\tema_2.1_subtema_2.1.1_contenido.md"
# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 = Get-Content e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md -Raw

## 📊 VISUALIZACIÓN ESTRATÉGICA: EL PENTÁGONO
`mermaid
graph TD
    Tao[Tao (Misión)] --> Clima
    Clima[Clima (Contexto)] --> Terreno
    Terreno[Terreno (Infra)] --> Liderazgo
    Liderazgo[Liderazgo (Equipo)] --> Metodo
    Metodo[Método (Proceso)] --> Tao
    style Tao fill:#f9f,stroke:#333,stroke-width:4px
    style Terreno fill:#ccf,stroke:#333,stroke-width:2px
`
*Fig 1.1: El ciclo de influencia de los 5 factores.* = @"

## 📊 VISUALIZACIÓN: MASCOTAS VS GANADO
`mermaid
graph LR
    subgraph Pets [Mascotas (Tradicional)]
        S1(Server Zeus) --- S2(Server Apolo)
        style S1 fill:#f96
    end
    subgraph Cattle [Ganado (Cloud)]
        C1[Container 9a8b] -.- C2[Container 3x2y] -.- C3[Container 1z9p]
        style C1 fill:#69f
        style C3 fill:#69f
    end
`
"@
if (-not (# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 -match "mermaidd")) { Set-Content e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md -Value (# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 + 
## 📊 VISUALIZACIÓN ESTRATÉGICA: EL PENTÁGONO
`mermaid
graph TD
    Tao[Tao (Misión)] --> Clima
    Clima[Clima (Contexto)] --> Terreno
    Terreno[Terreno (Infra)] --> Liderazgo
    Liderazgo[Liderazgo (Equipo)] --> Metodo
    Metodo[Método (Proceso)] --> Tao
    style Tao fill:#f9f,stroke:#333,stroke-width:4px
    style Terreno fill:#ccf,stroke:#333,stroke-width:2px
`
*Fig 1.1: El ciclo de influencia de los 5 factores.*) -Encoding UTF8 }

# 2.2.1: Zheng/Qi + Sim Tokens
e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md = "e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_2\tema_2.2_subtema_2.2.1_contenido.md"
# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 = Get-Content e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md -Raw

## 📊 VISUALIZACIÓN ESTRATÉGICA: EL PENTÁGONO
`mermaid
graph TD
    Tao[Tao (Misión)] --> Clima
    Clima[Clima (Contexto)] --> Terreno
    Terreno[Terreno (Infra)] --> Liderazgo
    Liderazgo[Liderazgo (Equipo)] --> Metodo
    Metodo[Método (Proceso)] --> Tao
    style Tao fill:#f9f,stroke:#333,stroke-width:4px
    style Terreno fill:#ccf,stroke:#333,stroke-width:2px
`
*Fig 1.1: El ciclo de influencia de los 5 factores.* = @"

## 🔬 SIMULACIÓN INTERACTIVA
> **Reto**: Tienes 3 'Innovation Tokens'. ¿Puedes armar una arquitectura que no quiebre la empresa?
> [🏠 ABRIR JUEGO DE ARCHITECTURA](../../simulaciones/simulacion_m2_tokens.html)

## 📊 DISTRIBUCIÓN ÓPTIMA
`mermaid
pie title "Distribución de Arquitectura Sana"
    "Zheng (Estándar/Aburrido)" : 80
    "Qi (Innovador/Riesgoso)" : 20
`
"@
if (-not (# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 -match "simulacion_m2")) { Set-Content e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md -Value (# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 + 
## 📊 VISUALIZACIÓN ESTRATÉGICA: EL PENTÁGONO
`mermaid
graph TD
    Tao[Tao (Misión)] --> Clima
    Clima[Clima (Contexto)] --> Terreno
    Terreno[Terreno (Infra)] --> Liderazgo
    Liderazgo[Liderazgo (Equipo)] --> Metodo
    Metodo[Método (Proceso)] --> Tao
    style Tao fill:#f9f,stroke:#333,stroke-width:4px
    style Terreno fill:#ccf,stroke:#333,stroke-width:2px
`
*Fig 1.1: El ciclo de influencia de los 5 factores.*) -Encoding UTF8 }

# 2.3.2: Swarming
e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md = "e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_2\tema_2.3_subtema_2.3.2_contenido.md"
# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 = Get-Content e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md -Raw

## 📊 VISUALIZACIÓN ESTRATÉGICA: EL PENTÁGONO
`mermaid
graph TD
    Tao[Tao (Misión)] --> Clima
    Clima[Clima (Contexto)] --> Terreno
    Terreno[Terreno (Infra)] --> Liderazgo
    Liderazgo[Liderazgo (Equipo)] --> Metodo
    Metodo[Método (Proceso)] --> Tao
    style Tao fill:#f9f,stroke:#333,stroke-width:4px
    style Terreno fill:#ccf,stroke:#333,stroke-width:2px
`
*Fig 1.1: El ciclo de influencia de los 5 factores.* = @"

## 📊 TÁCTICA: SWARMING VS DISPERSIÓN
`mermaid
graph TD
    subgraph Escenario_Malo [Dispersión]
        D1(Dev 1) --> T1[Tarea A]
        D2(Dev 2) --> T2[Tarea B]
        D3(Dev 3) --> T3[Tarea C]
    end
    subgraph Escenario_Bueno [Swarming]
        D4(Dev 1) --> TA[Tarea A]
        D5(Dev 2) --> TA
        D6(Dev 3) --> TA
        TA --> |Done!| TB[Tarea B]
    end
    style TA fill:#6f6
`
"@
if (-not (# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 -match "mermaidd")) { Set-Content e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md -Value (# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 + 
## 📊 VISUALIZACIÓN ESTRATÉGICA: EL PENTÁGONO
`mermaid
graph TD
    Tao[Tao (Misión)] --> Clima
    Clima[Clima (Contexto)] --> Terreno
    Terreno[Terreno (Infra)] --> Liderazgo
    Liderazgo[Liderazgo (Equipo)] --> Metodo
    Metodo[Método (Proceso)] --> Tao
    style Tao fill:#f9f,stroke:#333,stroke-width:4px
    style Terreno fill:#ccf,stroke:#333,stroke-width:2px
`
*Fig 1.1: El ciclo de influencia de los 5 factores.*) -Encoding UTF8 }


# --- MODULO 3 ---

# 3.1.1: Maniobra (Wizard of Oz)
e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md = "e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_3\tema_3.1_subtema_3.1.1_contenido.md"
# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 = Get-Content e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md -Raw

## 📊 VISUALIZACIÓN ESTRATÉGICA: EL PENTÁGONO
`mermaid
graph TD
    Tao[Tao (Misión)] --> Clima
    Clima[Clima (Contexto)] --> Terreno
    Terreno[Terreno (Infra)] --> Liderazgo
    Liderazgo[Liderazgo (Equipo)] --> Metodo
    Metodo[Método (Proceso)] --> Tao
    style Tao fill:#f9f,stroke:#333,stroke-width:4px
    style Terreno fill:#ccf,stroke:#333,stroke-width:2px
`
*Fig 1.1: El ciclo de influencia de los 5 factores.* = @"

## 📊 SECUENCIA: MAGO DE OZ
`mermaid
sequenceDiagram
    participant U as Usuario
    participant F as Frontend (Fake)
    participant H as Humano (Backend Real)
    U->>F: Pide recomendación
    F->>H: Email de alerta
    Note over H: Analiza en Google
    H->>F: Respuesta JSON manual
    F->>U: Muestra "AI Result"
`
"@
if (-not (# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 -match "mermaidd")) { Set-Content e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md -Value (# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 + 
## 📊 VISUALIZACIÓN ESTRATÉGICA: EL PENTÁGONO
`mermaid
graph TD
    Tao[Tao (Misión)] --> Clima
    Clima[Clima (Contexto)] --> Terreno
    Terreno[Terreno (Infra)] --> Liderazgo
    Liderazgo[Liderazgo (Equipo)] --> Metodo
    Metodo[Método (Proceso)] --> Tao
    style Tao fill:#f9f,stroke:#333,stroke-width:4px
    style Terreno fill:#ccf,stroke:#333,stroke-width:2px
`
*Fig 1.1: El ciclo de influencia de los 5 factores.*) -Encoding UTF8 }

# 3.2.2 Intelligence (Trace)
e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md = "e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_3\tema_3.2_subtema_3.2.2_contenido.md"
# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 = Get-Content e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md -Raw

## 📊 VISUALIZACIÓN ESTRATÉGICA: EL PENTÁGONO
`mermaid
graph TD
    Tao[Tao (Misión)] --> Clima
    Clima[Clima (Contexto)] --> Terreno
    Terreno[Terreno (Infra)] --> Liderazgo
    Liderazgo[Liderazgo (Equipo)] --> Metodo
    Metodo[Método (Proceso)] --> Tao
    style Tao fill:#f9f,stroke:#333,stroke-width:4px
    style Terreno fill:#ccf,stroke:#333,stroke-width:2px
`
*Fig 1.1: El ciclo de influencia de los 5 factores.* = @"

## 📊 VISUALIZACIÓN: DISTRIBUTED TRACING
`mermaid
gantt
    title Trace ID: abc-123 (Cascada de Latencia)
    dateFormat X
    axisFormat %s
    section Frontend
    Auth Check :a1, 0, 50
    section Backend
    Process Logic :a2, 50, 80
    section Database
    SQL Query (Lento) :crit, a3, 80, 500
    section Response
    Send JSON :a4, 500, 510
`
"@
if (-not (# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 -match "mermaidd")) { Set-Content e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md -Value (# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 + 
## 📊 VISUALIZACIÓN ESTRATÉGICA: EL PENTÁGONO
`mermaid
graph TD
    Tao[Tao (Misión)] --> Clima
    Clima[Clima (Contexto)] --> Terreno
    Terreno[Terreno (Infra)] --> Liderazgo
    Liderazgo[Liderazgo (Equipo)] --> Metodo
    Metodo[Método (Proceso)] --> Tao
    style Tao fill:#f9f,stroke:#333,stroke-width:4px
    style Terreno fill:#ccf,stroke:#333,stroke-width:2px
`
*Fig 1.1: El ciclo de influencia de los 5 factores.*) -Encoding UTF8 }

# 3.3.1 Chaos Sim
e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md = "e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_3\tema_3.3_subtema_3.3.1_contenido.md"
# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 = Get-Content e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md -Raw

## 📊 VISUALIZACIÓN ESTRATÉGICA: EL PENTÁGONO
`mermaid
graph TD
    Tao[Tao (Misión)] --> Clima
    Clima[Clima (Contexto)] --> Terreno
    Terreno[Terreno (Infra)] --> Liderazgo
    Liderazgo[Liderazgo (Equipo)] --> Metodo
    Metodo[Método (Proceso)] --> Tao
    style Tao fill:#f9f,stroke:#333,stroke-width:4px
    style Terreno fill:#ccf,stroke:#333,stroke-width:2px
`
*Fig 1.1: El ciclo de influencia de los 5 factores.* = @"

## 🔬 SIMULACIÓN INTERACTIVA
> **Laboratorio**: Tienes acceso a la consola de Chaos Monkey. Destruye servidores y observa si el sistema se recupera.
> [🏠 ABRIR CONSOLA DE CAOS](../../simulaciones/simulacion_m3_chaos.html) = @"

## 🔬 SIMULACIÓN INTERACTIVA
> **Roleplay**: Eres un nuevo Tech Lead. ¿Tienes el coraje para enfrentarte al CEO?
> [🏠 JUGAR AVENTURA DE LIDERAZGO](../../simulaciones/simulacion_m4_rpg.html)

## 📊 MINDMAP: LAS 5 VIRTUDES
`mermaid
mindmap
  root((El General))
    Sabiduría
      (Visión Técnica)
    Sinceridad
      (Confianza)
    Benevolencia
      (Cuidado)
    Coraje
      (Decir No)
    Disciplina
      (Estándares)
`
"@
if (-not (# PROTOCOLOS DE GUERRA: INCIDENT RESPONSE

**Tiempo estimado**: 50 minutos
**Nivel**: Tech Lead / Manager
**Prerrequisitos**: Liderazgo básico

## ¿Por qué importa este concepto?

Sun Tzu dice: *"El caos simulado nace de la disciplina; el miedo simulado nace del valor; la debilidad simulada nace de la fuerza"*.
Cuando el sistema cae a las 3 AM y Twitter arde, lo natural es el pánico (Caos real).
El objetivo de **Incident Response** es transformar ese pánico en un proceso militar disciplinado.

No importa qué tan buena sea tu arquitectura; vas a fallar. La diferencia entre una compañía mediocre y una de élite no es si fallan, sino qué tan rápido se recuperan (MTTR - Mean Time To Recovery).

## Conexión con conocimientos previos

Es la aplicación final de todo. Observabilidad (3.2) nos dice que hay fuego. Maniobra (3.1) nos da herramientas para apagarlo. Incident Response es la coordinación humana para usar esas herramientas.

---

## Comprensión intuitiva

### Roles de Batalla (ICS - Incident Command System)
Tomado de los bomberos. Cuando hay fuego, no hay democracia. Hay roles.

1.  **Incident Commander (IC)**: El jefe. No toca el teclado.
    -   *Función*: Toma decisiones, coordina, mantiene la visión global.
2.  **Ops Lead**: El táctico.
    -   *Función*: Toca el teclado. Ejecuta los cambios.
3.  **Comms Lead**: El diplomático.
    -   *Función*: Habla con clientes/internos. Actualiza la página de estado.

### El Anti-Patrón: "Todos ayudan"
Si 10 ingenieros entran al canal de Slack a tirar ideas y comandos al azar:
-   Aumenta el ruido.
-   Nadie sabe qué se ha probado.
-   Riesgo de empeorar el incidente.
**Regla**: Si no tienes rol asignado, te callas y observas.

---

## Implementación práctica: Fases del Incidente

### 1. Detección y Declaración
-   Alerta automática o reporte de usuario.
-   Alguien dice: "Declaro Incidente SEV-1". (Nivel de severidad).
-   Se abre canal de Slack `#incident-123`.
-   Se asigna el IC.

### 2. Contención (Torniquete)
-   **Objetivo**: Parar el sangrado. No arreglar la causa raíz.
-   *Ejemplo*: Si la DB está lenta por una feature nueva -> Rollback o Feature Flag OFF.
-   No investigues *por qué* la query es lenta ahora. Apágala. Recupera el servicio.

### 3. Remediación
-   Una vez el usuario está feliz (servicio arriba), investigamos la causa raíz con calma.

### 4. Post-Mortem (La Lección)
-   Documento escrito SIN CULPA (Blameless).
-   ¿Qué pasó? ¿Por qué? ¿Cómo evitamos que se repita?
-   Se generan tickets de mejora en Jira.

---

## Trampas y errores comunes

### ❌ Error: Buscar Culpables durante el fuego
"¿Quién pusheó este commit?"
-   **Efecto**: La gente se defiende en lugar de arreglar el problema. Miedo. Silencio.
-   **Sun Tzu**: *"Trata a tus soldados como a hijos amados y te seguirán al valle más profundo"*.
-   **Solución**: Enfócate en el sistema, no en la persona. "El sistema permitió que un error humano llegara a prod".

### ❌ Error: Fatiga de Alerta
Tener alertas PagerDuty para todo (Disco 80%, CPU 10%).
-   **Efecto**: El ingeniero ignora el teléfono. Cuando llega la alerta real (Sitio Caído), nadie responde.

---

## Resumen

**En una frase**: En la crisis, la disciplina vence al genio.

**Cuándo usarlo**:
-   Siempre que haya degradación del servicio.
-   Practicarlo con "Game Days" (simulacros).

**Siguiente paso**: Módulo 4 y 5. Hemos terminado el núcleo operativo. Pasamos a la **Carrera Profesional y Liderazgo Estratégico** (Módulo 4: El Liderazgo del General).
 -match "simulacion_m4")) { Set-Content e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_3\tema_3.3_subtema_3.3.2_contenido.md -Value (# PROTOCOLOS DE GUERRA: INCIDENT RESPONSE

**Tiempo estimado**: 50 minutos
**Nivel**: Tech Lead / Manager
**Prerrequisitos**: Liderazgo básico

## ¿Por qué importa este concepto?

Sun Tzu dice: *"El caos simulado nace de la disciplina; el miedo simulado nace del valor; la debilidad simulada nace de la fuerza"*.
Cuando el sistema cae a las 3 AM y Twitter arde, lo natural es el pánico (Caos real).
El objetivo de **Incident Response** es transformar ese pánico en un proceso militar disciplinado.

No importa qué tan buena sea tu arquitectura; vas a fallar. La diferencia entre una compañía mediocre y una de élite no es si fallan, sino qué tan rápido se recuperan (MTTR - Mean Time To Recovery).

## Conexión con conocimientos previos

Es la aplicación final de todo. Observabilidad (3.2) nos dice que hay fuego. Maniobra (3.1) nos da herramientas para apagarlo. Incident Response es la coordinación humana para usar esas herramientas.

---

## Comprensión intuitiva

### Roles de Batalla (ICS - Incident Command System)
Tomado de los bomberos. Cuando hay fuego, no hay democracia. Hay roles.

1.  **Incident Commander (IC)**: El jefe. No toca el teclado.
    -   *Función*: Toma decisiones, coordina, mantiene la visión global.
2.  **Ops Lead**: El táctico.
    -   *Función*: Toca el teclado. Ejecuta los cambios.
3.  **Comms Lead**: El diplomático.
    -   *Función*: Habla con clientes/internos. Actualiza la página de estado.

### El Anti-Patrón: "Todos ayudan"
Si 10 ingenieros entran al canal de Slack a tirar ideas y comandos al azar:
-   Aumenta el ruido.
-   Nadie sabe qué se ha probado.
-   Riesgo de empeorar el incidente.
**Regla**: Si no tienes rol asignado, te callas y observas.

---

## Implementación práctica: Fases del Incidente

### 1. Detección y Declaración
-   Alerta automática o reporte de usuario.
-   Alguien dice: "Declaro Incidente SEV-1". (Nivel de severidad).
-   Se abre canal de Slack `#incident-123`.
-   Se asigna el IC.

### 2. Contención (Torniquete)
-   **Objetivo**: Parar el sangrado. No arreglar la causa raíz.
-   *Ejemplo*: Si la DB está lenta por una feature nueva -> Rollback o Feature Flag OFF.
-   No investigues *por qué* la query es lenta ahora. Apágala. Recupera el servicio.

### 3. Remediación
-   Una vez el usuario está feliz (servicio arriba), investigamos la causa raíz con calma.

### 4. Post-Mortem (La Lección)
-   Documento escrito SIN CULPA (Blameless).
-   ¿Qué pasó? ¿Por qué? ¿Cómo evitamos que se repita?
-   Se generan tickets de mejora en Jira.

---

## Trampas y errores comunes

### ❌ Error: Buscar Culpables durante el fuego
"¿Quién pusheó este commit?"
-   **Efecto**: La gente se defiende en lugar de arreglar el problema. Miedo. Silencio.
-   **Sun Tzu**: *"Trata a tus soldados como a hijos amados y te seguirán al valle más profundo"*.
-   **Solución**: Enfócate en el sistema, no en la persona. "El sistema permitió que un error humano llegara a prod".

### ❌ Error: Fatiga de Alerta
Tener alertas PagerDuty para todo (Disco 80%, CPU 10%).
-   **Efecto**: El ingeniero ignora el teléfono. Cuando llega la alerta real (Sitio Caído), nadie responde.

---

## Resumen

**En una frase**: En la crisis, la disciplina vence al genio.

**Cuándo usarlo**:
-   Siempre que haya degradación del servicio.
-   Practicarlo con "Game Days" (simulacros).

**Siguiente paso**: Módulo 4 y 5. Hemos terminado el núcleo operativo. Pasamos a la **Carrera Profesional y Liderazgo Estratégico** (Módulo 4: El Liderazgo del General).
 + 
## 🔬 SIMULACIÓN INTERACTIVA
> **Experimento**: ¿Cómo afecta el tamaño del lote a la velocidad de entrega?
> [🏠 ABRIR SIMULACIÓN DE PIPELINE](../../simulaciones/simulacion_m1_pipeline.html)

## 📊 GRÁFICO: LA CURVA J DEL RETRASO
`mermaid
xychart-beta
    title "Costo de No Desplegar (Deuda de Inventario)"
    x-axis [Día 1, Día 7, Día 14, Día 30]
    y-axis "Dinero Perdido" 0 --> 100
    line [10, 20, 50, 95]
`
"@
if (-not (# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 -match "simulacion_m1")) { Set-Content e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md -Value (# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 + 
## 📊 VISUALIZACIÓN ESTRATÉGICA: EL PENTÁGONO
`mermaid
graph TD
    Tao[Tao (Misión)] --> Clima
    Clima[Clima (Contexto)] --> Terreno
    Terreno[Terreno (Infra)] --> Liderazgo
    Liderazgo[Liderazgo (Equipo)] --> Metodo
    Metodo[Método (Proceso)] --> Tao
    style Tao fill:#f9f,stroke:#333,stroke-width:4px
    style Terreno fill:#ccf,stroke:#333,stroke-width:2px
`
*Fig 1.1: El ciclo de influencia de los 5 factores.*) -Encoding UTF8 }

# 1.3.1: Layers
e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md = "e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.3_subtema_1.3.1_contenido.md"
# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 = Get-Content e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md -Raw

## 📊 VISUALIZACIÓN ESTRATÉGICA: EL PENTÁGONO
`mermaid
graph TD
    Tao[Tao (Misión)] --> Clima
    Clima[Clima (Contexto)] --> Terreno
    Terreno[Terreno (Infra)] --> Liderazgo
    Liderazgo[Liderazgo (Equipo)] --> Metodo
    Metodo[Método (Proceso)] --> Tao
    style Tao fill:#f9f,stroke:#333,stroke-width:4px
    style Terreno fill:#ccf,stroke:#333,stroke-width:2px
`
*Fig 1.1: El ciclo de influencia de los 5 factores.* = @"

## 📊 ARQUITECTURA: DEFENSA EN CAPAS
`mermaid
graph BT
    L1[Capa Física (Difícil)] --> L2[Capa Lógica (Media)]
    L2 --> L3[Capa Conceptual (Fácil)]
    click L3 "Solución aquí: Barata"
    click L1 "Solución aquí: Cara"
    style L3 fill:#8f8,stroke:#333
    style L1 fill:#f88,stroke:#333
`
"@
if (-not (# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 -match "mermaidd")) { Set-Content e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md -Value (# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 + 
## 📊 VISUALIZACIÓN ESTRATÉGICA: EL PENTÁGONO
`mermaid
graph TD
    Tao[Tao (Misión)] --> Clima
    Clima[Clima (Contexto)] --> Terreno
    Terreno[Terreno (Infra)] --> Liderazgo
    Liderazgo[Liderazgo (Equipo)] --> Metodo
    Metodo[Método (Proceso)] --> Tao
    style Tao fill:#f9f,stroke:#333,stroke-width:4px
    style Terreno fill:#ccf,stroke:#333,stroke-width:2px
`
*Fig 1.1: El ciclo de influencia de los 5 factores.*) -Encoding UTF8 }


# --- MODULO 2 ---

# 2.1.1: Pets vs Cattle
e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md = "e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_2\tema_2.1_subtema_2.1.1_contenido.md"
# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 = Get-Content e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md -Raw

## 📊 VISUALIZACIÓN ESTRATÉGICA: EL PENTÁGONO
`mermaid
graph TD
    Tao[Tao (Misión)] --> Clima
    Clima[Clima (Contexto)] --> Terreno
    Terreno[Terreno (Infra)] --> Liderazgo
    Liderazgo[Liderazgo (Equipo)] --> Metodo
    Metodo[Método (Proceso)] --> Tao
    style Tao fill:#f9f,stroke:#333,stroke-width:4px
    style Terreno fill:#ccf,stroke:#333,stroke-width:2px
`
*Fig 1.1: El ciclo de influencia de los 5 factores.* = @"

## 📊 VISUALIZACIÓN: MASCOTAS VS GANADO
`mermaid
graph LR
    subgraph Pets [Mascotas (Tradicional)]
        S1(Server Zeus) --- S2(Server Apolo)
        style S1 fill:#f96
    end
    subgraph Cattle [Ganado (Cloud)]
        C1[Container 9a8b] -.- C2[Container 3x2y] -.- C3[Container 1z9p]
        style C1 fill:#69f
        style C3 fill:#69f
    end
`
"@
if (-not (# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 -match "mermaidd")) { Set-Content e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md -Value (# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 + 
## 📊 VISUALIZACIÓN ESTRATÉGICA: EL PENTÁGONO
`mermaid
graph TD
    Tao[Tao (Misión)] --> Clima
    Clima[Clima (Contexto)] --> Terreno
    Terreno[Terreno (Infra)] --> Liderazgo
    Liderazgo[Liderazgo (Equipo)] --> Metodo
    Metodo[Método (Proceso)] --> Tao
    style Tao fill:#f9f,stroke:#333,stroke-width:4px
    style Terreno fill:#ccf,stroke:#333,stroke-width:2px
`
*Fig 1.1: El ciclo de influencia de los 5 factores.*) -Encoding UTF8 }

# 2.2.1: Zheng/Qi + Sim Tokens
e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md = "e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_2\tema_2.2_subtema_2.2.1_contenido.md"
# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 = Get-Content e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md -Raw

## 📊 VISUALIZACIÓN ESTRATÉGICA: EL PENTÁGONO
`mermaid
graph TD
    Tao[Tao (Misión)] --> Clima
    Clima[Clima (Contexto)] --> Terreno
    Terreno[Terreno (Infra)] --> Liderazgo
    Liderazgo[Liderazgo (Equipo)] --> Metodo
    Metodo[Método (Proceso)] --> Tao
    style Tao fill:#f9f,stroke:#333,stroke-width:4px
    style Terreno fill:#ccf,stroke:#333,stroke-width:2px
`
*Fig 1.1: El ciclo de influencia de los 5 factores.* = @"

## 🔬 SIMULACIÓN INTERACTIVA
> **Reto**: Tienes 3 'Innovation Tokens'. ¿Puedes armar una arquitectura que no quiebre la empresa?
> [🏠 ABRIR JUEGO DE ARCHITECTURA](../../simulaciones/simulacion_m2_tokens.html)

## 📊 DISTRIBUCIÓN ÓPTIMA
`mermaid
pie title "Distribución de Arquitectura Sana"
    "Zheng (Estándar/Aburrido)" : 80
    "Qi (Innovador/Riesgoso)" : 20
`
"@
if (-not (# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 -match "simulacion_m2")) { Set-Content e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md -Value (# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 + 
## 📊 VISUALIZACIÓN ESTRATÉGICA: EL PENTÁGONO
`mermaid
graph TD
    Tao[Tao (Misión)] --> Clima
    Clima[Clima (Contexto)] --> Terreno
    Terreno[Terreno (Infra)] --> Liderazgo
    Liderazgo[Liderazgo (Equipo)] --> Metodo
    Metodo[Método (Proceso)] --> Tao
    style Tao fill:#f9f,stroke:#333,stroke-width:4px
    style Terreno fill:#ccf,stroke:#333,stroke-width:2px
`
*Fig 1.1: El ciclo de influencia de los 5 factores.*) -Encoding UTF8 }

# 2.3.2: Swarming
e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md = "e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_2\tema_2.3_subtema_2.3.2_contenido.md"
# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 = Get-Content e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md -Raw

## 📊 VISUALIZACIÓN ESTRATÉGICA: EL PENTÁGONO
`mermaid
graph TD
    Tao[Tao (Misión)] --> Clima
    Clima[Clima (Contexto)] --> Terreno
    Terreno[Terreno (Infra)] --> Liderazgo
    Liderazgo[Liderazgo (Equipo)] --> Metodo
    Metodo[Método (Proceso)] --> Tao
    style Tao fill:#f9f,stroke:#333,stroke-width:4px
    style Terreno fill:#ccf,stroke:#333,stroke-width:2px
`
*Fig 1.1: El ciclo de influencia de los 5 factores.* = @"

## 📊 TÁCTICA: SWARMING VS DISPERSIÓN
`mermaid
graph TD
    subgraph Escenario_Malo [Dispersión]
        D1(Dev 1) --> T1[Tarea A]
        D2(Dev 2) --> T2[Tarea B]
        D3(Dev 3) --> T3[Tarea C]
    end
    subgraph Escenario_Bueno [Swarming]
        D4(Dev 1) --> TA[Tarea A]
        D5(Dev 2) --> TA
        D6(Dev 3) --> TA
        TA --> |Done!| TB[Tarea B]
    end
    style TA fill:#6f6
`
"@
if (-not (# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 -match "mermaidd")) { Set-Content e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md -Value (# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 + 
## 📊 VISUALIZACIÓN ESTRATÉGICA: EL PENTÁGONO
`mermaid
graph TD
    Tao[Tao (Misión)] --> Clima
    Clima[Clima (Contexto)] --> Terreno
    Terreno[Terreno (Infra)] --> Liderazgo
    Liderazgo[Liderazgo (Equipo)] --> Metodo
    Metodo[Método (Proceso)] --> Tao
    style Tao fill:#f9f,stroke:#333,stroke-width:4px
    style Terreno fill:#ccf,stroke:#333,stroke-width:2px
`
*Fig 1.1: El ciclo de influencia de los 5 factores.*) -Encoding UTF8 }


# --- MODULO 3 ---

# 3.1.1: Maniobra (Wizard of Oz)
e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md = "e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_3\tema_3.1_subtema_3.1.1_contenido.md"
# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 = Get-Content e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md -Raw

## 📊 VISUALIZACIÓN ESTRATÉGICA: EL PENTÁGONO
`mermaid
graph TD
    Tao[Tao (Misión)] --> Clima
    Clima[Clima (Contexto)] --> Terreno
    Terreno[Terreno (Infra)] --> Liderazgo
    Liderazgo[Liderazgo (Equipo)] --> Metodo
    Metodo[Método (Proceso)] --> Tao
    style Tao fill:#f9f,stroke:#333,stroke-width:4px
    style Terreno fill:#ccf,stroke:#333,stroke-width:2px
`
*Fig 1.1: El ciclo de influencia de los 5 factores.* = @"

## 📊 SECUENCIA: MAGO DE OZ
`mermaid
sequenceDiagram
    participant U as Usuario
    participant F as Frontend (Fake)
    participant H as Humano (Backend Real)
    U->>F: Pide recomendación
    F->>H: Email de alerta
    Note over H: Analiza en Google
    H->>F: Respuesta JSON manual
    F->>U: Muestra "AI Result"
`
"@
if (-not (# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 -match "mermaidd")) { Set-Content e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md -Value (# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 + 
## 📊 VISUALIZACIÓN ESTRATÉGICA: EL PENTÁGONO
`mermaid
graph TD
    Tao[Tao (Misión)] --> Clima
    Clima[Clima (Contexto)] --> Terreno
    Terreno[Terreno (Infra)] --> Liderazgo
    Liderazgo[Liderazgo (Equipo)] --> Metodo
    Metodo[Método (Proceso)] --> Tao
    style Tao fill:#f9f,stroke:#333,stroke-width:4px
    style Terreno fill:#ccf,stroke:#333,stroke-width:2px
`
*Fig 1.1: El ciclo de influencia de los 5 factores.*) -Encoding UTF8 }

# 3.2.2 Intelligence (Trace)
e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md = "e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_3\tema_3.2_subtema_3.2.2_contenido.md"
# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 = Get-Content e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md -Raw

## 📊 VISUALIZACIÓN ESTRATÉGICA: EL PENTÁGONO
`mermaid
graph TD
    Tao[Tao (Misión)] --> Clima
    Clima[Clima (Contexto)] --> Terreno
    Terreno[Terreno (Infra)] --> Liderazgo
    Liderazgo[Liderazgo (Equipo)] --> Metodo
    Metodo[Método (Proceso)] --> Tao
    style Tao fill:#f9f,stroke:#333,stroke-width:4px
    style Terreno fill:#ccf,stroke:#333,stroke-width:2px
`
*Fig 1.1: El ciclo de influencia de los 5 factores.* = @"

## 📊 VISUALIZACIÓN: DISTRIBUTED TRACING
`mermaid
gantt
    title Trace ID: abc-123 (Cascada de Latencia)
    dateFormat X
    axisFormat %s
    section Frontend
    Auth Check :a1, 0, 50
    section Backend
    Process Logic :a2, 50, 80
    section Database
    SQL Query (Lento) :crit, a3, 80, 500
    section Response
    Send JSON :a4, 500, 510
`
"@
if (-not (# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 -match "mermaidd")) { Set-Content e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md -Value (# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 + 
## 📊 VISUALIZACIÓN ESTRATÉGICA: EL PENTÁGONO
`mermaid
graph TD
    Tao[Tao (Misión)] --> Clima
    Clima[Clima (Contexto)] --> Terreno
    Terreno[Terreno (Infra)] --> Liderazgo
    Liderazgo[Liderazgo (Equipo)] --> Metodo
    Metodo[Método (Proceso)] --> Tao
    style Tao fill:#f9f,stroke:#333,stroke-width:4px
    style Terreno fill:#ccf,stroke:#333,stroke-width:2px
`
*Fig 1.1: El ciclo de influencia de los 5 factores.*) -Encoding UTF8 }

# 3.3.1 Chaos Sim
e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md = "e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_3\tema_3.3_subtema_3.3.1_contenido.md"
# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 = Get-Content e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md -Raw

## 📊 VISUALIZACIÓN ESTRATÉGICA: EL PENTÁGONO
`mermaid
graph TD
    Tao[Tao (Misión)] --> Clima
    Clima[Clima (Contexto)] --> Terreno
    Terreno[Terreno (Infra)] --> Liderazgo
    Liderazgo[Liderazgo (Equipo)] --> Metodo
    Metodo[Método (Proceso)] --> Tao
    style Tao fill:#f9f,stroke:#333,stroke-width:4px
    style Terreno fill:#ccf,stroke:#333,stroke-width:2px
`
*Fig 1.1: El ciclo de influencia de los 5 factores.* = @"

## 🔬 SIMULACIÓN INTERACTIVA
> **Laboratorio**: Tienes acceso a la consola de Chaos Monkey. Destruye servidores y observa si el sistema se recupera.
> [🏠 ABRIR CONSOLA DE CAOS](../../simulaciones/simulacion_m3_chaos.html)) -Encoding UTF8 }

# 4.2.2 Puente Dorado
e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_3\tema_3.3_subtema_3.3.2_contenido.md = "e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_4\tema_4.2_subtema_4.2.2_contenido.md"
# PROTOCOLOS DE GUERRA: INCIDENT RESPONSE

**Tiempo estimado**: 50 minutos
**Nivel**: Tech Lead / Manager
**Prerrequisitos**: Liderazgo básico

## ¿Por qué importa este concepto?

Sun Tzu dice: *"El caos simulado nace de la disciplina; el miedo simulado nace del valor; la debilidad simulada nace de la fuerza"*.
Cuando el sistema cae a las 3 AM y Twitter arde, lo natural es el pánico (Caos real).
El objetivo de **Incident Response** es transformar ese pánico en un proceso militar disciplinado.

No importa qué tan buena sea tu arquitectura; vas a fallar. La diferencia entre una compañía mediocre y una de élite no es si fallan, sino qué tan rápido se recuperan (MTTR - Mean Time To Recovery).

## Conexión con conocimientos previos

Es la aplicación final de todo. Observabilidad (3.2) nos dice que hay fuego. Maniobra (3.1) nos da herramientas para apagarlo. Incident Response es la coordinación humana para usar esas herramientas.

---

## Comprensión intuitiva

### Roles de Batalla (ICS - Incident Command System)
Tomado de los bomberos. Cuando hay fuego, no hay democracia. Hay roles.

1.  **Incident Commander (IC)**: El jefe. No toca el teclado.
    -   *Función*: Toma decisiones, coordina, mantiene la visión global.
2.  **Ops Lead**: El táctico.
    -   *Función*: Toca el teclado. Ejecuta los cambios.
3.  **Comms Lead**: El diplomático.
    -   *Función*: Habla con clientes/internos. Actualiza la página de estado.

### El Anti-Patrón: "Todos ayudan"
Si 10 ingenieros entran al canal de Slack a tirar ideas y comandos al azar:
-   Aumenta el ruido.
-   Nadie sabe qué se ha probado.
-   Riesgo de empeorar el incidente.
**Regla**: Si no tienes rol asignado, te callas y observas.

---

## Implementación práctica: Fases del Incidente

### 1. Detección y Declaración
-   Alerta automática o reporte de usuario.
-   Alguien dice: "Declaro Incidente SEV-1". (Nivel de severidad).
-   Se abre canal de Slack `#incident-123`.
-   Se asigna el IC.

### 2. Contención (Torniquete)
-   **Objetivo**: Parar el sangrado. No arreglar la causa raíz.
-   *Ejemplo*: Si la DB está lenta por una feature nueva -> Rollback o Feature Flag OFF.
-   No investigues *por qué* la query es lenta ahora. Apágala. Recupera el servicio.

### 3. Remediación
-   Una vez el usuario está feliz (servicio arriba), investigamos la causa raíz con calma.

### 4. Post-Mortem (La Lección)
-   Documento escrito SIN CULPA (Blameless).
-   ¿Qué pasó? ¿Por qué? ¿Cómo evitamos que se repita?
-   Se generan tickets de mejora en Jira.

---

## Trampas y errores comunes

### ❌ Error: Buscar Culpables durante el fuego
"¿Quién pusheó este commit?"
-   **Efecto**: La gente se defiende en lugar de arreglar el problema. Miedo. Silencio.
-   **Sun Tzu**: *"Trata a tus soldados como a hijos amados y te seguirán al valle más profundo"*.
-   **Solución**: Enfócate en el sistema, no en la persona. "El sistema permitió que un error humano llegara a prod".

### ❌ Error: Fatiga de Alerta
Tener alertas PagerDuty para todo (Disco 80%, CPU 10%).
-   **Efecto**: El ingeniero ignora el teléfono. Cuando llega la alerta real (Sitio Caído), nadie responde.

---

## Resumen

**En una frase**: En la crisis, la disciplina vence al genio.

**Cuándo usarlo**:
-   Siempre que haya degradación del servicio.
-   Practicarlo con "Game Days" (simulacros).

**Siguiente paso**: Módulo 4 y 5. Hemos terminado el núcleo operativo. Pasamos a la **Carrera Profesional y Liderazgo Estratégico** (Módulo 4: El Liderazgo del General).
 = Get-Content e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_3\tema_3.3_subtema_3.3.2_contenido.md -Raw

## 🔬 SIMULACIÓN INTERACTIVA
> **Experimento**: ¿Cómo afecta el tamaño del lote a la velocidad de entrega?
> [🏠 ABRIR SIMULACIÓN DE PIPELINE](../../simulaciones/simulacion_m1_pipeline.html)

## 📊 GRÁFICO: LA CURVA J DEL RETRASO
`mermaid
xychart-beta
    title "Costo de No Desplegar (Deuda de Inventario)"
    x-axis [Día 1, Día 7, Día 14, Día 30]
    y-axis "Dinero Perdido" 0 --> 100
    line [10, 20, 50, 95]
`
"@
if (-not (# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 -match "simulacion_m1")) { Set-Content e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md -Value (# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 + 
## 📊 VISUALIZACIÓN ESTRATÉGICA: EL PENTÁGONO
`mermaid
graph TD
    Tao[Tao (Misión)] --> Clima
    Clima[Clima (Contexto)] --> Terreno
    Terreno[Terreno (Infra)] --> Liderazgo
    Liderazgo[Liderazgo (Equipo)] --> Metodo
    Metodo[Método (Proceso)] --> Tao
    style Tao fill:#f9f,stroke:#333,stroke-width:4px
    style Terreno fill:#ccf,stroke:#333,stroke-width:2px
`
*Fig 1.1: El ciclo de influencia de los 5 factores.*) -Encoding UTF8 }

# 1.3.1: Layers
e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md = "e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.3_subtema_1.3.1_contenido.md"
# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 = Get-Content e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md -Raw

## 📊 VISUALIZACIÓN ESTRATÉGICA: EL PENTÁGONO
`mermaid
graph TD
    Tao[Tao (Misión)] --> Clima
    Clima[Clima (Contexto)] --> Terreno
    Terreno[Terreno (Infra)] --> Liderazgo
    Liderazgo[Liderazgo (Equipo)] --> Metodo
    Metodo[Método (Proceso)] --> Tao
    style Tao fill:#f9f,stroke:#333,stroke-width:4px
    style Terreno fill:#ccf,stroke:#333,stroke-width:2px
`
*Fig 1.1: El ciclo de influencia de los 5 factores.* = @"

## 📊 ARQUITECTURA: DEFENSA EN CAPAS
`mermaid
graph BT
    L1[Capa Física (Difícil)] --> L2[Capa Lógica (Media)]
    L2 --> L3[Capa Conceptual (Fácil)]
    click L3 "Solución aquí: Barata"
    click L1 "Solución aquí: Cara"
    style L3 fill:#8f8,stroke:#333
    style L1 fill:#f88,stroke:#333
`
"@
if (-not (# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 -match "mermaidd")) { Set-Content e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md -Value (# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 + 
## 📊 VISUALIZACIÓN ESTRATÉGICA: EL PENTÁGONO
`mermaid
graph TD
    Tao[Tao (Misión)] --> Clima
    Clima[Clima (Contexto)] --> Terreno
    Terreno[Terreno (Infra)] --> Liderazgo
    Liderazgo[Liderazgo (Equipo)] --> Metodo
    Metodo[Método (Proceso)] --> Tao
    style Tao fill:#f9f,stroke:#333,stroke-width:4px
    style Terreno fill:#ccf,stroke:#333,stroke-width:2px
`
*Fig 1.1: El ciclo de influencia de los 5 factores.*) -Encoding UTF8 }


# --- MODULO 2 ---

# 2.1.1: Pets vs Cattle
e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md = "e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_2\tema_2.1_subtema_2.1.1_contenido.md"
# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 = Get-Content e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md -Raw

## 📊 VISUALIZACIÓN ESTRATÉGICA: EL PENTÁGONO
`mermaid
graph TD
    Tao[Tao (Misión)] --> Clima
    Clima[Clima (Contexto)] --> Terreno
    Terreno[Terreno (Infra)] --> Liderazgo
    Liderazgo[Liderazgo (Equipo)] --> Metodo
    Metodo[Método (Proceso)] --> Tao
    style Tao fill:#f9f,stroke:#333,stroke-width:4px
    style Terreno fill:#ccf,stroke:#333,stroke-width:2px
`
*Fig 1.1: El ciclo de influencia de los 5 factores.* = @"

## 📊 VISUALIZACIÓN: MASCOTAS VS GANADO
`mermaid
graph LR
    subgraph Pets [Mascotas (Tradicional)]
        S1(Server Zeus) --- S2(Server Apolo)
        style S1 fill:#f96
    end
    subgraph Cattle [Ganado (Cloud)]
        C1[Container 9a8b] -.- C2[Container 3x2y] -.- C3[Container 1z9p]
        style C1 fill:#69f
        style C3 fill:#69f
    end
`
"@
if (-not (# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 -match "mermaidd")) { Set-Content e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md -Value (# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 + 
## 📊 VISUALIZACIÓN ESTRATÉGICA: EL PENTÁGONO
`mermaid
graph TD
    Tao[Tao (Misión)] --> Clima
    Clima[Clima (Contexto)] --> Terreno
    Terreno[Terreno (Infra)] --> Liderazgo
    Liderazgo[Liderazgo (Equipo)] --> Metodo
    Metodo[Método (Proceso)] --> Tao
    style Tao fill:#f9f,stroke:#333,stroke-width:4px
    style Terreno fill:#ccf,stroke:#333,stroke-width:2px
`
*Fig 1.1: El ciclo de influencia de los 5 factores.*) -Encoding UTF8 }

# 2.2.1: Zheng/Qi + Sim Tokens
e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md = "e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_2\tema_2.2_subtema_2.2.1_contenido.md"
# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 = Get-Content e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md -Raw

## 📊 VISUALIZACIÓN ESTRATÉGICA: EL PENTÁGONO
`mermaid
graph TD
    Tao[Tao (Misión)] --> Clima
    Clima[Clima (Contexto)] --> Terreno
    Terreno[Terreno (Infra)] --> Liderazgo
    Liderazgo[Liderazgo (Equipo)] --> Metodo
    Metodo[Método (Proceso)] --> Tao
    style Tao fill:#f9f,stroke:#333,stroke-width:4px
    style Terreno fill:#ccf,stroke:#333,stroke-width:2px
`
*Fig 1.1: El ciclo de influencia de los 5 factores.* = @"

## 🔬 SIMULACIÓN INTERACTIVA
> **Reto**: Tienes 3 'Innovation Tokens'. ¿Puedes armar una arquitectura que no quiebre la empresa?
> [🏠 ABRIR JUEGO DE ARCHITECTURA](../../simulaciones/simulacion_m2_tokens.html)

## 📊 DISTRIBUCIÓN ÓPTIMA
`mermaid
pie title "Distribución de Arquitectura Sana"
    "Zheng (Estándar/Aburrido)" : 80
    "Qi (Innovador/Riesgoso)" : 20
`
"@
if (-not (# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 -match "simulacion_m2")) { Set-Content e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md -Value (# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 + 
## 📊 VISUALIZACIÓN ESTRATÉGICA: EL PENTÁGONO
`mermaid
graph TD
    Tao[Tao (Misión)] --> Clima
    Clima[Clima (Contexto)] --> Terreno
    Terreno[Terreno (Infra)] --> Liderazgo
    Liderazgo[Liderazgo (Equipo)] --> Metodo
    Metodo[Método (Proceso)] --> Tao
    style Tao fill:#f9f,stroke:#333,stroke-width:4px
    style Terreno fill:#ccf,stroke:#333,stroke-width:2px
`
*Fig 1.1: El ciclo de influencia de los 5 factores.*) -Encoding UTF8 }

# 2.3.2: Swarming
e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md = "e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_2\tema_2.3_subtema_2.3.2_contenido.md"
# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 = Get-Content e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md -Raw

## 📊 VISUALIZACIÓN ESTRATÉGICA: EL PENTÁGONO
`mermaid
graph TD
    Tao[Tao (Misión)] --> Clima
    Clima[Clima (Contexto)] --> Terreno
    Terreno[Terreno (Infra)] --> Liderazgo
    Liderazgo[Liderazgo (Equipo)] --> Metodo
    Metodo[Método (Proceso)] --> Tao
    style Tao fill:#f9f,stroke:#333,stroke-width:4px
    style Terreno fill:#ccf,stroke:#333,stroke-width:2px
`
*Fig 1.1: El ciclo de influencia de los 5 factores.* = @"

## 📊 TÁCTICA: SWARMING VS DISPERSIÓN
`mermaid
graph TD
    subgraph Escenario_Malo [Dispersión]
        D1(Dev 1) --> T1[Tarea A]
        D2(Dev 2) --> T2[Tarea B]
        D3(Dev 3) --> T3[Tarea C]
    end
    subgraph Escenario_Bueno [Swarming]
        D4(Dev 1) --> TA[Tarea A]
        D5(Dev 2) --> TA
        D6(Dev 3) --> TA
        TA --> |Done!| TB[Tarea B]
    end
    style TA fill:#6f6
`
"@
if (-not (# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 -match "mermaidd")) { Set-Content e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md -Value (# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 + 
## 📊 VISUALIZACIÓN ESTRATÉGICA: EL PENTÁGONO
`mermaid
graph TD
    Tao[Tao (Misión)] --> Clima
    Clima[Clima (Contexto)] --> Terreno
    Terreno[Terreno (Infra)] --> Liderazgo
    Liderazgo[Liderazgo (Equipo)] --> Metodo
    Metodo[Método (Proceso)] --> Tao
    style Tao fill:#f9f,stroke:#333,stroke-width:4px
    style Terreno fill:#ccf,stroke:#333,stroke-width:2px
`
*Fig 1.1: El ciclo de influencia de los 5 factores.*) -Encoding UTF8 }


# --- MODULO 3 ---

# 3.1.1: Maniobra (Wizard of Oz)
e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md = "e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_3\tema_3.1_subtema_3.1.1_contenido.md"
# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 = Get-Content e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md -Raw

## 📊 VISUALIZACIÓN ESTRATÉGICA: EL PENTÁGONO
`mermaid
graph TD
    Tao[Tao (Misión)] --> Clima
    Clima[Clima (Contexto)] --> Terreno
    Terreno[Terreno (Infra)] --> Liderazgo
    Liderazgo[Liderazgo (Equipo)] --> Metodo
    Metodo[Método (Proceso)] --> Tao
    style Tao fill:#f9f,stroke:#333,stroke-width:4px
    style Terreno fill:#ccf,stroke:#333,stroke-width:2px
`
*Fig 1.1: El ciclo de influencia de los 5 factores.* = @"

## 📊 SECUENCIA: MAGO DE OZ
`mermaid
sequenceDiagram
    participant U as Usuario
    participant F as Frontend (Fake)
    participant H as Humano (Backend Real)
    U->>F: Pide recomendación
    F->>H: Email de alerta
    Note over H: Analiza en Google
    H->>F: Respuesta JSON manual
    F->>U: Muestra "AI Result"
`
"@
if (-not (# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 -match "mermaidd")) { Set-Content e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md -Value (# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 + 
## 📊 VISUALIZACIÓN ESTRATÉGICA: EL PENTÁGONO
`mermaid
graph TD
    Tao[Tao (Misión)] --> Clima
    Clima[Clima (Contexto)] --> Terreno
    Terreno[Terreno (Infra)] --> Liderazgo
    Liderazgo[Liderazgo (Equipo)] --> Metodo
    Metodo[Método (Proceso)] --> Tao
    style Tao fill:#f9f,stroke:#333,stroke-width:4px
    style Terreno fill:#ccf,stroke:#333,stroke-width:2px
`
*Fig 1.1: El ciclo de influencia de los 5 factores.*) -Encoding UTF8 }

# 3.2.2 Intelligence (Trace)
e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md = "e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_3\tema_3.2_subtema_3.2.2_contenido.md"
# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 = Get-Content e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md -Raw

## 📊 VISUALIZACIÓN ESTRATÉGICA: EL PENTÁGONO
`mermaid
graph TD
    Tao[Tao (Misión)] --> Clima
    Clima[Clima (Contexto)] --> Terreno
    Terreno[Terreno (Infra)] --> Liderazgo
    Liderazgo[Liderazgo (Equipo)] --> Metodo
    Metodo[Método (Proceso)] --> Tao
    style Tao fill:#f9f,stroke:#333,stroke-width:4px
    style Terreno fill:#ccf,stroke:#333,stroke-width:2px
`
*Fig 1.1: El ciclo de influencia de los 5 factores.* = @"

## 📊 VISUALIZACIÓN: DISTRIBUTED TRACING
`mermaid
gantt
    title Trace ID: abc-123 (Cascada de Latencia)
    dateFormat X
    axisFormat %s
    section Frontend
    Auth Check :a1, 0, 50
    section Backend
    Process Logic :a2, 50, 80
    section Database
    SQL Query (Lento) :crit, a3, 80, 500
    section Response
    Send JSON :a4, 500, 510
`
"@
if (-not (# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 -match "mermaidd")) { Set-Content e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md -Value (# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 + 
## 📊 VISUALIZACIÓN ESTRATÉGICA: EL PENTÁGONO
`mermaid
graph TD
    Tao[Tao (Misión)] --> Clima
    Clima[Clima (Contexto)] --> Terreno
    Terreno[Terreno (Infra)] --> Liderazgo
    Liderazgo[Liderazgo (Equipo)] --> Metodo
    Metodo[Método (Proceso)] --> Tao
    style Tao fill:#f9f,stroke:#333,stroke-width:4px
    style Terreno fill:#ccf,stroke:#333,stroke-width:2px
`
*Fig 1.1: El ciclo de influencia de los 5 factores.*) -Encoding UTF8 }

# 3.3.1 Chaos Sim
e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md = "e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_3\tema_3.3_subtema_3.3.1_contenido.md"
# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 = Get-Content e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md -Raw

## 📊 VISUALIZACIÓN ESTRATÉGICA: EL PENTÁGONO
`mermaid
graph TD
    Tao[Tao (Misión)] --> Clima
    Clima[Clima (Contexto)] --> Terreno
    Terreno[Terreno (Infra)] --> Liderazgo
    Liderazgo[Liderazgo (Equipo)] --> Metodo
    Metodo[Método (Proceso)] --> Tao
    style Tao fill:#f9f,stroke:#333,stroke-width:4px
    style Terreno fill:#ccf,stroke:#333,stroke-width:2px
`
*Fig 1.1: El ciclo de influencia de los 5 factores.* = @"

## 🔬 SIMULACIÓN INTERACTIVA
> **Laboratorio**: Tienes acceso a la consola de Chaos Monkey. Destruye servidores y observa si el sistema se recupera.
> [🏠 ABRIR CONSOLA DE CAOS](../../simulaciones/simulacion_m3_chaos.html) = @"

## 📊 TÁCTICA: EL PUENTE DORADO
`mermaid
graph LR
    A[Tu Posición] -- Conflicto --> B[Posición Enemiga]
    A -- Puente Dorado --> C{Acuerdo Ganar-Ganar}
    B -- Salida Honorable --> C
    style C fill:#fd0
`
"@
if (-not (# PROTOCOLOS DE GUERRA: INCIDENT RESPONSE

**Tiempo estimado**: 50 minutos
**Nivel**: Tech Lead / Manager
**Prerrequisitos**: Liderazgo básico

## ¿Por qué importa este concepto?

Sun Tzu dice: *"El caos simulado nace de la disciplina; el miedo simulado nace del valor; la debilidad simulada nace de la fuerza"*.
Cuando el sistema cae a las 3 AM y Twitter arde, lo natural es el pánico (Caos real).
El objetivo de **Incident Response** es transformar ese pánico en un proceso militar disciplinado.

No importa qué tan buena sea tu arquitectura; vas a fallar. La diferencia entre una compañía mediocre y una de élite no es si fallan, sino qué tan rápido se recuperan (MTTR - Mean Time To Recovery).

## Conexión con conocimientos previos

Es la aplicación final de todo. Observabilidad (3.2) nos dice que hay fuego. Maniobra (3.1) nos da herramientas para apagarlo. Incident Response es la coordinación humana para usar esas herramientas.

---

## Comprensión intuitiva

### Roles de Batalla (ICS - Incident Command System)
Tomado de los bomberos. Cuando hay fuego, no hay democracia. Hay roles.

1.  **Incident Commander (IC)**: El jefe. No toca el teclado.
    -   *Función*: Toma decisiones, coordina, mantiene la visión global.
2.  **Ops Lead**: El táctico.
    -   *Función*: Toca el teclado. Ejecuta los cambios.
3.  **Comms Lead**: El diplomático.
    -   *Función*: Habla con clientes/internos. Actualiza la página de estado.

### El Anti-Patrón: "Todos ayudan"
Si 10 ingenieros entran al canal de Slack a tirar ideas y comandos al azar:
-   Aumenta el ruido.
-   Nadie sabe qué se ha probado.
-   Riesgo de empeorar el incidente.
**Regla**: Si no tienes rol asignado, te callas y observas.

---

## Implementación práctica: Fases del Incidente

### 1. Detección y Declaración
-   Alerta automática o reporte de usuario.
-   Alguien dice: "Declaro Incidente SEV-1". (Nivel de severidad).
-   Se abre canal de Slack `#incident-123`.
-   Se asigna el IC.

### 2. Contención (Torniquete)
-   **Objetivo**: Parar el sangrado. No arreglar la causa raíz.
-   *Ejemplo*: Si la DB está lenta por una feature nueva -> Rollback o Feature Flag OFF.
-   No investigues *por qué* la query es lenta ahora. Apágala. Recupera el servicio.

### 3. Remediación
-   Una vez el usuario está feliz (servicio arriba), investigamos la causa raíz con calma.

### 4. Post-Mortem (La Lección)
-   Documento escrito SIN CULPA (Blameless).
-   ¿Qué pasó? ¿Por qué? ¿Cómo evitamos que se repita?
-   Se generan tickets de mejora en Jira.

---

## Trampas y errores comunes

### ❌ Error: Buscar Culpables durante el fuego
"¿Quién pusheó este commit?"
-   **Efecto**: La gente se defiende en lugar de arreglar el problema. Miedo. Silencio.
-   **Sun Tzu**: *"Trata a tus soldados como a hijos amados y te seguirán al valle más profundo"*.
-   **Solución**: Enfócate en el sistema, no en la persona. "El sistema permitió que un error humano llegara a prod".

### ❌ Error: Fatiga de Alerta
Tener alertas PagerDuty para todo (Disco 80%, CPU 10%).
-   **Efecto**: El ingeniero ignora el teléfono. Cuando llega la alerta real (Sitio Caído), nadie responde.

---

## Resumen

**En una frase**: En la crisis, la disciplina vence al genio.

**Cuándo usarlo**:
-   Siempre que haya degradación del servicio.
-   Practicarlo con "Game Days" (simulacros).

**Siguiente paso**: Módulo 4 y 5. Hemos terminado el núcleo operativo. Pasamos a la **Carrera Profesional y Liderazgo Estratégico** (Módulo 4: El Liderazgo del General).
 -match "mermaidd")) { Set-Content e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_3\tema_3.3_subtema_3.3.2_contenido.md -Value (# PROTOCOLOS DE GUERRA: INCIDENT RESPONSE

**Tiempo estimado**: 50 minutos
**Nivel**: Tech Lead / Manager
**Prerrequisitos**: Liderazgo básico

## ¿Por qué importa este concepto?

Sun Tzu dice: *"El caos simulado nace de la disciplina; el miedo simulado nace del valor; la debilidad simulada nace de la fuerza"*.
Cuando el sistema cae a las 3 AM y Twitter arde, lo natural es el pánico (Caos real).
El objetivo de **Incident Response** es transformar ese pánico en un proceso militar disciplinado.

No importa qué tan buena sea tu arquitectura; vas a fallar. La diferencia entre una compañía mediocre y una de élite no es si fallan, sino qué tan rápido se recuperan (MTTR - Mean Time To Recovery).

## Conexión con conocimientos previos

Es la aplicación final de todo. Observabilidad (3.2) nos dice que hay fuego. Maniobra (3.1) nos da herramientas para apagarlo. Incident Response es la coordinación humana para usar esas herramientas.

---

## Comprensión intuitiva

### Roles de Batalla (ICS - Incident Command System)
Tomado de los bomberos. Cuando hay fuego, no hay democracia. Hay roles.

1.  **Incident Commander (IC)**: El jefe. No toca el teclado.
    -   *Función*: Toma decisiones, coordina, mantiene la visión global.
2.  **Ops Lead**: El táctico.
    -   *Función*: Toca el teclado. Ejecuta los cambios.
3.  **Comms Lead**: El diplomático.
    -   *Función*: Habla con clientes/internos. Actualiza la página de estado.

### El Anti-Patrón: "Todos ayudan"
Si 10 ingenieros entran al canal de Slack a tirar ideas y comandos al azar:
-   Aumenta el ruido.
-   Nadie sabe qué se ha probado.
-   Riesgo de empeorar el incidente.
**Regla**: Si no tienes rol asignado, te callas y observas.

---

## Implementación práctica: Fases del Incidente

### 1. Detección y Declaración
-   Alerta automática o reporte de usuario.
-   Alguien dice: "Declaro Incidente SEV-1". (Nivel de severidad).
-   Se abre canal de Slack `#incident-123`.
-   Se asigna el IC.

### 2. Contención (Torniquete)
-   **Objetivo**: Parar el sangrado. No arreglar la causa raíz.
-   *Ejemplo*: Si la DB está lenta por una feature nueva -> Rollback o Feature Flag OFF.
-   No investigues *por qué* la query es lenta ahora. Apágala. Recupera el servicio.

### 3. Remediación
-   Una vez el usuario está feliz (servicio arriba), investigamos la causa raíz con calma.

### 4. Post-Mortem (La Lección)
-   Documento escrito SIN CULPA (Blameless).
-   ¿Qué pasó? ¿Por qué? ¿Cómo evitamos que se repita?
-   Se generan tickets de mejora en Jira.

---

## Trampas y errores comunes

### ❌ Error: Buscar Culpables durante el fuego
"¿Quién pusheó este commit?"
-   **Efecto**: La gente se defiende en lugar de arreglar el problema. Miedo. Silencio.
-   **Sun Tzu**: *"Trata a tus soldados como a hijos amados y te seguirán al valle más profundo"*.
-   **Solución**: Enfócate en el sistema, no en la persona. "El sistema permitió que un error humano llegara a prod".

### ❌ Error: Fatiga de Alerta
Tener alertas PagerDuty para todo (Disco 80%, CPU 10%).
-   **Efecto**: El ingeniero ignora el teléfono. Cuando llega la alerta real (Sitio Caído), nadie responde.

---

## Resumen

**En una frase**: En la crisis, la disciplina vence al genio.

**Cuándo usarlo**:
-   Siempre que haya degradación del servicio.
-   Practicarlo con "Game Days" (simulacros).

**Siguiente paso**: Módulo 4 y 5. Hemos terminado el núcleo operativo. Pasamos a la **Carrera Profesional y Liderazgo Estratégico** (Módulo 4: El Liderazgo del General).
 + 
## 🔬 SIMULACIÓN INTERACTIVA
> **Experimento**: ¿Cómo afecta el tamaño del lote a la velocidad de entrega?
> [🏠 ABRIR SIMULACIÓN DE PIPELINE](../../simulaciones/simulacion_m1_pipeline.html)

## 📊 GRÁFICO: LA CURVA J DEL RETRASO
`mermaid
xychart-beta
    title "Costo de No Desplegar (Deuda de Inventario)"
    x-axis [Día 1, Día 7, Día 14, Día 30]
    y-axis "Dinero Perdido" 0 --> 100
    line [10, 20, 50, 95]
`
"@
if (-not (# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 -match "simulacion_m1")) { Set-Content e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md -Value (# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 + 
## 📊 VISUALIZACIÓN ESTRATÉGICA: EL PENTÁGONO
`mermaid
graph TD
    Tao[Tao (Misión)] --> Clima
    Clima[Clima (Contexto)] --> Terreno
    Terreno[Terreno (Infra)] --> Liderazgo
    Liderazgo[Liderazgo (Equipo)] --> Metodo
    Metodo[Método (Proceso)] --> Tao
    style Tao fill:#f9f,stroke:#333,stroke-width:4px
    style Terreno fill:#ccf,stroke:#333,stroke-width:2px
`
*Fig 1.1: El ciclo de influencia de los 5 factores.*) -Encoding UTF8 }

# 1.3.1: Layers
e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md = "e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.3_subtema_1.3.1_contenido.md"
# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 = Get-Content e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md -Raw

## 📊 VISUALIZACIÓN ESTRATÉGICA: EL PENTÁGONO
`mermaid
graph TD
    Tao[Tao (Misión)] --> Clima
    Clima[Clima (Contexto)] --> Terreno
    Terreno[Terreno (Infra)] --> Liderazgo
    Liderazgo[Liderazgo (Equipo)] --> Metodo
    Metodo[Método (Proceso)] --> Tao
    style Tao fill:#f9f,stroke:#333,stroke-width:4px
    style Terreno fill:#ccf,stroke:#333,stroke-width:2px
`
*Fig 1.1: El ciclo de influencia de los 5 factores.* = @"

## 📊 ARQUITECTURA: DEFENSA EN CAPAS
`mermaid
graph BT
    L1[Capa Física (Difícil)] --> L2[Capa Lógica (Media)]
    L2 --> L3[Capa Conceptual (Fácil)]
    click L3 "Solución aquí: Barata"
    click L1 "Solución aquí: Cara"
    style L3 fill:#8f8,stroke:#333
    style L1 fill:#f88,stroke:#333
`
"@
if (-not (# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 -match "mermaidd")) { Set-Content e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md -Value (# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 + 
## 📊 VISUALIZACIÓN ESTRATÉGICA: EL PENTÁGONO
`mermaid
graph TD
    Tao[Tao (Misión)] --> Clima
    Clima[Clima (Contexto)] --> Terreno
    Terreno[Terreno (Infra)] --> Liderazgo
    Liderazgo[Liderazgo (Equipo)] --> Metodo
    Metodo[Método (Proceso)] --> Tao
    style Tao fill:#f9f,stroke:#333,stroke-width:4px
    style Terreno fill:#ccf,stroke:#333,stroke-width:2px
`
*Fig 1.1: El ciclo de influencia de los 5 factores.*) -Encoding UTF8 }


# --- MODULO 2 ---

# 2.1.1: Pets vs Cattle
e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md = "e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_2\tema_2.1_subtema_2.1.1_contenido.md"
# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 = Get-Content e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md -Raw

## 📊 VISUALIZACIÓN ESTRATÉGICA: EL PENTÁGONO
`mermaid
graph TD
    Tao[Tao (Misión)] --> Clima
    Clima[Clima (Contexto)] --> Terreno
    Terreno[Terreno (Infra)] --> Liderazgo
    Liderazgo[Liderazgo (Equipo)] --> Metodo
    Metodo[Método (Proceso)] --> Tao
    style Tao fill:#f9f,stroke:#333,stroke-width:4px
    style Terreno fill:#ccf,stroke:#333,stroke-width:2px
`
*Fig 1.1: El ciclo de influencia de los 5 factores.* = @"

## 📊 VISUALIZACIÓN: MASCOTAS VS GANADO
`mermaid
graph LR
    subgraph Pets [Mascotas (Tradicional)]
        S1(Server Zeus) --- S2(Server Apolo)
        style S1 fill:#f96
    end
    subgraph Cattle [Ganado (Cloud)]
        C1[Container 9a8b] -.- C2[Container 3x2y] -.- C3[Container 1z9p]
        style C1 fill:#69f
        style C3 fill:#69f
    end
`
"@
if (-not (# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 -match "mermaidd")) { Set-Content e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md -Value (# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 + 
## 📊 VISUALIZACIÓN ESTRATÉGICA: EL PENTÁGONO
`mermaid
graph TD
    Tao[Tao (Misión)] --> Clima
    Clima[Clima (Contexto)] --> Terreno
    Terreno[Terreno (Infra)] --> Liderazgo
    Liderazgo[Liderazgo (Equipo)] --> Metodo
    Metodo[Método (Proceso)] --> Tao
    style Tao fill:#f9f,stroke:#333,stroke-width:4px
    style Terreno fill:#ccf,stroke:#333,stroke-width:2px
`
*Fig 1.1: El ciclo de influencia de los 5 factores.*) -Encoding UTF8 }

# 2.2.1: Zheng/Qi + Sim Tokens
e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md = "e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_2\tema_2.2_subtema_2.2.1_contenido.md"
# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 = Get-Content e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md -Raw

## 📊 VISUALIZACIÓN ESTRATÉGICA: EL PENTÁGONO
`mermaid
graph TD
    Tao[Tao (Misión)] --> Clima
    Clima[Clima (Contexto)] --> Terreno
    Terreno[Terreno (Infra)] --> Liderazgo
    Liderazgo[Liderazgo (Equipo)] --> Metodo
    Metodo[Método (Proceso)] --> Tao
    style Tao fill:#f9f,stroke:#333,stroke-width:4px
    style Terreno fill:#ccf,stroke:#333,stroke-width:2px
`
*Fig 1.1: El ciclo de influencia de los 5 factores.* = @"

## 🔬 SIMULACIÓN INTERACTIVA
> **Reto**: Tienes 3 'Innovation Tokens'. ¿Puedes armar una arquitectura que no quiebre la empresa?
> [🏠 ABRIR JUEGO DE ARCHITECTURA](../../simulaciones/simulacion_m2_tokens.html)

## 📊 DISTRIBUCIÓN ÓPTIMA
`mermaid
pie title "Distribución de Arquitectura Sana"
    "Zheng (Estándar/Aburrido)" : 80
    "Qi (Innovador/Riesgoso)" : 20
`
"@
if (-not (# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 -match "simulacion_m2")) { Set-Content e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md -Value (# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 + 
## 📊 VISUALIZACIÓN ESTRATÉGICA: EL PENTÁGONO
`mermaid
graph TD
    Tao[Tao (Misión)] --> Clima
    Clima[Clima (Contexto)] --> Terreno
    Terreno[Terreno (Infra)] --> Liderazgo
    Liderazgo[Liderazgo (Equipo)] --> Metodo
    Metodo[Método (Proceso)] --> Tao
    style Tao fill:#f9f,stroke:#333,stroke-width:4px
    style Terreno fill:#ccf,stroke:#333,stroke-width:2px
`
*Fig 1.1: El ciclo de influencia de los 5 factores.*) -Encoding UTF8 }

# 2.3.2: Swarming
e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md = "e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_2\tema_2.3_subtema_2.3.2_contenido.md"
# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 = Get-Content e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md -Raw

## 📊 VISUALIZACIÓN ESTRATÉGICA: EL PENTÁGONO
`mermaid
graph TD
    Tao[Tao (Misión)] --> Clima
    Clima[Clima (Contexto)] --> Terreno
    Terreno[Terreno (Infra)] --> Liderazgo
    Liderazgo[Liderazgo (Equipo)] --> Metodo
    Metodo[Método (Proceso)] --> Tao
    style Tao fill:#f9f,stroke:#333,stroke-width:4px
    style Terreno fill:#ccf,stroke:#333,stroke-width:2px
`
*Fig 1.1: El ciclo de influencia de los 5 factores.* = @"

## 📊 TÁCTICA: SWARMING VS DISPERSIÓN
`mermaid
graph TD
    subgraph Escenario_Malo [Dispersión]
        D1(Dev 1) --> T1[Tarea A]
        D2(Dev 2) --> T2[Tarea B]
        D3(Dev 3) --> T3[Tarea C]
    end
    subgraph Escenario_Bueno [Swarming]
        D4(Dev 1) --> TA[Tarea A]
        D5(Dev 2) --> TA
        D6(Dev 3) --> TA
        TA --> |Done!| TB[Tarea B]
    end
    style TA fill:#6f6
`
"@
if (-not (# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 -match "mermaidd")) { Set-Content e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md -Value (# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 + 
## 📊 VISUALIZACIÓN ESTRATÉGICA: EL PENTÁGONO
`mermaid
graph TD
    Tao[Tao (Misión)] --> Clima
    Clima[Clima (Contexto)] --> Terreno
    Terreno[Terreno (Infra)] --> Liderazgo
    Liderazgo[Liderazgo (Equipo)] --> Metodo
    Metodo[Método (Proceso)] --> Tao
    style Tao fill:#f9f,stroke:#333,stroke-width:4px
    style Terreno fill:#ccf,stroke:#333,stroke-width:2px
`
*Fig 1.1: El ciclo de influencia de los 5 factores.*) -Encoding UTF8 }


# --- MODULO 3 ---

# 3.1.1: Maniobra (Wizard of Oz)
e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md = "e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_3\tema_3.1_subtema_3.1.1_contenido.md"
# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 = Get-Content e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md -Raw

## 📊 VISUALIZACIÓN ESTRATÉGICA: EL PENTÁGONO
`mermaid
graph TD
    Tao[Tao (Misión)] --> Clima
    Clima[Clima (Contexto)] --> Terreno
    Terreno[Terreno (Infra)] --> Liderazgo
    Liderazgo[Liderazgo (Equipo)] --> Metodo
    Metodo[Método (Proceso)] --> Tao
    style Tao fill:#f9f,stroke:#333,stroke-width:4px
    style Terreno fill:#ccf,stroke:#333,stroke-width:2px
`
*Fig 1.1: El ciclo de influencia de los 5 factores.* = @"

## 📊 SECUENCIA: MAGO DE OZ
`mermaid
sequenceDiagram
    participant U as Usuario
    participant F as Frontend (Fake)
    participant H as Humano (Backend Real)
    U->>F: Pide recomendación
    F->>H: Email de alerta
    Note over H: Analiza en Google
    H->>F: Respuesta JSON manual
    F->>U: Muestra "AI Result"
`
"@
if (-not (# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 -match "mermaidd")) { Set-Content e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md -Value (# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 + 
## 📊 VISUALIZACIÓN ESTRATÉGICA: EL PENTÁGONO
`mermaid
graph TD
    Tao[Tao (Misión)] --> Clima
    Clima[Clima (Contexto)] --> Terreno
    Terreno[Terreno (Infra)] --> Liderazgo
    Liderazgo[Liderazgo (Equipo)] --> Metodo
    Metodo[Método (Proceso)] --> Tao
    style Tao fill:#f9f,stroke:#333,stroke-width:4px
    style Terreno fill:#ccf,stroke:#333,stroke-width:2px
`
*Fig 1.1: El ciclo de influencia de los 5 factores.*) -Encoding UTF8 }

# 3.2.2 Intelligence (Trace)
e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md = "e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_3\tema_3.2_subtema_3.2.2_contenido.md"
# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 = Get-Content e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md -Raw

## 📊 VISUALIZACIÓN ESTRATÉGICA: EL PENTÁGONO
`mermaid
graph TD
    Tao[Tao (Misión)] --> Clima
    Clima[Clima (Contexto)] --> Terreno
    Terreno[Terreno (Infra)] --> Liderazgo
    Liderazgo[Liderazgo (Equipo)] --> Metodo
    Metodo[Método (Proceso)] --> Tao
    style Tao fill:#f9f,stroke:#333,stroke-width:4px
    style Terreno fill:#ccf,stroke:#333,stroke-width:2px
`
*Fig 1.1: El ciclo de influencia de los 5 factores.* = @"

## 📊 VISUALIZACIÓN: DISTRIBUTED TRACING
`mermaid
gantt
    title Trace ID: abc-123 (Cascada de Latencia)
    dateFormat X
    axisFormat %s
    section Frontend
    Auth Check :a1, 0, 50
    section Backend
    Process Logic :a2, 50, 80
    section Database
    SQL Query (Lento) :crit, a3, 80, 500
    section Response
    Send JSON :a4, 500, 510
`
"@
if (-not (# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 -match "mermaidd")) { Set-Content e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md -Value (# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 + 
## 📊 VISUALIZACIÓN ESTRATÉGICA: EL PENTÁGONO
`mermaid
graph TD
    Tao[Tao (Misión)] --> Clima
    Clima[Clima (Contexto)] --> Terreno
    Terreno[Terreno (Infra)] --> Liderazgo
    Liderazgo[Liderazgo (Equipo)] --> Metodo
    Metodo[Método (Proceso)] --> Tao
    style Tao fill:#f9f,stroke:#333,stroke-width:4px
    style Terreno fill:#ccf,stroke:#333,stroke-width:2px
`
*Fig 1.1: El ciclo de influencia de los 5 factores.*) -Encoding UTF8 }

# 3.3.1 Chaos Sim
e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md = "e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_3\tema_3.3_subtema_3.3.1_contenido.md"
# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 = Get-Content e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md -Raw

## 📊 VISUALIZACIÓN ESTRATÉGICA: EL PENTÁGONO
`mermaid
graph TD
    Tao[Tao (Misión)] --> Clima
    Clima[Clima (Contexto)] --> Terreno
    Terreno[Terreno (Infra)] --> Liderazgo
    Liderazgo[Liderazgo (Equipo)] --> Metodo
    Metodo[Método (Proceso)] --> Tao
    style Tao fill:#f9f,stroke:#333,stroke-width:4px
    style Terreno fill:#ccf,stroke:#333,stroke-width:2px
`
*Fig 1.1: El ciclo de influencia de los 5 factores.* = @"

## 🔬 SIMULACIÓN INTERACTIVA
> **Laboratorio**: Tienes acceso a la consola de Chaos Monkey. Destruye servidores y observa si el sistema se recupera.
> [🏠 ABRIR CONSOLA DE CAOS](../../simulaciones/simulacion_m3_chaos.html)) -Encoding UTF8 }


# --- MODULO 5 ---

# 5.1 WarRoom Sim
e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_3\tema_3.3_subtema_3.3.2_contenido.md = "e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_5\tema_5.1_contenido.md"
# PROTOCOLOS DE GUERRA: INCIDENT RESPONSE

**Tiempo estimado**: 50 minutos
**Nivel**: Tech Lead / Manager
**Prerrequisitos**: Liderazgo básico

## ¿Por qué importa este concepto?

Sun Tzu dice: *"El caos simulado nace de la disciplina; el miedo simulado nace del valor; la debilidad simulada nace de la fuerza"*.
Cuando el sistema cae a las 3 AM y Twitter arde, lo natural es el pánico (Caos real).
El objetivo de **Incident Response** es transformar ese pánico en un proceso militar disciplinado.

No importa qué tan buena sea tu arquitectura; vas a fallar. La diferencia entre una compañía mediocre y una de élite no es si fallan, sino qué tan rápido se recuperan (MTTR - Mean Time To Recovery).

## Conexión con conocimientos previos

Es la aplicación final de todo. Observabilidad (3.2) nos dice que hay fuego. Maniobra (3.1) nos da herramientas para apagarlo. Incident Response es la coordinación humana para usar esas herramientas.

---

## Comprensión intuitiva

### Roles de Batalla (ICS - Incident Command System)
Tomado de los bomberos. Cuando hay fuego, no hay democracia. Hay roles.

1.  **Incident Commander (IC)**: El jefe. No toca el teclado.
    -   *Función*: Toma decisiones, coordina, mantiene la visión global.
2.  **Ops Lead**: El táctico.
    -   *Función*: Toca el teclado. Ejecuta los cambios.
3.  **Comms Lead**: El diplomático.
    -   *Función*: Habla con clientes/internos. Actualiza la página de estado.

### El Anti-Patrón: "Todos ayudan"
Si 10 ingenieros entran al canal de Slack a tirar ideas y comandos al azar:
-   Aumenta el ruido.
-   Nadie sabe qué se ha probado.
-   Riesgo de empeorar el incidente.
**Regla**: Si no tienes rol asignado, te callas y observas.

---

## Implementación práctica: Fases del Incidente

### 1. Detección y Declaración
-   Alerta automática o reporte de usuario.
-   Alguien dice: "Declaro Incidente SEV-1". (Nivel de severidad).
-   Se abre canal de Slack `#incident-123`.
-   Se asigna el IC.

### 2. Contención (Torniquete)
-   **Objetivo**: Parar el sangrado. No arreglar la causa raíz.
-   *Ejemplo*: Si la DB está lenta por una feature nueva -> Rollback o Feature Flag OFF.
-   No investigues *por qué* la query es lenta ahora. Apágala. Recupera el servicio.

### 3. Remediación
-   Una vez el usuario está feliz (servicio arriba), investigamos la causa raíz con calma.

### 4. Post-Mortem (La Lección)
-   Documento escrito SIN CULPA (Blameless).
-   ¿Qué pasó? ¿Por qué? ¿Cómo evitamos que se repita?
-   Se generan tickets de mejora en Jira.

---

## Trampas y errores comunes

### ❌ Error: Buscar Culpables durante el fuego
"¿Quién pusheó este commit?"
-   **Efecto**: La gente se defiende en lugar de arreglar el problema. Miedo. Silencio.
-   **Sun Tzu**: *"Trata a tus soldados como a hijos amados y te seguirán al valle más profundo"*.
-   **Solución**: Enfócate en el sistema, no en la persona. "El sistema permitió que un error humano llegara a prod".

### ❌ Error: Fatiga de Alerta
Tener alertas PagerDuty para todo (Disco 80%, CPU 10%).
-   **Efecto**: El ingeniero ignora el teléfono. Cuando llega la alerta real (Sitio Caído), nadie responde.

---

## Resumen

**En una frase**: En la crisis, la disciplina vence al genio.

**Cuándo usarlo**:
-   Siempre que haya degradación del servicio.
-   Practicarlo con "Game Days" (simulacros).

**Siguiente paso**: Módulo 4 y 5. Hemos terminado el núcleo operativo. Pasamos a la **Carrera Profesional y Liderazgo Estratégico** (Módulo 4: El Liderazgo del General).
 = Get-Content e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_3\tema_3.3_subtema_3.3.2_contenido.md -Raw

## 🔬 SIMULACIÓN INTERACTIVA
> **Experimento**: ¿Cómo afecta el tamaño del lote a la velocidad de entrega?
> [🏠 ABRIR SIMULACIÓN DE PIPELINE](../../simulaciones/simulacion_m1_pipeline.html)

## 📊 GRÁFICO: LA CURVA J DEL RETRASO
`mermaid
xychart-beta
    title "Costo de No Desplegar (Deuda de Inventario)"
    x-axis [Día 1, Día 7, Día 14, Día 30]
    y-axis "Dinero Perdido" 0 --> 100
    line [10, 20, 50, 95]
`
"@
if (-not (# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 -match "simulacion_m1")) { Set-Content e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md -Value (# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 + 
## 📊 VISUALIZACIÓN ESTRATÉGICA: EL PENTÁGONO
`mermaid
graph TD
    Tao[Tao (Misión)] --> Clima
    Clima[Clima (Contexto)] --> Terreno
    Terreno[Terreno (Infra)] --> Liderazgo
    Liderazgo[Liderazgo (Equipo)] --> Metodo
    Metodo[Método (Proceso)] --> Tao
    style Tao fill:#f9f,stroke:#333,stroke-width:4px
    style Terreno fill:#ccf,stroke:#333,stroke-width:2px
`
*Fig 1.1: El ciclo de influencia de los 5 factores.*) -Encoding UTF8 }

# 1.3.1: Layers
e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md = "e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.3_subtema_1.3.1_contenido.md"
# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 = Get-Content e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md -Raw

## 📊 VISUALIZACIÓN ESTRATÉGICA: EL PENTÁGONO
`mermaid
graph TD
    Tao[Tao (Misión)] --> Clima
    Clima[Clima (Contexto)] --> Terreno
    Terreno[Terreno (Infra)] --> Liderazgo
    Liderazgo[Liderazgo (Equipo)] --> Metodo
    Metodo[Método (Proceso)] --> Tao
    style Tao fill:#f9f,stroke:#333,stroke-width:4px
    style Terreno fill:#ccf,stroke:#333,stroke-width:2px
`
*Fig 1.1: El ciclo de influencia de los 5 factores.* = @"

## 📊 ARQUITECTURA: DEFENSA EN CAPAS
`mermaid
graph BT
    L1[Capa Física (Difícil)] --> L2[Capa Lógica (Media)]
    L2 --> L3[Capa Conceptual (Fácil)]
    click L3 "Solución aquí: Barata"
    click L1 "Solución aquí: Cara"
    style L3 fill:#8f8,stroke:#333
    style L1 fill:#f88,stroke:#333
`
"@
if (-not (# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 -match "mermaidd")) { Set-Content e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md -Value (# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 + 
## 📊 VISUALIZACIÓN ESTRATÉGICA: EL PENTÁGONO
`mermaid
graph TD
    Tao[Tao (Misión)] --> Clima
    Clima[Clima (Contexto)] --> Terreno
    Terreno[Terreno (Infra)] --> Liderazgo
    Liderazgo[Liderazgo (Equipo)] --> Metodo
    Metodo[Método (Proceso)] --> Tao
    style Tao fill:#f9f,stroke:#333,stroke-width:4px
    style Terreno fill:#ccf,stroke:#333,stroke-width:2px
`
*Fig 1.1: El ciclo de influencia de los 5 factores.*) -Encoding UTF8 }


# --- MODULO 2 ---

# 2.1.1: Pets vs Cattle
e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md = "e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_2\tema_2.1_subtema_2.1.1_contenido.md"
# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 = Get-Content e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md -Raw

## 📊 VISUALIZACIÓN ESTRATÉGICA: EL PENTÁGONO
`mermaid
graph TD
    Tao[Tao (Misión)] --> Clima
    Clima[Clima (Contexto)] --> Terreno
    Terreno[Terreno (Infra)] --> Liderazgo
    Liderazgo[Liderazgo (Equipo)] --> Metodo
    Metodo[Método (Proceso)] --> Tao
    style Tao fill:#f9f,stroke:#333,stroke-width:4px
    style Terreno fill:#ccf,stroke:#333,stroke-width:2px
`
*Fig 1.1: El ciclo de influencia de los 5 factores.* = @"

## 📊 VISUALIZACIÓN: MASCOTAS VS GANADO
`mermaid
graph LR
    subgraph Pets [Mascotas (Tradicional)]
        S1(Server Zeus) --- S2(Server Apolo)
        style S1 fill:#f96
    end
    subgraph Cattle [Ganado (Cloud)]
        C1[Container 9a8b] -.- C2[Container 3x2y] -.- C3[Container 1z9p]
        style C1 fill:#69f
        style C3 fill:#69f
    end
`
"@
if (-not (# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 -match "mermaidd")) { Set-Content e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md -Value (# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 + 
## 📊 VISUALIZACIÓN ESTRATÉGICA: EL PENTÁGONO
`mermaid
graph TD
    Tao[Tao (Misión)] --> Clima
    Clima[Clima (Contexto)] --> Terreno
    Terreno[Terreno (Infra)] --> Liderazgo
    Liderazgo[Liderazgo (Equipo)] --> Metodo
    Metodo[Método (Proceso)] --> Tao
    style Tao fill:#f9f,stroke:#333,stroke-width:4px
    style Terreno fill:#ccf,stroke:#333,stroke-width:2px
`
*Fig 1.1: El ciclo de influencia de los 5 factores.*) -Encoding UTF8 }

# 2.2.1: Zheng/Qi + Sim Tokens
e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md = "e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_2\tema_2.2_subtema_2.2.1_contenido.md"
# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 = Get-Content e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md -Raw

## 📊 VISUALIZACIÓN ESTRATÉGICA: EL PENTÁGONO
`mermaid
graph TD
    Tao[Tao (Misión)] --> Clima
    Clima[Clima (Contexto)] --> Terreno
    Terreno[Terreno (Infra)] --> Liderazgo
    Liderazgo[Liderazgo (Equipo)] --> Metodo
    Metodo[Método (Proceso)] --> Tao
    style Tao fill:#f9f,stroke:#333,stroke-width:4px
    style Terreno fill:#ccf,stroke:#333,stroke-width:2px
`
*Fig 1.1: El ciclo de influencia de los 5 factores.* = @"

## 🔬 SIMULACIÓN INTERACTIVA
> **Reto**: Tienes 3 'Innovation Tokens'. ¿Puedes armar una arquitectura que no quiebre la empresa?
> [🏠 ABRIR JUEGO DE ARCHITECTURA](../../simulaciones/simulacion_m2_tokens.html)

## 📊 DISTRIBUCIÓN ÓPTIMA
`mermaid
pie title "Distribución de Arquitectura Sana"
    "Zheng (Estándar/Aburrido)" : 80
    "Qi (Innovador/Riesgoso)" : 20
`
"@
if (-not (# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 -match "simulacion_m2")) { Set-Content e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md -Value (# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 + 
## 📊 VISUALIZACIÓN ESTRATÉGICA: EL PENTÁGONO
`mermaid
graph TD
    Tao[Tao (Misión)] --> Clima
    Clima[Clima (Contexto)] --> Terreno
    Terreno[Terreno (Infra)] --> Liderazgo
    Liderazgo[Liderazgo (Equipo)] --> Metodo
    Metodo[Método (Proceso)] --> Tao
    style Tao fill:#f9f,stroke:#333,stroke-width:4px
    style Terreno fill:#ccf,stroke:#333,stroke-width:2px
`
*Fig 1.1: El ciclo de influencia de los 5 factores.*) -Encoding UTF8 }

# 2.3.2: Swarming
e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md = "e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_2\tema_2.3_subtema_2.3.2_contenido.md"
# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 = Get-Content e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md -Raw

## 📊 VISUALIZACIÓN ESTRATÉGICA: EL PENTÁGONO
`mermaid
graph TD
    Tao[Tao (Misión)] --> Clima
    Clima[Clima (Contexto)] --> Terreno
    Terreno[Terreno (Infra)] --> Liderazgo
    Liderazgo[Liderazgo (Equipo)] --> Metodo
    Metodo[Método (Proceso)] --> Tao
    style Tao fill:#f9f,stroke:#333,stroke-width:4px
    style Terreno fill:#ccf,stroke:#333,stroke-width:2px
`
*Fig 1.1: El ciclo de influencia de los 5 factores.* = @"

## 📊 TÁCTICA: SWARMING VS DISPERSIÓN
`mermaid
graph TD
    subgraph Escenario_Malo [Dispersión]
        D1(Dev 1) --> T1[Tarea A]
        D2(Dev 2) --> T2[Tarea B]
        D3(Dev 3) --> T3[Tarea C]
    end
    subgraph Escenario_Bueno [Swarming]
        D4(Dev 1) --> TA[Tarea A]
        D5(Dev 2) --> TA
        D6(Dev 3) --> TA
        TA --> |Done!| TB[Tarea B]
    end
    style TA fill:#6f6
`
"@
if (-not (# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 -match "mermaidd")) { Set-Content e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md -Value (# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 + 
## 📊 VISUALIZACIÓN ESTRATÉGICA: EL PENTÁGONO
`mermaid
graph TD
    Tao[Tao (Misión)] --> Clima
    Clima[Clima (Contexto)] --> Terreno
    Terreno[Terreno (Infra)] --> Liderazgo
    Liderazgo[Liderazgo (Equipo)] --> Metodo
    Metodo[Método (Proceso)] --> Tao
    style Tao fill:#f9f,stroke:#333,stroke-width:4px
    style Terreno fill:#ccf,stroke:#333,stroke-width:2px
`
*Fig 1.1: El ciclo de influencia de los 5 factores.*) -Encoding UTF8 }


# --- MODULO 3 ---

# 3.1.1: Maniobra (Wizard of Oz)
e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md = "e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_3\tema_3.1_subtema_3.1.1_contenido.md"
# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 = Get-Content e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md -Raw

## 📊 VISUALIZACIÓN ESTRATÉGICA: EL PENTÁGONO
`mermaid
graph TD
    Tao[Tao (Misión)] --> Clima
    Clima[Clima (Contexto)] --> Terreno
    Terreno[Terreno (Infra)] --> Liderazgo
    Liderazgo[Liderazgo (Equipo)] --> Metodo
    Metodo[Método (Proceso)] --> Tao
    style Tao fill:#f9f,stroke:#333,stroke-width:4px
    style Terreno fill:#ccf,stroke:#333,stroke-width:2px
`
*Fig 1.1: El ciclo de influencia de los 5 factores.* = @"

## 📊 SECUENCIA: MAGO DE OZ
`mermaid
sequenceDiagram
    participant U as Usuario
    participant F as Frontend (Fake)
    participant H as Humano (Backend Real)
    U->>F: Pide recomendación
    F->>H: Email de alerta
    Note over H: Analiza en Google
    H->>F: Respuesta JSON manual
    F->>U: Muestra "AI Result"
`
"@
if (-not (# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 -match "mermaidd")) { Set-Content e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md -Value (# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 + 
## 📊 VISUALIZACIÓN ESTRATÉGICA: EL PENTÁGONO
`mermaid
graph TD
    Tao[Tao (Misión)] --> Clima
    Clima[Clima (Contexto)] --> Terreno
    Terreno[Terreno (Infra)] --> Liderazgo
    Liderazgo[Liderazgo (Equipo)] --> Metodo
    Metodo[Método (Proceso)] --> Tao
    style Tao fill:#f9f,stroke:#333,stroke-width:4px
    style Terreno fill:#ccf,stroke:#333,stroke-width:2px
`
*Fig 1.1: El ciclo de influencia de los 5 factores.*) -Encoding UTF8 }

# 3.2.2 Intelligence (Trace)
e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md = "e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_3\tema_3.2_subtema_3.2.2_contenido.md"
# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 = Get-Content e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md -Raw

## 📊 VISUALIZACIÓN ESTRATÉGICA: EL PENTÁGONO
`mermaid
graph TD
    Tao[Tao (Misión)] --> Clima
    Clima[Clima (Contexto)] --> Terreno
    Terreno[Terreno (Infra)] --> Liderazgo
    Liderazgo[Liderazgo (Equipo)] --> Metodo
    Metodo[Método (Proceso)] --> Tao
    style Tao fill:#f9f,stroke:#333,stroke-width:4px
    style Terreno fill:#ccf,stroke:#333,stroke-width:2px
`
*Fig 1.1: El ciclo de influencia de los 5 factores.* = @"

## 📊 VISUALIZACIÓN: DISTRIBUTED TRACING
`mermaid
gantt
    title Trace ID: abc-123 (Cascada de Latencia)
    dateFormat X
    axisFormat %s
    section Frontend
    Auth Check :a1, 0, 50
    section Backend
    Process Logic :a2, 50, 80
    section Database
    SQL Query (Lento) :crit, a3, 80, 500
    section Response
    Send JSON :a4, 500, 510
`
"@
if (-not (# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 -match "mermaidd")) { Set-Content e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md -Value (# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 + 
## 📊 VISUALIZACIÓN ESTRATÉGICA: EL PENTÁGONO
`mermaid
graph TD
    Tao[Tao (Misión)] --> Clima
    Clima[Clima (Contexto)] --> Terreno
    Terreno[Terreno (Infra)] --> Liderazgo
    Liderazgo[Liderazgo (Equipo)] --> Metodo
    Metodo[Método (Proceso)] --> Tao
    style Tao fill:#f9f,stroke:#333,stroke-width:4px
    style Terreno fill:#ccf,stroke:#333,stroke-width:2px
`
*Fig 1.1: El ciclo de influencia de los 5 factores.*) -Encoding UTF8 }

# 3.3.1 Chaos Sim
e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md = "e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_3\tema_3.3_subtema_3.3.1_contenido.md"
# ECONOMÍA DEL CYCLE TIME: EL COSTO DE LA GUERRA PROLONGADA

**Tiempo estimado**: 40 minutos
**Nivel**: Intermedio
**Prerrequisitos**: Conceptos básicos de Lean/Agile

## ¿Por qué importa este concepto?

En desarrollo de software, el enemigo más peligroso no es un hacker, sino el **tiempo**. Sun Tzu escribió hace 2500 años: *"No hay ejemplo de una nación que se beneficie de una guerra prolongada"*. 

En ingeniería, esto es una ley física: **Ningún proyecto mejora cuanto más tiempo pasa en "WIP" (Work In Progress)**. El código no entregado se pudre (merge conflicts, cambios de requisitos, fatiga del equipo/Stakeholders).

Este subtema traduce la logística de guerra a la métrica técnica más importante: **Cycle Time**.

## Conexión con conocimientos previos

En el Tema 1.1 evaluamos si debíamos pelear (Viabilidad). Ahora que hemos decidido pelear (iniciar el proyecto), el objetivo es terminar lo antes posible. No por prisa ("Rush"), sino por supervivencia económica y moral.

---

## Comprensión intuitiva

### La Ley de la Guerra Prolongada

Imagina que tu equipo es un ejército asediando una ciudad (el problema técnico). Cada día que pasa sin conquistar la ciudad:
1.  **Se consumen recursos**: Salarios, nube, licencias (Burn-rate).
2.  **Las armas se desafilan**: La motivación del equipo decae, la atención se fragmenta.
3.  **El enemigo se fortalece**: La competencia avanza, o el problema técnico muta (nuevos requisitos).

**Conclusión Estratégica**: La velocidad no es una "feature"; es la base de la viabilidad económica. Un proyecto imperfecto entregado hoy vale más que uno perfecto entregado el próximo año.

### Deuda Cognitiva (Fatiga)

Mantener un contexto mental complejo ("tengo 5 ramas abiertas y 3 features a medias") consume RAM mental. Sun Tzu advierte sobre la fatiga de las tropas. En software, el Context Switching es la fatiga de marcha.

---

## Definición formal

### Cycle Time vs. Lead Time

-   **Lead Time**: Desde que el cliente pide algo hasta que lo recibe. (Visión del Negocio).
-   **Cycle Time**: Desde que el ingeniero empieza a codificar hasta que está en producción. (Visión de Ingeniería).

Nuestro objetivo estratégico es minimizar el **Cycle Time** para maximizar el aprendizaje.

$$ \text{Cost of Delay} = \frac{\text{Value}}{\text{Time}} $$

Si tardas 6 meses en lanzar una feature que genera $10k/mes, has perdido $60k de oportunidad, más el costo de desarrollo.

---

## Implementación práctica: Cálculo de Costo

### Calculadora de "War Cost"

No necesitas código complejo para esto, es aritmética de supervivencia.

```python
def calcular_costo_retraso(equipo_size, burn_rate_mensual, meses_retraso, valor_mensual_esperado):
    """
    Calcula cuánto cuesta realmente extender un proyecto.
    """
    # 1. Costo directo (Salarios + Infra)
    costo_operativo = burn_rate_mensual * meses_retraso
    
    # 2. Costo de Oportunidad (Lo que no ganamos por no estar en prod)
    lucro_cesante = valor_mensual_esperado * meses_retraso
    
    # 3. Costo Moral (Difícil de cuantificar, usamos multiplicador heurístico)
    # Después de 3 meses de retraso, la productividad baja un 20%
    factor_fatiga = 1.2 if meses_retraso > 3 else 1.0
    
    total_loss = (costo_operativo + lucro_cesante) * factor_fatiga
    return total_loss

# Ejemplo:
# Equipo de 5 devs ($50k/mes), retraso de 6 meses, feature que daría $20k/mes
# Costo Operativo: $300k
# Lucro Cesante: $120k
# Factor Fatiga: 1.2
# TOTAL PÉRDIDA: ($420k) * 1.2 = $504k
```

Este cálculo es lo que debes presentar al "Soberano" (Negocio) cuando piden cambios que retrasan el proyecto.

---

## Trampas y errores comunes

### ❌ Error: "Gold Plating" (Blindar la armadura)
Seguir puliendo el código o añadiendo features menores antes del primer release.
-   **Sun Tzu dice**: *"He oído hablar de operaciones militares torpes pero rápidas; nunca he visto una operación hábil que fuera prolongada."*
-   **Corrección**: MVP real. Shippear lo mínimo viable para cerrar el ciclo.

### ❌ Error: Lotes Grandes (Big Batch Size)
Intentar desplegar el "Módulo Completo" (3 meses de trabajo) de golpe.
-   **Problema**: El riesgo de bugs aumenta exponencialmente con el tamaño del cambio.
-   **Corrección**: Despliegues continuos. "Divide y vencerás" se aplica literalmente a los PRs.

---

## Resumen

**En una frase**: La guerra es cara; entra rápido, gana rápido, sal rápido.

**Cuándo usarlo**:
-   Durante el Planning, para cortar alcance agresivamente.
-   Cuando el Stakeholder pide "solo un cambio pequeño más" antes del release.

**Siguiente paso**: Veremos cómo la **Automatización** es el sistema logístico que permite esta velocidad en el **Tema 1.2.2**.
 = Get-Content e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos\modulo_1\tema_1.2_subtema_1.2.1_contenido.md -Raw

## 📊 VISUALIZACIÓN ESTRATÉGICA: EL PENTÁGONO
`mermaid
graph TD
    Tao[Tao (Misión)] --> Clima
    Clima[Clima (Contexto)] --> Terreno
    Terreno[Terreno (Infra)] --> Liderazgo
    Liderazgo[Liderazgo (Equipo)] --> Metodo
    Metodo[Método (Proceso)] --> Tao
    style Tao fill:#f9f,stroke:#333,stroke-width:4px
    style Terreno fill:#ccf,stroke:#333,stroke-width:2px
`
*Fig 1.1: El ciclo de influencia de los 5 factores.* = @"

## 🔬 SIMULACIÓN INTERACTIVA
> **Laboratorio**: Tienes acceso a la consola de Chaos Monkey. Destruye servidores y observa si el sistema se recupera.
> [🏠 ABRIR CONSOLA DE CAOS](../../simulaciones/simulacion_m3_chaos.html) = @"

## �� ACCESO AL WAR ROOM
> **ALERTA**: El sistema está caído. Entra a la sala de situación y toma el mando.
> [🏠 ENTRAR AL WAR ROOM](../../simulaciones/simulacion_m5_warroom.html)
