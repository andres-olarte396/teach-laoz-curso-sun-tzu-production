# EL MODELO DE 5-FACTORES: TERRENO, LIDERAZGO Y MÉTODO

**Tiempo estimado**: 50 minutos
**Nivel**: Intermedio/Avanzado
**Prerrequisitos**: Tema 1.1.1 (Tao y Clima)

## ¿Por qué importa este concepto?

Una vez que el proyecto tiene sentido (Tao) y es el momento correcto (Clima), la ejecución depende de la realidad material. `Terreno`, `Liderazgo` y `Método` son los factores operacionales. Un gran plan estratégico falla si el terreno es desconocido (Legacy Code no documentado), el liderazgo es débil (Tech Lead ausente) o el método es caótico (sin CI/CD).

---

## Comprensión intuitiva

### 1. El Terreno (`地`): La Infraestructura y Restricciones

El terreno es donde ocurre la batalla. En software, el terreno es:

- **Infraestructura**: AWS, On-premise, Kubernetes.
- **Base de Código**: ¿Es un campo abierto (Greenfield) o un pantano (Legacy Monolith)?
- **Recursos**: Presupuesto, Latencia, Ancho de banda.

Sun Tzu dice: _"Quien ignora el terreno, pierde el ejército"_. Si diseñas un sistema distribuido complejo (Microservicios) sobre un terreno restringido (Equipo pequeño, sin DevOps), fracasarás.

### 2. El Liderazgo (`將`): Las 5 Virtudes del Tech Lead

El Comandante (Tech Lead/Architect) debe tener:

1. **Sabiduría**: Conocimiento técnico profundo.
2. **Sinceridad**: Transparecia con el equipo y stakeholders.
3. **Benevolencia**: Cuidar al equipo (evitar burnout).
4. **Coraje**: Saber decir "No" a features imposibles.
5. **Disciplina**: Mantener estándares de calidad (Linting, Tests).

### 3. El Método (`法`): Procesos y Logística

Son las reglas del ejército.

- Chain of command (¿Quién aprueba el PR?).
- Logística de suministros (Pipelines de CI/CD, aprovisionamiento de entornos).
- Gestión de gastos (Cloud finops).

---

## Implementación práctica: Auditoría de Capacidades

### Check de Terreno (Infrastructure Audit)

```python
def auditar_terreno(infra_actual):
    tipo_terreno = "Desconocido"

    if infra_actual.is_cloud_native():
        if infra_actual.has_legacy_dependencies():
            tipo_terreno = "ENTANGLED (Enredado)"
            # Difícil de entrar, difícil de salir.
        else:
            tipo_terreno = "OPEN (Abierto)"
            # Libertad de movimiento. Ideal para innovación.
    else:
        tipo_terreno = "FATAL (Mortal)"
        # On-premise obsoleto, sin documentación.

    return tipo_terreno
```

### Check de Liderazgo (Leadership Health)

Un buen Tech Lead balancea las 5 virtudes.

- **Anti-patrón "El Tirano"**: Mucha Disciplina, cero Benevolencia. El equipo renuncia.
- **Anti-patrón "El Amigo"**: Mucha Benevolencia, cero Disciplina. El código se pudre.
- **Anti-patrón "El Académico"**: Mucha Sabiduría, cero Coraje (para shippear). Parálisis por análisis.

### Check de Método (Process Maturity)

Usamos las métricas DORA como proxy del "Método" (`法`).

1. **Deployment Frequency**: ¿Qué tan rápido marchamos?
2. **Lead Time for Changes**: ¿Cuánto tarda la orden en ejecutarse?
3. **Change Failure Rate**: ¿Cuántas órdenes salen mal?
4. **Time to Restore**: ¿Qué tan rápido nos recuperamos?

---

## Trampas comunes

### ❌ Error: Ignorar el Terreno "Enredado"

Intentar aplicar patrones de "Campo Abierto" (ej. Event Sourcing) en un sistema "Enredado" (Mainframe legacy) sin una estrategia de migración clara.

- **Efecto**: El proyecto se atasca. Se gastan millones sin entregar valor.

### ❌ Error: Liderazgo sin Sinceridad

Ocultar la deuda técnica o los problemas a los stakeholders ("Todo va bien").

- **Efecto**: Cuando el problema explota, se pierde la confianza total ("Crédito del General").

---

## Resumen

Para ganar:

1. **Conoce tu Terreno**: No pelees en pantanos si tienes caballería pesada.
2. **Cultiva tu Liderazgo**: Equilibra el rigor técnico con la empatía humana.
3. **Refina tu Método**: La burocracia innecesaria mata el momentum; la falta de proceso mata la calidad.
