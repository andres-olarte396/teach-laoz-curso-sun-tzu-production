# RESOLVER EN CAPAS: EL ÁRBOL DE DECISIÓN DE CONFLICTO

**Tiempo estimado**: 45 minutos
**Nivel**: Estratégico
**Prerrequisitos**: Visión sistémica

## ¿Por qué importa este concepto?

El instinto del ingeniero es escribir código. Ante un problema, abrimos el IDE.
Sun Tzu dice: _"La suprema excelencia consiste en romper la resistencia del enemigo sin luchar"_.
En nuestra profesión, "luchar" es escribir código, debuggear, desplegar y mantener. Ganar "sin luchar" significa resolver el problema **antes** de que requiera código.

Este subtema introduce una heurística para resolver problemas en la capa más alta posible (Diseño/Negocio) antes de bajar a la trinchera (Código).

## Conexión con conocimientos previos

Ya sabemos evaluar si un proyecto vale la pena (Tema 1.1). Ahora, ante un requisito aprobado, aprendemos a ejecutarlo con el mínimo esfuerzo técnico posible.

---

## Comprensión intuitiva

### Las 3 Capas del Conflicto

Imagina un problema: "El sistema es lento".

1. **Capa 1: Negocio/Producto (La Diplomacia)**.
    - ¿Realmente necesitamos que sea rápido en tiempo real? ¿Podemos cambiar el requisito a "procesamiento batch nocturno"?
    - _Solución_: Cambiar la expectativa. Costo de implementación: Cero líneas de código.
2. **Capa 2: Arquitectura/Diseño (La Estrategia)**.
    - ¿Podemos usar caché? ¿Podemos usar una base de datos de lectura?
    - _Solución_: Componente estándar. Costo: Configuración + Integración.
3. **Capa 3: Código/Optimización (La Táctica/Combate Cuerpo a Cuerpo)**.
    - Reescribir el algoritmo en Rust. Optimizar SQL queries a mano.
    - _Solución_: Código custom. Costo: Alto mantenimiento, bugs, deuda técnica.

**Regla de Oro**: Intenta resolver siempre en la Capa 1. Si no puedes, baja a la 2. Solo si es inevitable, lucha en la 3.

---

## Implementación práctica: El Árbol de Decisión

### Algoritmo: `solve_conflict_layer()`

```python
def resolver_problema(requisito):
    # CAPA 1: NEGOCIACIÓN (Win without fighting)
    if negociar_alcance(requisito):
        return "Resuelto: Requisito eliminado o simplificado. 0 LOC."

    # CAPA 2: ARQUITECTURA (Win with strategy)
    if existe_solucion_off_the_shelf(requisito):
        return "Resuelto: Comprar SaaS o usar Librería. Configuración."

    # CAPA 3: CÓDIGO (Fight)
    return "Resuelto: Implementación custom. Alto costo."

def negociar_alcance(req):
    """
    Pregunta clave: ¿Cuál es el problema raíz?
    A veces el usuario pide 'Un botón de Excel' pero necesita 'Ver los datos'.
    Solución: Dar acceso a un dashboard que ya existe.
    """
    if req.es_capricho() or req.existe_alternativa_manual():
        return True
    return False
```

### Caso de Estudio: El Reporte de "Tiempo Real"

**Situación**: El CFO pide un reporte financiero consolidado "en tiempo real" cada vez que abre la app.

- **Enfoque Ingeniero Junior (Capa 3)**: Ollas de optimización, Websockets, Query tuning infernal. Resultado: 2 meses de trabajo, sistema frágil.
- **Enfoque Ingeniero Estratega (Capa 1)**: Entrevista al CFO.
  - _Ingeniero_: "¿Para qué usa el reporte?"
  - _CFO_: "Para la reunión de cierre de mes."
  - _Ingeniero_: "¿O sea, solo lo necesita una vez al mes?"
  - _CFO_: "Sí."
  - _Solución_: Un script cron que envía un PDF por email el día 30.
  - **Resultado**: "Victoria sin luchar".

---

## Trampas y errores comunes

### ❌ Error: El Síndrome del Héroe

Creer que tu valor como ingeniero se mide por la complejidad del código que escribes.

- **Realidad**: Tu valor se mide por el valor que entregas al negocio. Resolver un problema quitando un requisito es infinitamente más valioso (y barato) que escribir 10,000 líneas de código para cumplirlo.

### ❌ Error: Optimización Prematura (Capa 3 antes de 1)

Empezar a optimizar bucles `for` antes de preguntar si el bucle es necesario siquiera.

---

## Resumen

**En una frase**: El mejor código es el que no se escribe.

**Cuándo usarlo**:

- En cada reunión de refinamiento de backlog.
- Cuando un ticket parece imposiblemente difícil (señal de que hay que elevar la capa).

**Siguiente paso**: Cuando no podemos evitar el conflicto y debemos construir, usamos la estrategia de **Ganar por Diseño** (Tema 1.3.2).
