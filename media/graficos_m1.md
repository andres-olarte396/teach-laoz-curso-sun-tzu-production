# GRÁFICOS START

## Tema 1.1: Los 5 Factores (Pentágono)

```mermaid
graph TD
    Tao[Tao (Misión)] --> Clima
    Clima[Clima (Contexto)] --> Terreno
    Terreno[Terreno (Infra)] --> Liderazgo
    Liderazgo[Liderazgo (Equipo)] --> Metodo
    Metodo[Método (Proceso)] --> Tao

    style Tao fill:#f9f,stroke:#333,stroke-width:4px
    style Terreno fill:#ccf,stroke:#333,stroke-width:2px
```

## Tema 1.2: El Costo del Delay (Curva J)

```mermaid
xychart-beta
    title "Costo de No Desplegar (Deuda de Inventario)"
    x-axis [Día 1, Día 7, Día 14, Día 30]
    y-axis "Dinero Perdido" 0 --> 100
    line [10, 20, 50, 95]
```

## Tema 1.3: Capas de Resolución (Layered Defense)

```mermaid
graph BT
    L1[Capa Física (Difícil)] --> L2[Capa Lógica (Media)]
    L2 --> L3[Capa Conceptual (Fácil)]

    click L3 "Solución aquí: Barata"
    click L1 "Solución aquí: Cara"

    style L3 fill:#8f8,stroke:#333
    style L1 fill:#f88,stroke:#333
```
