# BANCO DE EJERCICIOS: MÓDULO 3.3 - INCIDENT RESPONSE

## METADATA

- **Subtema**: 3.3.2 (Protocolos de Guerra)
- **Nivel**: Management

---

## EJERCICIO 1: ASIGNACIÓN DE ROLES (ICS)

### ENUNCIADO

Incidente crítico en curso.
Equipo presente:

- **Ana** (CTO, muy técnica, se pone nerviosa).
- **Beto** (Senior Dev, conoce el sistema de memoria, tranquilo).
- **Carla** (Junior Dev, ansiosa por ayudar).
- **David** (Product Manager, preocupado por los clientes).

Asigna los roles: Incident Commander (IC), Ops Lead, Comms Lead. Justifica.

### SOLUCIÓN

1. **Ops Lead: Beto**. Es el que mejor conoce el sistema y mantiene la calma. Necesitamos sus manos en el teclado.
2. **Incident Commander (IC): Ana**. Como CTO tiene la autoridad para tomar decisiones difíciles (ej. apagar el sitio). _Advertencia_: Debe resistir la tentación de "micro-managear" a Beto. Su rol es coordinar, no teclear.
3. **Comms Lead: David**. Entiende el impacto en el cliente y puede traducir el lenguaje técnico a mensajes públicos empáticos.
4. **Carla**: Observadora (Shadowing). Aprende. Puede ayudar buscando logs si Beto se lo pide explícitamente.

---

## EJERCICIO 2: PRIORIZACIÓN "TORNIQUETE"

### ENUNCIADO

El sitio está lento (Latencia 10s).
Has identificado que una nueva query SQL mal optimizada es la causa.
Opciones:
A. Pasar 2 horas optimizando la query y agregando índices.
B. Hacer rollback a la versión anterior (toma 5 minutos).
C. Agregar más RAM a la base de datos (toma 30 minutos).

¿Cuál eliges en Fase de Contención?

### SOLUCIÓN

**Opción B (Rollback)**.
**Razón**: El objetivo de la contención es `MTTR` (Mean Time To Recovery). Restaurar servicio YA.

- Opción A es "Remediación/Arreglo Correcto", pero deja al usuario sufriendo 2 horas más.
- Opción C es arriesgada y lenta.
- Primero B (apagar el fuego). Luego, mañana, con calma, haces A (reconstruir la casa).

---

## EJERCICIO 3: BLAMELESS POST-MORTEM

### ENUNCIADO

Un dev borró la base de datos de producción por error manual.
Escribe el título de un Post-Mortem "Blameless" y una "Action Item" sistémica.
(Malo: "Juan borró la DB. Acción: Despedir a Juan").

### SOLUCIÓN

**Título**: "Pérdida de datos en Prod debido a error de comando en terminal".
**Causa Raíz Sistémica**: El sistema permitió que un humano tuviera acceso de escritura destructiva (DROP DATABASE) desde su terminal local sin autenticación multi-factor o revisión.
**Action Item**:

1. Implementar bloqueo de comandos destructivos en la VPN de producción.
2. Automatizar borrados vía Terraform con `prevent_destroy = true`.
3. _Nadie_ debe tener acceso root directo a la DB excepto un proceso de "Break-glass" auditado.
