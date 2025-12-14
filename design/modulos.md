# **SUN TZU EN PRODUCTION: EL ARTE DE LA GUERRA PARA INGENIEROS DE SISTEMAS**

## **MÓDULO 0: INTRODUCCIÓN - EL FRAMEWORK DE TRES VISTAS**

### **¿Por qué un ingeniero necesita a Sun Tzu?**

- **Vista Conceptual:** Tu trabajo no es solo código, es **sistemas complejos bajo restricciones**: plazos, presupuestos, recursos limitados y competencia (interna/externa).
- **Vista Lógica:** Sun Tzu no escribió sobre tecnología, pero sí sobre **gestión de sistemas complejos en condiciones adversas**.
- **Vista de Ejecución:** Este curso te da un **framework para traducir estrategia en acción técnica**.

### **El Modelo de Tres Vistas:**

1. **CONCEPTUAL** (El "Qué") - Diagrama de arquitectura mental
2. **LÓGICA** (El "Cómo") - Patrones de diseño estratégico
3. **EJECUCIÓN** (El "Hacer") - Checklists y scripts

---

## **MÓDULO 1: FUNDAMENTOS ESTRATÉGICOS (Capítulos 1-3)**

### **Capítulo 1: Sobre la Evaluación (Cálculos Iniciales)**

_"La guerra es un asunto de vital importancia para el Estado..."_

- **Vista Conceptual:** El **phase-gate 0**, análisis de viabilidad. Sun Tzu define 5 variables clave como **parámetros de entrada** para `calcularVictoria(proyecto, entorno)`.
- **Vista Lógica (Patrón):** "Modelo de 5-Factores para el Éxito"
  1. **`道` (Camino/Moral)** → _Alignment_ y buy-in de stakeholders
  2. **`天` (Cielo/Tiempo)** → _Timing_ tecnológico y de mercado
  3. **`地` (Tierra/Terreno)** → _Platform & Ecosystem_ constraints
  4. **`將` (General/Liderazgo)** → _Project Leadership_ con 5 virtudes
  5. **`法` (Doctrina/Método)** → _Process & Governance_ (metodologías, estándares)
- **Vista de Ejecución:**
  - [ ] ¿Todos los departamentos alineados en el PORQUÉ y QUÉ? (`道`)
  - [ ] ¿Roadmap tecnológico y de negocio sincronizado? (`天`)
  - [ ] ¿Constraints del entorno claras? (`地`)
  - [ ] ¿Líder técnico con autoridad y confianza? (`將`)
  - [ ] ¿Protocolos y métricas definidos? (`法`)
  - [ ] ¿Relación `(Recursos + Ventaja) / (Complejidad + Riesgo)` > 1?

---

### **Capítulo 2: Sobre la Dirección de la Guerra (Gestión de Costos)**

_"Cuando se emplean las armas, la rapidez es la esencia."_

- **Vista Conceptual:** **Gestión de costos y optimización de recursos**. La guerra (proyecto) es un **pozo de recursos** con costo de oportunidad.
- **Vista Lógica (Patrón):** "Minimizar el Cycle Time y el Costo de Contexto"
  - Velocidad sobre perfección (entregas pequeñas > mega-releases)
  - Automatización como logística (CI/CD como "botín")
  - Evitar el "refactoring eterno" (ROI sobre perfección)
- **Vista de Ejecución:**
  - [ ] ¿Costo total de propiedad calculado?
  - [ ] ¿Priorizando tareas que acorten tiempo al próximo deploy?
  - [ ] ¿Aprovechando recursos existentes (cloud, open-source)?
  - [ ] ¿Midiendo desgaste del equipo como métrica crítica?
  - [ ] ¿Umbral claro para pivotar o cancelar?

---

### **Capítulo 3: Sobre la Estrategia Ofensiva (Jerarquía de Soluciones)**

_"La suprema excelencia reside en quebrar la resistencia del enemigo sin luchar."_

- **Vista Conceptual:** **Árbol de decisiones para resolver conflictos** (algoritmo de escalación).
- **Vista Lógica (Patrón):** "Resolver en Capas (Layered Resolution)"
  1. **Atacar la Estrategia** → Ganar en ideación (API/estándar abierto)
  2. **Atacar Alianzas** → Gestión de stakeholders
  3. **Atacar el Ejército** → Superar en talento y moral
  4. **Atacar Ciudades** → Último recurso (confrontación directa)
