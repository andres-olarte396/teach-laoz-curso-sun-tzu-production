# GESTIÓN DEL MOMENTUM: RUTAS DIRECTAS E INDIRECTAS

**Tiempo estimado**: 45 minutos
**Nivel**: Product Manager / Tech Lead
**Prerrequisitos**: Concepto de MVP

## ¿Por qué importa este concepto?

Sun Tzu dice: *"La lucha armada es desafortunada... Tomar una ruta indirecta y hacerla directa es la maniobra más difícil"*.
En operaciones de software, a menudo creemos que el camino más rápido entre A (Idea) y B (Producción) es una línea recta: Construir la solución final perfecta.
Pero el camino recto está lleno de peligros: Requisitos cambiantes, bloqueos técnicos, competidores.

La **Maniobra (Jun Zheng)** nos enseña a tomar rutas tortuosas (MVPs, Prototipos, "Mago de Oz") que parecen más lentas pero nos llevan a la victoria (Product-Market Fit) más rápido que la ruta directa (Build the full thing).

## Conexión con conocimientos previos

En el Módulo 1 planeamos. En el 2 diseñamos. Ahora en el 3 estamos marchando. La marcha nunca es en línea recta. Necesitamos navegar los obstáculos operativos.

---

## Comprensión intuitiva

### La Ruta Directa es una Trampa
-   **Objetivo**: Sistema de facturación global.
-   **Ruta Directa**: "Construyamos el soporte para 150 monedas y 50 idiomas antes de lanzar".
-   **Resultado**: 2 años de desarrollo. Cuando lanzas, la ley fiscal cambió. Fracaso.

### La Ruta Indirecta (El Desvío Estratégico)
-   **Objetivo**: Sistema de facturación global.
-   **Ruta Indirecta**: "Lancemos solo en USD con un Excel manual por detrás para validar si alguien paga". (Concierge MVP).
-   **Resultado**: Lanzamiento en 2 semanas. Aprendizaje inmediato. El sistema manual es "lento" técnicamente, pero "rápido" estratégicamente.

### Hacer de lo Sinuoso, Directo
Sun Tzu enseña a engañar al enemigo (o al problema) haciéndole creer que estamos lejos, cuando estamos por golpear.
Usar un **Hard-coded JSON** en lugar de una base de datos real parece "lejos" de la solución final. Pero te permite validar la UI hoy mismo. Has convertido un desvío técnico en un atajo de negocio.

---

## Implementación práctica: Patrones de Maniobra

### 1. El Patrón "Mago de Oz"
El usuario ve una automatización completa. Detrás, hay humanos.
-   **Caso**: Startup de escaneo de recibos con AI.
-   **Implementación**: El usuario sube foto -> Se envía a un operador humano -> Operador transcribe -> JSON de respuesta.
-   **Ventaja**: Validas el mercado con $0 de inversión en AI. Solo construyes la AI cuando el volumen humano es insostenible.

### 2. El Patrón "Fake Door"
Antes de construir la feature "Exportar a PDF":
-   Pon el botón "Exportar a PDF".
-   Al hacer click, muestra: "¡Ups! Estamos construyendo esto. Déjanos tu email para avisarte".
-   Mides clicks.
-   Si nadie hace click, te ahorraste 2 semanas de desarrollo. Eso es maniobra pura.

---

## Trampas y errores comunes

### ❌ Error: Confundir Prototipo con Producción
Llevar el código "Mago de Oz" (spaghetti con humanos) a escala masiva sin refactorizar.
-   **Efecto**: Costos operativos explotan. El sistema colapsa.
-   **Solución**: La ruta indirecta es temporal. Una vez validada, debes pavimentar la carretera (construir la solución robusta).

### ❌ Error: La obsesión por la escalabilidad día 1
"¿Qué pasa si tenemos 1 millón de usuarios mañana?"
-   **Realidad**: No los tendrás.
-   Diséñalo para 10 usuarios. Luego para 100. Luego para 1000.
-   La reescritura es parte de la maniobra.

---

## Resumen

**En una frase**: El camino más corto al valor no suele ser el camino más corto de ingeniería.

**Cuándo usarlo**:
-   Siempre que el requisito sea ambiguo o la incertidumbre alta.
-   Cuando el deadline es imposible para la "solución real".

**Siguiente paso**: Veremos cómo usar la tecnología para comprar más opciones de maniobra con **El Arte del Desvío (Feature Flags Avanzado)** (3.1.2).
