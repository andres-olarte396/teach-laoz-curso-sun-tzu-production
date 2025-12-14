# BANCO DE EJERCICIOS: MÓDULO 3.1 - EL ARTE DEL DESVÍO (FLAGS)

## METADATA

- **Subtema**: 3.1.2 (Feature Flags Tácticas)
- **Nivel**: Avanzado

---

## EJERCICIO 1: PLAN DE ROLLOUT

### ENUNCIADO

Vas a lanzar un cambio radical en la UI del Home de un e-commerce gigante (10M visitas/día).
Si la nueva UI baja la conversión, pierden millones.
Diseña un plan de rollout usando Anillos de Seguridad.

### SOLUCIÓN

1. **Anillo 0 (Local)**: Tests unitarios y de integración pasan.
2. **Anillo 1 (Intranet)**: Flag `new_ui_home` activa para empleados (por IP o email corporativo). Feedback cualitativo.
3. **Anillo 2 (Canary 1%)**: Activa para el 1% de usuarios aleatorios. Monitorea métrica "Add to Cart".
    - _Check_: ¿Conversión estable o superior?
4. **Anillo 3 (Progresivo)**: Escalar a 10%, 25%, 50%.
    - _Check_: ¿Latencia del servidor estable?
5. **Anillo 4 (Full)**: 100%.
6. **Limpieza**: Borrar código de UI vieja y la flag después de 2 semanas.

---

## EJERCICIO 2: KILL SWITCH IMPLEMENTATION

### ENUNCIADO

Escribe pseudocódigo para un endpoint que usa una librería de terceros inestable para procesar imágenes.
El requerimiento es que si la librería falla, el endpoint debe devolver la imagen original sin procesar, y debe poder desactivarse globalmente en < 1 segundo.

### SOLUCIÓN

```python
def procesar_imagen_endpoint(request):
    imagen = request.files['img']

    # 1. Kill Switch Global
    if not feature_flags.is_enabled("use_risky_image_lib"):
        return imagen # Return original (Fallback seguro)

    try:
        # 2. Intento de procesamiento
        resultado = risky_lib.process(imagen)
        return resultado
    except Exception as e:
        log.error(e)
        # 3. Fallback automático en caso de error
        return imagen
```

---

## EJERCICIO 3: GESTIÓN DE DEUDA DE FLAGS

### ENUNCIADO

Haces un `grep` en el código y encuentras:
`if (features.is_enabled("navidad_2020")): ...`
Estamos en 2025.
¿Qué representa esto y qué riesgo conlleva?

### SOLUCIÓN

**Representa**: Deuda Técnica de Configuración.
**Riesgo**:

- Código muerto que se sigue compilando/interpretando.
- Confusión para nuevos devs ("¿Seguimos en navidad?").
- Posible activación accidental si alguien recicla el nombre de la flag.
  **Acción**: Borrar inmediatamente el bloque `if` y dejar solo el código que ganó (o eliminarlo si era temporal).
