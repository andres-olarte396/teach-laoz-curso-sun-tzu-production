# LAS 9 VARIACIONES DE SUN TZU: CHAOS ENGINEERING

**Tiempo estimado**: 50 minutos
**Nivel**: SRE / DevOps Advanced
**Prerrequisitos**: Conceptos de Módulo 3.2, Docker

## ¿Por qué importa este concepto?

Sun Tzu dice: _"Hay caminos que no deben seguirse, ejércitos que no deben ser atacados, ciudades que no deben ser asediadas... El general que comprende las nueve variaciones tácticas sabe cómo manejar las tropas"_.

La esencia de las "9 Variaciones" es la **Adaptabilidad ante lo Inesperado**.
En sistemas distribuidos, "lo inesperado" es la norma. Los discos fallan, la red tiene latencia, las zonas de disponibilidad de AWS desaparecen.
Si esperas a que ocurra el desastre para ver cómo reacciona tu equipo, ya has perdido.

**Chaos Engineering** es la práctica de romper tu propio sistema proactivamente para entrenar la "memoria muscular" de la recuperación. Es vacunar al sistema.

## Conexión con conocimientos previos

Ya tenemos un sistema inmutable (2.1) y observado (3.2). Ahora vamos a atacarlo nosotros mismos para ver si las defensas aguantan.

---

## Comprensión intuitiva

### La Falacia de la "Red Fiable"

Todo ingeniero junior asume:

1. La red es confiable.
2. La latencia es cero.
3. El ancho de banda es infinito.
    Chaos Engineering te obliga a enfrentar la realidad inyectando fallos: "¿Qué pasa si la latencia sube a 5 segundos?".

### Vacunación Sistémica

- Si nunca reinicias una base de datos, el día que falle sola (3 AM, Black Friday), nadie sabrá qué hacer.
- Si la reinicias aleatoriamente cada semana (Chaos Monkey), el sistema aprenderá a recuperarse solo, y el equipo ni se inmutará.

---

## Implementación práctica: Experimentos de Caos

### El Ciclo Científico del Caos

1. **Definir Estado Estable (Steady State)**: "Nuestro e-commerce tiene < 1% de errores normalmente".
2. **Hipótesis**: "Si matamos el Microservicio de Recomendaciones, el Home debería seguir cargando (sin recomendaciones)".
3. **Experimento**: Apagar `recommendation-service`.
4. **Verificación**:
    - ¿Cargó el Home? ✅
    - ¿Explotó todo con un error 500? ❌ (Fallo de hipótesis -> Trabajo por hacer).

### Herramientas: Chaos Mesh / Gremlin

```yaml
# Definición de ataque en Chaos Mesh (Kubernetes)
apiVersion: chaos-mesh.org/v1alpha1
kind: PodcastChaos
metadata:
  name: pod-kill-example
spec:
  action: pod-kill
  mode: one
  selector:
    namespaces:
      - production
    labelSelectors:
      "app": "payment-service"
  duration: "10s"
  scheduler:
    cron: "@every 1h"
```

Este script mata un pod de pagos cada hora. Si tu arquitectura no es resiliente, lo sabrás muy pronto.

---

## Trampas y errores comunes

### ❌ Error: Caos sin Observabilidad

Lanzar Chaos Monkey sin tener logs ni métricas (Módulo 3.2).

- **Efecto**: Rompes el sistema y no sabes por qué. No aprendes nada. Solo causas dolor.

### ❌ Error: Empezar en Producción

"¡Vamos a romper la base de datos de producción el viernes!".

- **Sun Tzu**: _"El general prudente no busca la batalla sin plan"_.
- **Estrategia**: Empieza en Dev. Luego Staging. Solo cuando confíes en tu resiliencia (Módulo 2.1), pasas a Prod. El objetivo es aprender, no destruir el negocio.

---

## Resumen

**En una frase**: No esperes a que el sistema falle; fállalo tú controladamente.

**Cuándo usarlo**:

- Cuando el sistema parece "demasiado estable" (sospechoso).
- Antes de grandes eventos de tráfico (Black Friday).

**Siguiente paso**: Cuando el caos no planificado ocurre y las defensas fallan, entramos en **Incident Response** (3.3.2).
