# EL ARTE DEL DESVÍO: FEATURE FLAGS TÁCTICAS

**Tiempo estimado**: 50 minutos
**Nivel**: DevOps / SRE
**Prerrequisitos**: Feature Flags básico (Tema 2.2.2)

## ¿Por qué importa este concepto?

En el Tema 2.2.2 usamos Feature Flags para *velocidad* (Merge rápido).
Aquí, en Operaciones, las usamos para **Maniobra y Engaño**.
Sun Tzu dice: *"El que sabe cuándo luchar y cuándo no, saldrá victorioso"*.

Las Feature Flags avanzadas nos permiten cambiar el campo de batalla **en tiempo de ejecución**.
-   ¿El servidor se cae? Apaga la feature pesada instantáneamente (Kill Switch).
-   ¿No sabemos si el diseño A es mejor que el B? Probamos ambos (A/B Testing).
-   ¿Queremos probar en producción sin riesgo? Solo para empleados (Dogfooding).

Esto transforma al operador de un "cuidador de servidores" a un "controlador de tráfico aéreo".

## Conexión con conocimientos previos

Es la evolución dinámica de la Inmutabilidad. La infraestructura es inmutable, pero la *lógica de negocio* es fluida gracias a las flags.

---

## Comprensión intuitiva

### El Kill Switch (Botón de Pánico)
Imagina que despliegas una nueva búsqueda con ElasticSearch.
De repente, la CPU se va al 100%.
-   **Sin Flags**: Debes hacer Rollback. Tarda 20 minutos. El sitio está caído 20 minutos.
-   **Con Flags**: Vas al panel de control. Apagas `enable_new_search`. Tarda 200ms. El sitio revive.
Has convertido una derrota catastrófica en una retirada táctica menor.

### Segmentación Estratégica
Sun Tzu divide y vencerás.
No lances a todos los usuarios.
-   **Anillo 1**: Developers y QA.
-   **Anillo 2**: Empleados internos (Dogfooding).
-   **Anillo 3**: 1% de tráfico público (Canary).
-   **Anillo 4**: 100% tráfico.
Si hay un bug, solo explota en el Anillo 1 o 2. El "ejército principal" (Usuarios) nunca lo ve.

---

## Implementación práctica: Configuración Dinámica

### Arquitectura de Flags

```python
# No es solo un booleano. Es un contexto.
def calcular_precio(usuario, producto):
    contexto = {
        "user_id": usuario.id,
        "email": usuario.email,
        "pais": usuario.pais,
        "beta_tester": usuario.es_beta
    }
    
    if feature_manager.is_enabled("dynamic_pricing_v2", contexto):
        return precio_algoritmico(producto) # Nueva lógica
    else:
        return precio_estandar(producto)    # Vieja lógica (Fallback)
```

### Canary Release Automatizado
1.  Deploy `v2.0` (Flag apagada).
2.  Script activa Flag para `group: 'internal'`. -> Tests OK.
3.  Script activa Flag para `audiencia: 5%`. -> Monitorea errores.
4.  Si ErrorRate < 1%: Sube a `10%`, `20%`... `100%`.
5.  Si ErrorRate > 1%: Feature Switch OFF automático. (Self-healing).

---

## Trampas y errores comunes

### ❌ Error: Deuda Técnica de Flags
Dejar flags antiguas en el código (`if (true) { ... }`).
-   **Efecto**: El código se vuelve una lasaña de condicionales. Es difícil de leer y testear.
-   **Solución**: "Flag Cleanup Day". Una vez que la feature está al 100% estable, borra la flag y el código viejo.

### ❌ Error: Flags Dependientes
"Activa la feature B solo si la feature A está activa".
-   Crea una matriz de combinaciones imposible de testear ($2^N$ estados).
-   Mantén las flags independientes y ortogonales.

---

## Resumen

**En una frase**: Controla el radio de explosión de tus errores y la velocidad de tus aciertos.

**Cuándo usarlo**:
-   Para cada feature nueva que tenga riesgo > 0.
-   Para cambios de infraestructura invisibles (migración de DB).

**Siguiente paso**: Con el control del tráfico asegurado, pasaremos a la **Logística de Datos y Observabilidad** (Tema 3.2).
