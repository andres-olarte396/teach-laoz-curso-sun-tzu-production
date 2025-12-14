# BANCO DE EJERCICIOS: MÓDULO 3.1 - MANIOBRA

## METADATA

- **Subtema**: 3.1.1 (Rutas Directas e Indirectas)
- **Nivel**: Intermedio

---

## EJERCICIO 1: DISEÑO "MAGO DE OZ"

### ENUNCIADO

Tienes una idea para una startup: "Tinder para adoptar mascotas".
El algoritmo de matching perfecto requiere Machine Learning avanzado, integración con APIs de refugios (que no tienen API) y geolocalización precisa.
Tiempo estimado de desarrollo "Ruta Directa": 6 meses.
Dinero disponible: 1 mes.

Diseña una "Ruta Indirecta" (MVP Mago de Oz) para validar si la gente quiere adoptar así.

### SOLUCIÓN

**Estrategia**:

1. **Frontend**: Un Typeform o una Landing Page simple donde el usuario pone sus preferencias ("Perro", "Grande", "Activo").
2. **Backend**: Cero código. El formulario llega a tu email.
3. **Proceso (Humano)**: Tú visitas manualmente las webs de 3 refugios locales, eliges 3 perros que coincidan y le envías un email manual al usuario con las fotos.
4. **Validación**: Si el usuario responde y adopta, has validado el modelo.
    **Costo**: 2 días.
    **Resultado**: Has convertido lo sinuoso en directo.

---

## EJERCICIO 2: FAKE DOOR TESTING

### ENUNCIADO

Eres PM de una app de gestión de gastos.
Crees que los usuarios quieren "Integración con Criptomonedas".
Los desarrolladores dicen que integrar la Blockchain tomará 3 meses.
¿Cómo validas esto HOY con 0 líneas de código backend?

### SOLUCIÓN

**Táctica Fake Door**:

1. Añade un botón en el menú: "Conectar Wallet (Crypto)".
2. Al hacer click, abre un modal: "¡Funcionalidad exclusiva Beta! Estamos dando acceso poco a poco. Únete a la lista de espera."
3. Mide cuántos clicks únicos recibes en una semana.
4. Si < 1% de usuarios hacen click, cancela el proyecto.
5. Si > 20% hacen click, invierte los 3 meses de desarrollo.

---

## EJERCICIO 3: DEFENSA CONTRA EL PERFECCIONISMO

### ENUNCIADO

Tu Tech Lead se niega a lanzar el MVP porque "El código de facturación no soporta casos de borde como años bisiestos en la devolución de impuestos de Noruega".
El mercado objetivo inicial es España.

Utiliza el argumento de Sun Tzu ("Hacer de lo sinuoso, directo") para desbloquearlo.

### SOLUCIÓN

**Argumento**:
"Si intentamos soportar todos los casos de borde ahora (Ruta Directa a la Perfección), llegaremos tarde al mercado (Derrota).
La maniobra estratégica es lanzar solo para España hoy. Si un usuario noruego entra en año bisiesto, fallará. El costo de ese fallo es 1 cliente enojado. El costo de no lanzar es la quiebra de la empresa.
Tomaremos la ruta indirecta: Hardcodear la lógica para España ahora, y refactorizar para el mundo después."
