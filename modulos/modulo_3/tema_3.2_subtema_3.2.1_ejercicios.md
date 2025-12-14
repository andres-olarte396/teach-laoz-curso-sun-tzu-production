# BANCO DE EJERCICIOS: MÓDULO 3.2 - MÉTRICAS VS REALIDAD

## METADATA

- **Subtema**: 3.2.1 (El Mapa no es el Territorio)
- **Nivel**: Intermedio

---

## EJERCICIO 1: AUDITORÍA DE ALERTAS

### ENUNCIADO

Un ingeniero configura las siguientes alertas para un e-commerce. Clasifícalas como **BUENA** (Orientada a Síntoma/Usuario) o **MALA** (Orientada a Causa/Ruido).

1. "Uso de Disco en Servidor DB > 80%".
2. "Tasa de Errores HTTP 500 en Checkout > 1%".
3. "Carga promedio (Load Average) > 5".
4. "Latencia p99 en Home > 2 segundos".
5. "El proceso 'cron_backup' no terminó exitosamente".

### SOLUCIÓN

1. **MALA (Ruido)**: El disco lleno al 80% no afecta al usuario hoy. Es una tarea de mantenimiento, no una emergencia de las 3 AM.
2. **BUENA (Síntoma)**: Afecta directamente al dinero. Despertar al ingeniero.
3. **MALA (Ruido)**: Load Average es ambiguo. Si la latencia está bien, el Load no importa.
4. **BUENA (Síntoma)**: El sitio está lento para el usuario.
5. **BUENA (Predictiva)**: Aunque no afecta al usuario _ya_, perder backups es riesgo fatal. (Excepción a la regla).

---

## EJERCICIO 2: ANÁLISIS DE PERCENTILES

### ENUNCIADO

Tienes estos tiempos de respuesta en 10 peticiones:
`[10ms, 12ms, 10ms, 11ms, 10ms, 12ms, 11ms, 10ms, 15ms, 5000ms]`

1. Calcula el Promedio.
2. Calcula el Percentil 50 (Mediana).
3. Calcula el Percentil 90 (p90).
4. ¿Qué historia cuenta el Promedio vs el p90?

### SOLUCIÓN

1. **Promedio**: (5101 / 10) = **510 ms**.
2. **Mediana**: ~11 ms.
3. **p90**: 15 ms (El 90% de los usuarios ven 15ms o menos).
4. **Historia**:
    - El promedio dice "El sitio es lento (0.5s)". **FALSO**.
    - El p90 dice "El sitio es rapidísimo (15ms)". **VERDADERO**.
    - El outlier (5000ms) destruye el promedio. Debemos investigar ese caso individual (race condition o timeout), pero no optimizar el código general.

---

## EJERCICIO 3: DISEÑO DE BLACKBOX

### ENUNCIADO

Tu API devuelve `200 OK` pero el JSON viene vacío por un bug de lógica.
Tu dashboard de "HTTP Errors" está en verde (0 errores).
Los clientes están llamando furiosos.

Diseña un check "Sintético" para detectar esto.

### SOLUCIÓN

Crear un script (Lamda/Cron) que corre cada minuto:

1. Hace `GET /api/productos`.
2. Recibe la respuesta.
3. **Aserción Lógica**: `if (json.productos.length == 0) raise ALERTA_CRÍTICA`.
4. No confíes en el código de estado HTTP. Verifica el **contenido** desde la perspectiva del usuario.
