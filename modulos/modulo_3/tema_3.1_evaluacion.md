# CUESTIONARIO Y SOLUCIONARIO: TEMA 3.1 (GESTIÓN DEL MOMENTUM)

## CUESTIONARIO

### Instrucciones
Prueba tu habilidad para maniobrar en el campo de operaciones.

### Pregunta 1: La Paradoja de la Ruta Directa
Tu objetivo es validar si los usuarios quieren comprar seguros de vida por WhatsApp.
Ruta A: Construir un Chatbot con NLP avanzado y pasarela de pagos integrada (4 meses).
Ruta B: Poner un botón de WhatsApp que lleva al celular personal del fundador (1 día).
¿Cuál es la elección estratégica según Sun Tzu?
- [ ] a) Ruta A, porque es escalable.
- [ ] b) Ruta B, porque convierte el camino sinuoso (manual) en una llegada directa al objetivo (validación de mercado).
- [ ] c) Ninguna, WhatsApp no es profesional.

### Pregunta 2: Uso de Canary Release
Lanzas una nueva versión de la API de pagos.
¿Cuál es la estrategia de despliegue de "Maniobra Segura"?
- [ ] a) Desplegar a todos los servidores a las 3 AM cuando hay poco tráfico.
- [ ] b) Desplegar a 1 servidor (Canary), enviar 1% de tráfico, monitorear logs. Si OK, escalar gradualmente.
- [ ] c) Desplegar en Staging y si funciona allí, asumir que funcionará en Prod para todos.

### Pregunta 3: Gestión de Crisis con Flags
El nuevo módulo de recomendaciones está causando latencia de 5 segundos en el Home.
¿Cuál es la reacción operativa correcta si tienes Feature Flags implementadas?
- [ ] a) Hacer un `git revert` y esperar 20 minutos al pipeline de CI/CD.
- [ ] b) Apagar la flag `enable_recommendations` en el panel de control (tiempo de reacción < 1 min).
- [ ] c) Reiniciar los servidores para ver si se arregla.

---

## SOLUCIONARIO

### Respuesta 1
**Correcta: b) Ruta B (Concierge MVP).**
**Explicación**: El objetivo estratégico es "Validar Mercado", no "Tener Software". La Ruta B logra el objetivo inmediatamente con costo casi cero. La Ruta A asume un riesgo enorme antes de saber si hay clientes. Construye la automatización solo cuando el volumen manual te desborde.

### Respuesta 2
**Correcta: b) Desplegar a 1 servidor (Canary).**
**Explicación**: Staging nunca es igual a Prod (tráfico real, datos reales). Desplegar de golpe (Big Bang) es arriesgado incluso a las 3 AM. El Canary Release permite fallar con un radio de explosión mínimo (1%).

### Respuesta 3
**Correcta: b) Apagar la flag (Kill Switch).**
**Explicación**: La velocidad de recuperación (Time to Restore) es crítica. Un cambio de configuración en tiempo real es órdenes de magnitud más rápido que un nuevo despliegue/revert de código. Es la diferencia entre un "glitch" y una "caída del sistema".