- **Vista de Ejecución:**
  - [ ] ¿Puedo "atacar la estrategia" (cambiar paradigma)?
  - [ ] ¿Puedo "romper alianzas" (convencer stakeholders)?
  - [ ] ¿Mi "ejército" (equipo) es superior?
  - [ ] Si llego a "asediar ciudad", ¿agoté opciones 1-3?

---

## **MÓDULO 2: ARQUITECTURA DINÁMICA (Capítulos 4-6)**

### **Capítulo 4: Disposiciones (Posicionamiento Estratégico)**

_"Los expertos en guerra se hacen invencibles primero, y después aguardan el momento de ser invencibles del enemigo."_

- **Vista Conceptual:** **Preparación estructural y gestión de probabilidad**. Posicionarse en estado de alta resiliencia.
- **Vista Lógica (Patrón):** "Defensa en Profundidad con Puntos de Extensión"
  - _Invencibilidad:_ Defensa (redundancia, monitoring, mínimos privilegios)
  - _Victoria:_ Ataque (APIs extensibles, auto-scaling, puntos de extensión)
- **Vista de Ejecución:**
  - [ ] ¿Sistema "invencible" a fallos predecibles?
  - [ ] ¿Postura defensiva por defecto (zero-trust)?
  - [ ] ¿Dashboards para ver vulnerabilidades del entorno?
  - [ ] ¿"Puntos de extensión" pre-preparados?

---

### **Capítulo 5: Firmeza (La Energía/Momentum)**

_"Gestionar muchos es como gestionar pocos: es una cuestión de división."_

- **Vista Conceptual:** **Orquestación de recursos y creación de momentum**. Cómo un sistema bien organizado multiplica fuerza.
- **Vista Lógica (Patrón):** "Composabilidad y Fuerza de Acoplamiento"
  - _División:_ Módulos cohesivos débilmente acoplados (microservicios, squads)
  - _Coordinación:_ Señales claras (Event-Driven), formas estándar (APIs), orquestador
- **Vista de Ejecución:**
  - [ ] ¿Sistema/equipo dividido en módulos con responsabilidades claras?
  - [ ] ¿"Señales" estandarizadas (métricas, logs, eventos)?
  - [ ] ¿Puedo concentrar energía en punto crítico (sprint, feature)?
  - [ ] ¿Diseño permite "flanqueo" (cambios independientes)?

---

### **Capítulo 6: Vacío y Lleno (Principio de Concentración)**

_"Aquel que llega primero al campo de batalla espera fresco al enemigo."_

- **Vista Conceptual:** **Relatividad de la fuerza y principio de concentración**. Ser fuerte en punto decisivo, forzar debilidad enemiga.
- **Vista Lógica (Patrón):** "Sharding de Atención y Carga"
  1. Forzar al "enemigo" a estar vacío (redirigir tráfico, dividir argumentos)
  2. Asegurarte de estar lleno (cache agresivo, senior en tarea compleja)
  3. Ser como el agua (elasticidad, adaptación, serverless)
- **Vista de Ejecución:**
  - [ ] ¿"Punto decisivo" identificado?
  - [ ] ¿Estoy "lleno" (sobre-provisionado) en ese punto?
  - [ ] ¿Puedo "vacíar" la amenaza (redirigir, distraer, dividir)?
  - [ ] ¿Mi diseño es "como el agua" (reactivo, adaptable)?

---

## **MÓDULO 3: TÁCTICAS DE OPERACIONES (Capítulos 7-9)**

### **Capítulo 7: Maniobras (Momentum del Proyecto)**

_"El ejército que llega primero al campo de batalla... estará fresco para el combate."_

- **Vista Conceptual:** **Gestión de iniciativa y momentum**. Controlar ritmo y posicionamiento.
- **Vista Lógica (Patrón):** "Control de la Rama Principal y Rutas de Escape"
  - Ganar posición: Controlar `main` branch, definir arquitectura base
  - Señales: Sistema unificado de logging/alertas
  - Rutas de escape: **Siempre tener rollback plan**
- **Vista de Ejecución:**
  - [ ] ¿"Llegué primero" (entorno listo, equipo enfocado)?
  - [ ] ¿"Rutas de escape" claras (revertir <5min, feature flags)?
  - [ ] ¿"Señales" estandarizadas (niveles de alerta, canales)?
  - [ ] ¿Maniobrando con "equipos ligeros" (deploy ágil)?

