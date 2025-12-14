# CONCENTRACIÓN DE FUERZA: SWARMING

**Tiempo estimado**: 50 minutos
**Nivel**: Team Lead / Scrum Master
**Prerrequisitos**: Kanban, WIP Limits

## ¿Por qué importa este concepto?

Sun Tzu dice: *"Si el enemigo se prepara a la izquierda, será débil a la derecha... Si se prepara en todas partes, será débil en todas partes"*.
Y la máxima: *"La superioridad numérica relativa es la esencia de la táctica"*.

En gestión de equipos, a menudo dispersamos nuestras fuerzas: 5 desarrolladores trabajando en 5 tickets distintos.
Resultado: 5 tareas al 20%. 0 tareas terminadas.
Estrategia Sun Tzu: **Swarming**. 5 desarrolladores trabajando en 1 ticket.
Resultado: 1 tarea terminada en 2 horas. Luego la siguiente.

## Conexión con conocimientos previos

Ya identificamos el Vacío (2.3.1). Ahora aplicamos todo el Momentum (2.2) y el equipo en ese único punto para romper la resistencia inmediatamente.

---

## Comprensión intuitiva

### El Mito de la Eficiencia Individual
Creemos que si Juan hace Frontend y María hace Backend en paralelo, es más rápido.
Pero luego llega la integración.
-   Juan bloquea a María.
-   María espera el Code Review de Pedro (que está en otra cosa).
-   El ticket tarda 5 días.

### La Realidad del Swarming (Enjambre)
Todo el equipo mira el mismo problema.
-   Juan escribe los tests.
-   María escribe la API.
-   Pedro escribe la UI.
-   Ana revisa el código en tiempo real (Pair/Mob Programming).
El ticket se cierra en una mañana. El Cycle Time cae al suelo. La calidad sube.

---

## Implementación práctica: Mob Programming

### Protocolo de Ataque en Grupo

No es "5 personas mirando una pantalla". Es roles definidos:

1.  **El Driver**: Tiene el teclado. Solo escribe lo que le dicen. (Rota cada 15 min).
2.  **El Navegante**: Dice qué escribir. Piensa en la lógica inmediata.
3.  **Los Exploradores**: Buscan documentación, chequean edge cases, piensan en seguridad.

**Cuándo hacer Swarm**:
-   En **Incidentes de Producción** (War Room).
-   En **Historias de Usuario Complejas** (Incognitas altas).
-   Al inicio de un Sprint para cerrar lo más difícil primero.

### Sharding de Atención a nivel Sistema
No solo personas. También recursos de máquina.
Si tienes un pico de tráfico:
-   Apaga los procesos batch (reportes, backups).
-   Concentra toda la CPU/RAM en servir al usuario (Web Servers).
Esto es "Concentración de Fuerza" automatizada.

---

## Trampas y errores comunes

### ❌ Error: Swarming en tareas triviales
Poner a 5 seniors a cambiar el color de un botón.
-   Pérdida de recursos. El swarming es para problemas "Densos" o "Bloqueantes".

### ❌ Error: El "Passenger"
Alguien en el Mob que se desconecta y mira el celular.
-   **Solución**: Rotación rápida del teclado (Driver) y preguntas constantes. Mantener la tensión creativa.

---

## Resumen

**En una frase**: Haz menos cosas a la vez, pero hazlas con más gente a la vez.

**Cuándo usarlo**:
-   Cuando un ticket lleva más de 3 días en "In Progress".
-   Cuando hay un deadline crítico.

**Siguiente paso**: Hemos terminado la Arquitectura (Módulo 2). Ahora sabemos defender (2.1), movernos (2.2) y atacar (2.3). Estamos listos para las **Operaciones y Tácticas en Tiempo Real** (Módulo 3).
