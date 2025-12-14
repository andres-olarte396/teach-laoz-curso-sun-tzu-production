# BANCO DE EJERCICIOS: MÓDULO 3.3 - CHAOS ENGINEERING

## METADATA

- **Subtema**: 3.3.1 (Las 9 Variaciones / Caos)
- **Nivel**: Avanzado

---

## EJERCICIO 1: DISEÑO DE GAME DAY

### ENUNCIADO

Eres el Tech Lead. Quieres organizar el primer "Game Day" (Día de Caos) para tu equipo.
Tu arquitectura: Frontend (React) -> API (Node) -> DB (Postgres).
Diseña un plan de ataque progresivo (Nivel 1 a 3) para "vacunar" al equipo.

### SOLUCIÓN

**Plan de Batalla**:

1. **Nivel 1 (Básico - Red)**:
    - _Ataque_: Introducir 200ms de latencia extra entre API y DB.
    - _Hipótesis_: El sistema será lento pero funcional.
    - _Aprendizaje probable_: Descubrirán que el Frontend no tiene loading spinners en algunos lugares y parece congelado.
2. **Nivel 2 (Intermedio - Fallo Parcial)**:
    - _Ataque_: Matar una de las 3 réplicas de la API.
    - _Hipótesis_: El balanceador de carga redirigirá el tráfico. 0 impacto.
    - _Aprendizaje probable_: Quizás el balanceador tarda 10s en darse cuenta, causando errores 502 temporales.
3. **Nivel 3 (Avanzado - Catástrofe)**:
    - _Ataque_: Hacer la DB de solo lectura (simular caída del Master).
    - _Hipótesis_: La app debería pasar a "Modo Mantenimiento" o "Solo Lectura" degradado.
    - _Aprendizaje_: Probablemente la app crashee mostrando stack traces feos al usuario.

---

## EJERCICIO 2: ANÁLISIS DE RESILIENCIA

### ENUNCIADO

Un servicio de "Clima" externo que usas en tu Homepage cae.
Tu Homepage tarda 30 segundos en cargar y luego muestra un error blanco.
¿Qué patrón de resiliencia faltó?
Diseña la corrección.

### SOLUCIÓN

**Fallo**: Falta de aislamiento de fallos. El fallo del subsistema (Clima) tumbó al sistema principal (Home). Violación de las "9 Variaciones" (No adaptarse al terreno cambiante).
**Corrección: Circuit Breaker + Timeout**.

1. Poner un **Timeout** agresivo al servicio de Clima (ej. 500ms). Si no responde, abortar.
2. Implementar **Circuit Breaker**: Si falla 5 veces seguidas, dejar de llamar al servicio por 1 minuto.
3. **Fallback**: Mostrar el Home sin el widget de clima, o con datos cacheados de ayer. "Degradación Elegante".

---

## EJERCICIO 3: HIPÓTESIS DE CAOS

### ENUNCIADO

Formulad una hipótesis de caos válida para un sistema de colas (RabbitMQ/Kafka).
Formato: "Si [acción], entonces [resultado esperado]".

### SOLUCIÓN

"Si **bloqueamos el puerto de red TC/5672** (RabbitMQ) para los consumidores durante 5 minutos, entonces:

1. Los productores deberían seguir encolando mensajes localmente o rechazar peticiones (Backpressure).
2. No se deberían perder datos.
3. Al restaurar la red, los consumidores deberían procesar el backlog sin crashear por memoria (Rate limiting)."