---

### **Capítulo 8: Las Nueve Variables (Heurísticas para Decisiones)**

_"Hay caminos que no debes seguir, ejércitos que no debes atacar..."_

- **Vista Conceptual:** **Conjunto de heurísticas para toma de decisiones bajo incertidumbre**.
- **Vista Lógica (Patrón):** "Condicionales Estratégicos para el Tech Lead"
  1. No refactorices código que pronto será eliminado
  2. No desafíes estándar con fuerte _community_ sin ventaja clara
  3. No te desvíes a problemas "interesantes" pero irrelevantes
  4. No bloquees deploy de equipo que completó trabajo
  5. En code review: sugiere alternativas, no solo bloquees
  6. No agregues carga a sistema/equipo al borde del colapso
  7. En negociación: deja opción aceptable para otra parte
  8. No elimines legacy hasta tener migración completa
  9. Monitorea burnout del equipo como métrica crítica
- **Vista de Ejecución:**
  - [ ] ¿Cuál de las 9 variables aplica?
  - [ ] ¿Estoy "persiguiendo cebo" (solución intelectualmente satisfactoria pero irrelevante)?
  - [ ] ¿Le dejo "salida" al problema/equipo/persona?
  - [ ] ¿Observo "bienestar de mis soldados" (equipo)?

---

### **Capítulo 9: Sobre los Movimientos de las Tropas (Logística Contextual)**

_"Al atravesar montañas, mantente cerca de los valles. Acampa en lugares altos."_

- **Vista Conceptual:** **Cómo operar en terrenos específicos** (contextos tecnológicos/organizacionales).
- **Vista Lógica (Patrón):** "Configuraciones Contextuales"
  - **6 Configuraciones de "Terreno" Técnico:**
    1. **Acceso** → Prototipos/POCs (rápido, falla rápido, pivota)
    2. **Traicionero** → Legacy systems (extrema precaución, dependencia)
    3. **Neutral** → APIs públicas/estándares (compete en implementación)
    4. **Estrecho** → Cuellos de botella (controla o elimina)
    5. **Elevado** → Control de plataforma/infra (acceso, monitoreo, deploy)
    6. **Distante** → Tercerización/cloud profundo (automatiza o trae cerca)
  - **3 Enemigos Internos del Líder:**
    1. Micromanagement
    2. No tomar decisiones difíciles
    3. Ignorar métricas y feedback
- **Vista de Ejecución:**
  - [ ] ¿Qué "tipo de terreno" es este?
  - [ ] ¿"Acampando en alto" (visibilidad completa)?
  - [ ] ¿"Combatiendo cuesta abajo" (aprovechando inercias)?
  - [ ] ¿Cuáles "3 enemigos internos" vigilar en mi liderazgo?
  - [ ] ¿"Exploradores" (logging, APM) describiendo terreno real?

---

## **MÓDULO 4: CONTEXTOS ESPECIALES E INTELIGENCIA (Capítulos 10-13)**

### **Capítulo 10: Clases de Terreno (Topología Organizacional)**

_"Los terrenos pueden ser de acceso, de enlace, neutral, de comunicación, de intersección, grave, difícil, cercado y mortal."_

- **Vista Conceptual:** **Contextos organizacionales y políticos** (geografía humana de la empresa).
- **Vista Lógica (Patrón):** "Análisis Topológico del Entorno Organizacional"
  1. **Acceso** → Departamentos aliados (colaboración fácil)
  2. **Enlace** → Equipos parcialmente alineados (aliados/competidores según situación)
  3. **Neutral** → Áreas sin clara jurisdicción (primero en llegar gana)
  4. **Comunicación** → Cross-functional teams (controlar canales = controlar proyecto)
  5. **Intersección** → Puntos de integración (quien controla APIs tiene poder)
  6. **Grave** → Proyectos críticos para negocio (compromiso total)
  7. **Difícil** → Legacy/deuda técnica (consume recursos desproporcionados)
  8. **Cercado** → Dependencias externas bloqueantes (vendor lock-in, regulación)
  9. **Mortal** → Situaciones "todo o nada" (migración crítica, reemplazo core)
