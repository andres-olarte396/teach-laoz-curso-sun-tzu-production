# MOMENTUM DE RELEASE: GESTIÓN DE LA ENERGÍA CINÉTICA

**Tiempo estimado**: 45 minutos
**Nivel**: Engineering Manager / Tech Lead
**Prerrequisitos**: Conceptos de Agile/Scrum/Kanban

## ¿Por qué importa este concepto?

Sun Tzu dice: *"La energía es como tensar una ballesta; la decisión es como soltar el gatillo"*.
Y también: *"Cuando las aguas torrenciales lanzan piedras, es por su momentum"*.

En proyectos de software, el **Momentum** es la sensación palpable de progreso.
-   Un equipo con momentum entrega features cada día. Sienten que ganan.
-   Un equipo sin momentum está atascado en PRs de 2 semanas, reuniones eternas y bloqueos. Sienten que pierden.

El momentum no es solo velocidad; es **Masa x Velocidad**. Es la capacidad de atravesar obstáculos.

## Conexión con conocimientos previos

Ya definimos los métodos (2.2.1). Ahora necesitamos aplicarlos con ritmo. La inmutabilidad (2.1) nos quitó el miedo a desplegar, lo cual es el requisito #1 para el momentum.

---

## Comprensión intuitiva

### El Círculo Virtuoso del Ship
1.  Shippeas código pequeño.
2.  Recibes feedback rápido y endorfinas ("¡Está vivo!").
3.  La confianza sube.
4.  Te atreves a shippear algo más grande.
5.  Repetir.

### La Muerte por Estancamiento
Si un PR (Pull Request) pasa 4 días en revisión:
-   El código se "enfría" (el autor olvida el contexto).
-   Surgen conflictos de merge.
-   La moral decae. "Aquí nunca se termina nada".
Eso es energía potencial pudriéndose. Necesitamos convertirla en cinética.

---

## Definición formal

### Métricas de Momentum

No uses "Puntos de Historia" (son subjetivos). Usa métricas de flujo:

1.  **WIP (Work In Progress)**: Cantidad de tickets abiertos simultáneamente.
    -   *Objetivo*: Bajo. (Sun Tzu: "Concentración de fuerzas").
2.  **PR Cycle Time**: Tiempo desde "Open PR" hasta "Merge".
    -   *Objetivo*: < 24 horas.
3.  **Deployment Frequency**: Veces que vas a prod.
    -   *Objetivo*: Diario o "On-demand".

$$ \text{Momentum} \approx \frac{\text{Features Entregadas}}{\text{WIP} \times \text{Cycle Time}} $$

---

## Implementación práctica: Tácticas de Aceleración

### 1. Stacked Diffs (Maniobra de Infantería Ligera)
En lugar de hacer una PR gigante de 1000 líneas ("Feature Completa"), haces 5 PRs de 200 líneas que dependen una de otra.
-   PR 1: Modelo de datos. (Merge rápido).
-   PR 2: API interna. (Merge rápido).
-   PR 3: UI básica.
-   ...
El reviewer no se bloquea revisando una novela. Revisa tweets. El flujo no para.

### 2. Feature Flags (Desacoplar Release de Deploy)
La táctica suprema para el momentum.
-   Haces deploy del código, pero apagado para el usuario (`if flag == false`).
-   No necesitas esperar a que esté "perfecto" para mergear.
-   Mergeas hoy. Activas la semana que viene.
-   El momentum de ingeniería (mergear) no se bloquea por el momentum de negocio (marketing).

---

## Trampas y errores comunes

### ❌ Error: "Code Freeze" por miedo
Congelar deploys los viernes o antes de vacaciones.
-   **Efecto**: Destruye el momentum. Acumula una "represa" de cambios que, cuando se suelte el lunes, romperá todo (avalancha).
-   **Sun Tzu**: *"La rapidez es la esencia de la guerra"*.
-   **Solución**: Deploys pequeños y seguros, incluso en viernes.

### ❌ Error: El Reviewer Perfeccionista
Bloquear un PR por estilo de código o preferencias personales ("Nitpicking").
-   **Efecto**: Fricción. El autor se frustra. El momentum muere.
-   **Solución**: Automatizar el estilo (Linter/Prettier). El humano solo revisa lógica y arquitectura.

---

## Resumen

**En una frase**: El software que no se mueve, se muere. Mantén el flujo a toda costa.

**Cuándo usarlo**:
-   Cuando sientas que el equipo está "lento" o desmotivado.
-   Revisa el PR Cycle Time. Si es alto, ataca ese problema.

**Siguiente paso**: Ya tenemos arquitectura y velocidad. Ahora aprenderemos a concentrar esa fuerza en los puntos débiles del problema con **Sharding de Atención** (2.3).
