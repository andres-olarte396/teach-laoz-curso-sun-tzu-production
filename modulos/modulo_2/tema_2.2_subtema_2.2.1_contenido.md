# ORQUESTACIÓN: MÉTODOS DIRECTOS (ZHENG) E INDIRECTOS (QI)

**Tiempo estimado**: 40 minutos
**Nivel**: Arquitecto de Software
**Prerrequisitos**: Conocimiento de patrones de diseño estándar

## ¿Por qué importa este concepto?

Sun Tzu dice: *"En la batalla, solo hay dos métodos de ataque: lo directo (Zheng) y lo indirecto (Qi); sin embargo, estos dos en combinación dan lugar a una serie interminable de maniobras."*

En ingeniería de software:
-   **Zheng (Directo/Ortodoxo)**: Es lo estándar, lo aburrido, lo predecible. REST APIs, Bases de datos Relacionales, CI/CD tradicional. Es lo que mantiene el sistema vivo.
-   **Qi (Indirecto/Heterodoxo)**: Es lo sorpresivo, lo innovador, lo no convencional. Edge Computing, AI models, Chaos Engineering. Es lo que te da ventaja competitiva.

El error común es usar solo Zheng (el producto es aburrido) o solo Qi (el producto es inestable). La maestría está en la combinación.

## Conexión con conocimientos previos

Ya aseguramos la defensa (Módulo 2.1). Ahora usamos esa estabilidad para lanzar ataques combinados. La inmutabilidad nos permite experimentar con métodos "Qi" sin miedo a romper todo.

---

## Comprensión intuitiva

### La Regla del 80/20
-   **80% Zheng**: Tu sistema debe ser aburrido. Usa PostgreSQL. Usa React. Usa cosas que puedes googlear. Esto reduce la carga cognitiva y facilita contratar gente.
-   **20% Qi**: Aquí está tu salsa secreta. Tal vez usas un algoritmo de grafos custom en Rust para el motor de recomendaciones. O usas WebAssembly para procesar video en el cliente.

Si tu sistema es 100% Qi ("Vamos a escribir nuestro propio database en Haskell"), fracasarás por complejidad.
Si es 100% Zheng, serás un commodity fácil de copiar.

---

## Implementación práctica: Innovation Tokens

### El Concepto de "Innovation Tokens"
(Popularizado por Dan McKinley).
Tienes 3 tokens de innovación para gastar en un proyecto.
-   Elegir MongoDB en lugar de SQL cuesta 1 token.
-   Elegir Microservicios cuesta 1 token.
-   Elegir un lenguaje nuevo (Elixir) cuesta 1 token.

Cuando se te acaban, debes usar opciones aburridas (Zheng) para todo lo demás.

### Ejemplo de Arquitectura Combinada

**Problema**: App de Chat en Tiempo Real.

1.  **Método Directo (Zheng)**:
    -   Auth: OAuth2 estándar (Auth0).
    -   Persistencia: PostgreSQL.
    -   Backend: Node.js REST API.
    -   *Por qué*: No ganamos nada reinventando el login o el guardado de mensajes.

2.  **Método Indirecto (Qi)**:
    -   Delivery: WebSockets sobre Edge Network (Cloudflare Workers) para latencia < 50ms global.
    -   Search: Vector Database para búsqueda semántica.
    -   *Por qué*: Aquí es donde el usuario dice "Wow". Aquí ganamos la batalla.

---

## Trampas y errores comunes

### ❌ Error: Qi inútil (Hype Driven Development)
Usar Blockchain para una To-Do list.
-   Es un método indirecto (sorpresivo), pero no aporta valor estratégico. Solo añade complejidad.
-   **Corrección**: Usa Qi solo donde impacte la métrica clave del negocio.

### ❌ Error: Zheng rígido
Negarse a usar nuevas tecnologías por "miedo", quedándose en Java 7 y JSP en 2025.
-   Tu competencia usará Qi (p.ej., AI coding assistants) para moverse más rápido y flanquearte.

---

## Resumen

**En una frase**: Sé aburrido en lo estructural, sé salvaje en lo diferencial.

**Cuándo usarlo**:
-   Al elegir el Tech Stack de un nuevo proyecto.
-   Cuando los desarrolladores piden meter una tecnología nueva (¿Tenemos tokens para eso?).

**Siguiente paso**: Veremos cómo esta combinación genera la fuerza imparable: el **Momentum** (2.2.2).