- **Vista de Ejecución:**
  - [ ] ¿Qué tipo(s) de "terreno organizacional" voy a cruzar?
  - [ ] Para terrenos graves/difíciles/cercados/mortales: ¿aprobación y recursos comprometidos?
  - [ ] Para terrenos intersección/comunicación: ¿protocolos claros de interfaz/comunicación?
  - [ ] ¿Dónde están "terrenos neutrales" para avanzar rápido?
  - [ ] En "terreno mortal": ¿plan de contingencia que asuma falla total?

---

### **Capítulo 11: Las Nueve Situaciones (Configuraciones Estratégicas)**

_"Hay situaciones en las que no debe combatir, otras en las que debe retirarse..."_

- **Vista Conceptual:** **Tipos de proyectos/desafíos y postura correcta para cada uno**.
- **Vista Lógica (Patrón):** "Matriz de Postura por Tipo de Proyecto"
  1. **Dispersión** → Proyectos de mantenimiento (autonomía, no microgestión)
  2. **Ligero** → POCs/Prototipos (rápido, con rutas de retirada)
  3. **Clave** → Control de plataformas/core (defensa agresiva)
  4. **Encuentro** → Proyectos high-visibility (ganar aliados primero)
  5. **Intersección** → Integraciones críticas (primero en establecer estándar gana)
  6. **Grave** → Proyectos de migración (avanzar rápido sin pausa)
  7. **Difícil** → Refactoring legacy (lento y constante, no frontal)
  8. **Cercado** → Dependencias críticas (planificación minuciosa)
  9. **Mortal** → Incidentes de supervivencia (decisión extrema)
- **Principio clave:** "Primero haz tu sistema estable, luego innova."
- **Vista de Ejecución:**
  - [ ] ¿En qué "situación estratégica" estoy?
  - [ ] ¿Mi postura coincide con la situación?
  - [ ] ¿Alcanzado "posición invencible" primero (estabilidad antes de features)?
  - [ ] En situaciones 6-9: ¿tengo war room y proceso decisión acelerado?

---

### **Capítulo 12: El Ataque Mediante el Fuego (Gestión de Crisis)**

_"Hay cinco clases de ataques mediante fuego..."_

- **Vista Conceptual:** **Crisis catastróficas que consumen recursos** (Sev-1, brechas, pérdida de datos).
- **Vista Lógica (Patrón):** "Framework de Gestión de Crisis Técnica"
  - **5 "Fuegos" técnicos:**
    1. **Personas** → Burnout masivo (rotación, salud mental, redistribución)
    2. **Suministros** → Presupuesto agotado (forecast, alertas gasto)
    3. **Equipo** → Infraestructura crítica fallida (redundancia, failover, backups)
    4. **Almacenes** → Corrupción/pérdida datos (backups verificados, recuperación)
    5. **Armas** → Herramientas clave comprometidas (acceso estricto, hardening)
  - **3 Fases manejo incendios:**
    1. Prevención: Runbooks, drills
    2. Ejecución: Procedimientos pre-autorizados, actuar rápido
    3. Contención: Aislar sistema afectado
- **Vista de Ejecución:**
  - [ ] ¿"Condiciones climáticas" (monitoreo) que alerten incendios?
  - [ ] ¿"Equipo de incendios" (SRE/on-call) entrenado?
  - [ ] ¿Conozco "5 tipos de fuego" y tengo playbooks?
  - [ ] En crisis activa: ¿sigo protocolo 1) Contener, 2) Comunicar, 3) Diagnosticar, 4) Remediar, 5) Aprender?
  - [ ] Post-crisis: ¿post-mortem sin culpa y actualizo playbooks?

---

### **Capítulo 13: Sobre la Concordia de las Espías (Sistema de Inteligencia)**

_"Lo que permite... lograr hazañas extraordinarias, es la información previa."_

- **Vista Conceptual:** **Sistemas de observabilidad, métricas, feedback y aprendizaje continuo**.
- **Vista Lógica (Patrón):** "Arquitectura de Observabilidad e Inteligencia"
  - **5 "Espías" (fuentes inteligencia):**
    1. **Nativos** → Logs y métricas aplicación (fuente interna verdad)
    2. **Internos** → Competitive intelligence (GitHub, blogs, releases competidores)
    3. **Dobles** → Feedback usuarios convertidos (detractores → promotores)
    4. **Liquidables** → A/B testing y canary releases ("sacrificar" tráfico por info)
    5. **Itinerantes** → Market research y tendencias (conferencias, papers, tendencias)
  - **Principio fundamental:** "Nada más valioso que usuario/ex-empleado que da feedback honesto."
