# CAPACIDAD DE ERROR: ERROR BUDGETING

**Tiempo estimado**: 50 minutos
**Nivel**: SRE / Management
**Prerrequisitos**: SLAs, SLOs (conceptos básicos)

## ¿Por qué importa este concepto?

Sun Tzu dice: _"El experto en defensa se esconde en las profundidades de la tierra; el experto en ataque se mueve desde las alturas del cielo"_.

En SRE (Site Reliability Engineering), la defensa total (100% Uptime) es imposible y matemáticamente incorrecta. Intentar lograr el 100% de disponibilidad hace que el sistema sea rígido, lento y caro.
Para atacar (innovar/lanzar features), necesitamos espacio para fallar.

El **Error Budget** (Presupuesto de Error) es ese espacio estratégico. Es el permiso calculado para romper cosas.

## Conexión con conocimientos previos

Ya hicimos el sistema inmutable (2.1.1). Ahora definimos cuánto podemos "jugar" con él antes de detenernos.

---

## Comprensión intuitiva

### El 100% es el Enemigo

- Si tu objetivo es **100% uptime**, no puedes hacer deploys, porque cada cambio tiene riesgo > 0.
- Si no haces deploys, la competencia te gana (Factor Clima).
- Por tanto, **necesitas fallar** para ir rápido.

### El Presupuesto como Moneda

Imagina que tienes una "Tarjeta de Crédito de Errores".

- Tu objetivo es **99.9%** (Tres nueves).
- Eso significa que tienes **0.1%** de tiempo al mes para estar caído. (~43 minutos).
- Esos 43 minutos son tu **Presupuesto**.
- Puedes gastarlos en:
  - Experimentos arriesgados.
  - Chaos Engineering.
  - Deploys rápidos.
- Si te gastas el presupuesto (la tarjeta rebota), se declara **Ley Marcial**: Se congelan los deploys de features (Feature Freeze) y solo se trabaja en estabilidad hasta recargar el presupuesto.

---

## Definición formal

### SLI, SLO y SLA

1. **SLI (Indicator)**: Lo que mides. (Ej: Latencia p95).
2. **SLO (Objective)**: La meta interna. (Ej: Latencia < 200ms el 99% del tiempo).
    - _Este es el límite estratégico del General._
3. **SLA (Agreement)**: El contrato legal con castigo. (Ej: Si latencia > 500ms, devuelvo dinero).
    - _Este es el tratado con el Soberano._

$$ \text{Error Budget} = 100\% - \text{SLO} $$

---

## Implementación práctica: Política de Gobierno

### El Ciclo de Feedback del Error Budget

No es solo una métrica en Grafana; es una regla de comportamiento humano.

```python
def check_deployment_permission(current_error_budget):
    """
    Decide si Desarrollo puede lanzar features o debe arreglar deuda.
    """
    if current_error_budget > 0:
        return "GO: Modo Ataque. Lanza features, innova."
    else:
        return "NO-GO: Modo Defensa. Feature Freeze. Solo estabilidad."
```

### Ejemplo de Cálculo

**Servicio**: API de Pagos.
**SLO**: 99.9% Disponibilidad mensual.
**Ventana**: 30 días (43,200 minutos).
**Presupuesto Total**: 43 minutos.

- **Semana 1**: Incidente de base de datos. 10 minutos caídos. (Quedan 33 min).
- **Semana 2**: Bug en deploy. 20 minutos caídos. (Quedan 13 min).
- **Semana 3**: El PM quiere lanzar una feature "beta" súper riesgosa.
  - _Decisión SRE_: Riesgo estimado de caída 30 min. Budget restante 13 min.
  - _Veredicto_: **DENEGADO**. No tienes saldo para ese riesgo. Mejora tus tests primero.

---

## Trampas y errores comunes

### ❌ Error: SLOs Aspiracionales

Poner "99.999%" (5 nueves -> 26 segundos al mes) solo porque suena cool.

- **Efecto**: Gastas el presupuesto en el primer parpadeo de red. El equipo vive en "Feature Freeze" permanente.
- **Consejo**: Empieza con un SLO relajado. Endurécelo solo si el usuario se queja.

### ❌ Error: Ignorar el Presupuesto Agotado

Te gastaste el presupuesto, pero el Business presiona para lanzar igual.

- **Efecto**: El concepto de SRE pierde autoridad. El sistema se vuelve inestable.
- **Sun Tzu**: _"Si las órdenes son consistentes, las tropas obedecen. Si no, desconfían."_

---

## Resumen

**En una frase**: La confiabilidad perfecta no existe; gestiónala como un recurso financiero finito.

**Cuándo usarlo**:

- Para negociar con Product Managers agresivos ("No podemos lanzar, no tenemos budget").
- Para priorizar tareas de estabilidad (Backlog de deuda técnica).

**Siguiente paso**: Con la defensa lista (Inmutabilidad) y las reglas de riesgo claras (Error Budget), vamos a organizar nuestras fuerzas: **Orquestación y Momentum** (Tema 2.2).
