# SHARDING DE ATENCIÓN: VACÍOS Y PLENITUDES (XU SHI)

**Tiempo estimado**: 40 minutos
**Nivel**: Estratégico / Refactoring
**Prerrequisitos**: Concepto de Deuda Técnica

## ¿Por qué importa este concepto?

Sun Tzu dice: _"Se debe atacar lo que está vacío y evitar lo que está lleno"_.
En ingeniería, nuestros recursos (tiempo, dinero, atención) son limitados. No podemos arreglar todo el código a la vez.

El concepto de **Vacío (Xu)** y **Plenitud (Shi)** nos enseña a identificar dónde aplicar fuerza.

- **Plenitud (Shi)**: Partes del sistema sólidas, bien probadas, o problemas demasiado grandes y costosos de atacar frontalmente (ej. reescribir el Core bancario).
- **Vacío (Xu)**: Partes débiles, bugs críticos fáciles de aislar, o features donde la competencia no está presente.

La estrategia es hacer "Sharding de Atención": No te distraigas con todo. Golpea el punto débil con fuerza abrumadora.

## Conexión con conocimientos previos

Ya tenemos Momentum (2.2). Ahora dirigimos ese momentum. No queremos chocar contra una pared (Plenitud), queremos fluir por las grietas (Vacío).

---

## Comprensión intuitiva

### El Mito del Refactor Completo

El deseo de todo dev: "Vamos a detenernos 3 meses y reescribir todo bien".
Esto es atacar una Plenitud. Es un suicidio. El negocio no puede esperar 3 meses sin valor.
**Estrategia Xu/Shi**: Encuentra el módulo más doloroso y débil (el Vacío). Ataca solo ese. Deja el resto sucio por ahora.

### Bloatware vs. Lean

- **Bloat (Plenitud negativa)**: Software lleno de features que nadie usa. Es pesado. Difícil de mover.
- **Lean (Vacío estratégico)**: Software que hace _una_ cosa increíblemente bien. Es ágil.
  Sun Tzu aconseja mantenerse Lean para poder moverse, y atacar el Bloat del enemigo (su lentitud).

---

## Implementación práctica: Técnica de "The Scout Rule"

### Algoritmo de Limpieza Oportunista

No limpies toda la casa. Limpia donde pisas.

```python
def trabajar_en_ticket(ticket):
    area_codigo = abrir_archivos(ticket)

    # Análisis de Vacío
    if es_facil_de_mejorar(area_codigo) and time_cost < 15_min:
        # Atacar el vacío (oportunidad fácil)
        refactorizar_pequeño(area_codigo)

    implementar_feature(ticket)
    # Dejar el campamento más limpio de lo que lo encontraste.
```

### Identificando Vacíos en el Mercado

Si tu competidor es un Enterprise Monolith gigante (lleno, lento, caro).
¿Dónde está su vacío?

- Probablemente en la UX.
- Probablemente en el soporte al cliente pequeño.
- Probablemente en la API para desarrolladores.
  Ataca ahí. No intentes copiar su lista de 500 features.

---

## Trampas y errores comunes

### ❌ Error: Atacar la Fortaleza

Intentar reemplazar a Excel construyendo un clon de Excel.

- Excel es una Plenitud máxima. Tiene 30 años de features.
- **Estrategia Correcta**: Construye algo que Excel hace mal (ej. Colaboración en tiempo real, como hizo Notion/Airtable al principio). Ataca el vacío.

### ❌ Error: Optimización Prematura (de nuevo)

Optimizar una función que consume el 1% de la CPU.

- Eso es atacar donde no hay ganancia. Busca el cuello de botella (el Vacío de rendimiento) que consume el 80%.

---

## Resumen

**En una frase**: No golpees la pared; golpea la grieta.

**Cuándo usarlo**:

- Al decidir qué deuda técnica pagar. (Paga la que tiene más interés/dolor y es más accesible).
- Al priorizar features contra un competidor.

**Siguiente paso**: Una vez identificado el punto de ataque, usamos la **Concentración de Fuerza** (2.3.2) para asegurar la victoria.
