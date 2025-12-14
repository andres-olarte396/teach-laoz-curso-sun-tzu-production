# CUESTIONARIO Y SOLUCIONARIO: TEMA 1.3 (RESOLVER EN CAPAS)

## CUESTIONARIO

### Instrucciones

Evalúa tu capacidad para ganar sin luchar (o luchar inteligentemente).

### Pregunta 1: Jerarquía de Resolución

Ante un problema complejo de negocio, ¿cuál es el orden correcto de intento de solución según el "Árbol de Decisión de Conflicto"?

- [ ] a) Código -> Arquitectura -> Negocio.
- [ ] b) Negocio (Negociar) -> Arquitectura (Comprar/Reusar) -> Código (Construir).
- [ ] c) Arquitectura -> Código -> Negocio.

### Pregunta 2: Ganar por Diseño

Tienes un problema recurrente de inconsistencia de datos entre dos microservicios.
¿Cuál es la solución de tipo "Ganar por Diseño"?

- [ ] a) Crear un chat en Slack para que los devs se avisen cuando hacen deploys.
- [ ] b) Implementar el _Outbox Pattern_ para garantizar atomicidad transaccional.
- [ ] c) Escribir un script manual de corrección de datos que se corre cada noche.

### Pregunta 3: Strangler Pattern (El Asedio)

¿Cuál es la estrategia principal del "Strangler Pattern" para migrar sistemas legacy?

- [ ] a) Apagar el sistema viejo y prender el nuevo en una noche (Big Bang).
- [ ] b) Refactorizar el código viejo línea por línea hasta que sea moderno.
- [ ] c) Envolver el sistema viejo con un Proxy y desviar tráfico gradualmente al nuevo.

---

## SOLUCIONARIO

### Respuesta 1

**Correcta: b) Negocio -> Arquitectura -> Código**
**Explicación**: Siempre intentamos resolver primero redefiniendo el problema (Capa Negocio, costo 0). Si no, intentamos reusar soluciones existentes (Capa Arquitectura, costo bajo). Solo al final recurrimos a construir custom (Capa Código, costo alto). Ir directo al código es ineficiencia estratégica.

### Respuesta 2

**Correcta: b) Implementar el _Outbox Pattern_**
**Explicación**: El Outbox Pattern es una solución arquitectónica que _elimina_ la posibilidad de inconsistencia. El chat (a) es una solución humana frágil. El script (c) es un parche reactivo (luchar contra el problema diariamente). El diseño gana la batalla antes de que empiece.

### Respuesta 3

**Correcta: c) Envolver y desviar gradualmente.**
**Explicación**: El Strangler Fig Pattern evita el riesgo catastrófico de las migraciones Big Bang. Al igual que una enredadera asfixia a un árbol viejo, el nuevo sistema reemplaza funcionalidades una por una hasta que el viejo puede ser apagado con seguridad. Es una estrategia de desgaste y asedio.