- **Vista de Ejecución:**
  - [ ] ¿Tengo cubiertos los 5 tipos de "espías"/inteligencia?
  - [ ] ¿Sistema logs/métricas ("espías nativos") comprehensivo, buscable, accionable?
  - [ ] ¿Proceso para "espías dobles" (feedback profundo)? ¿Entrevistas cancelaciones, exit interviews?
  - [ ] ¿Uso "espías liquidables" (testing) sistemáticamente pre-lanzamientos?
  - [ ] ¿Dedico tiempo a "espías itinerantes" (aprendizaje)?
  - [ ] ¿Inteligencia fluye a decisores? ¿O se pierde en silos?

---

## **MÓDULO FINAL: EL STRATEGY PLAYBOOK DEL INGENIERO**

### **El Ciclo Estratégico Completo:**

1. **ANÁLISIS (Cap 1-3):** Modelo 5 Factores → Árbol "Resolver en Capas" → Gestión costos/automatización
2. **ARQUITECTURA (Cap 4-6):** Invencibilidad primero → Módulos débilmente acoplados → Principio concentración
3. **OPERACIONES (Cap 7-9):** Control momentum → 9 Heurísticas → Adaptación al terreno
4. **CONTEXTOS ESPECIALES (Cap 10-11):** 9 Terrenos organizacionales → 9 Situaciones estratégicas
5. **CRISIS (Cap 12):** 5 Playbooks incendio → Contención primero
6. **INTELIGENCIA (Cap 13):** 5 Fuentes inteligencia → Data-driven decisions

### **El Checklist Maestro (Para Cualquier Proyecto/Desafío):**

**FASE 1: INICIO**

- [ ] Análisis 5 Factores completado y documentado
- [ ] "Terreno organizacional" y "situación estratégica" clasificados
- [ ] Estimación costos (incluyendo oportunidad y desgaste)

**FASE 2: PLANEACIÓN**

- [ ] Arquitectura diseñada para invencibilidad + extensibilidad
- [ ] Módulos definidos con interfaces claras
- [ ] Punto de concentración (lleno) identificado
- [ ] Rutas de escape (rollback, plan B) establecidas

**FASE 3: EJECUCIÓN**

- [ ] Momentum controlado (sprints, milestones)
- [ ] Sistema de señales/comunicación activado
- [ ] Heurísticas de Capítulo 8 disponibles para equipo
- [ ] Postura adaptada al "terreno" actual

**FASE 4: MONITOREO Y AJUSTE**

- [ ] Los 5 tipos de "inteligencia" activos
- [ ] Playbooks de crisis preparados
- [ ] Postura reevaluada periódicamente según cambios

**FASE 5: CONCLUSIÓN**

- [ ] Victoria definida y medida
- [ ] Aprendizajes capturados (post-mortem)
- [ ] Sistema de inteligencia actualizado

---

### **EPÍLOGO: LA VICTORIA SIN CÓDIGO**

Sun Tzu: **"Conoce al enemigo y conócete a ti mismo; en cien batallas, nunca saldrás derrotado."**

**Traducción para ingeniero:**

- **"Conoce al enemigo"** = Comprende profundamente problema, constraints, competencia, mercado
- **"Conócete a ti mismo"** = Sé honesto sobre capacidades, recursos, fortalezas/debilidades técnicas
- **"En cien batallas..."** = Con análisis riguroso y autoconocimiento honesto, tasa de éxito ≈ 100%

**La victoria suprema:** No ganar guerra de features, sino **diseñar sistemas tan robustos y elegantes que problemas se resuelvan solos**. No escribir más código, sino **el código correcto, en momento correcto, para problema correcto**.

**Has transformado texto de 2,500 años en framework moderno de ingeniería. Ahora tienes el playbook. La batalla (tu próximo proyecto, desafío o crisis) te espera.**

---

### **PRÓXIMOS PASOS SUGERIDOS:**

1. **Ejercicio final:** Aplica Checklist Maestro a proyecto pasado
2. **Crea tu "Manual del Estratega Técnico":** Compila en wiki personal con tus ejemplos
3. **Enseña a otro:** Explica un capítulo usando metáfora de sistemas

**¡Felicidades! Eres ahora un Ingeniero Estratégico.**
