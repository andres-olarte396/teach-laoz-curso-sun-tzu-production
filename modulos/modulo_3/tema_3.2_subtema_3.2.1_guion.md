# GUIÓN: EL MAPA NO ES EL TERRITORIO (MÉTRICAS)

## FICHA TÉCNICA

- **Duración**: 12 Minutos
- **Tono**: Escéptico, inquisitivo.

---

### 00:00 - INTRODUCCIÓN

**[LOCUTOR]**:
Un general entra al cuarto de guerra. Mira el mapa.
"Mis tropas ocupan la colina", dice el mapa.
Pero en la realidad, la colina fue bombardeada hace una hora y las tropas huyeron.
El mapa dice victoria. El territorio dice derrota.

**[LOCUTOR]**:
En sistemas, tu mapa es el Dashboard. Grafana, Datadog.
Tu territorio es la experiencia del usuario.
Si tu dashboard está en verde, pero tus usuarios en Twitter te insultan...
Tira el dashboard a la basura. El mapa miente.

---

### 03:00 - MÉTRICAS DE VANIDAD VS DOLOR

**[LOCUTOR]**:
¿Por qué miente el mapa? Porque monitoreamos lo fácil, no lo importante.
Es fácil medir CPU. Es fácil medir RAM. Uso de Disco.
Son "Métricas de Vanidad" del servidor.
"Mira qué saludable soy, tengo 50% de RAM libre".

**[LOCUTOR]**:
Al usuario no le importa tu RAM.
Le importa: "¿Pude comprar?", "¿Cargó rápido?".
Esas son "Métricas de Dolor".
Si monitoreas Disco pero no monitoreas "Tasa de Compras Exitosas", estás ciego.

---

### 06:00 - PROMEDIOS MENTIROSOS

**[LOCUTOR]**:
Y cuidado con las matemáticas simples.
"El tiempo de respuesta promedio es 200 milisegundos".
Suena bien.
Pero "Promedio" es una mentira estadística.

**[LOCUTOR]**:
Si yo tengo 2 pollos y tú tienes 0... en promedio tenemos 1 pollo cada uno.
Pero tú te mueres de hambre.
En sistemas, usa Percentiles. P99.
"El 99% de mis usuarios navegan rápido". Eso es verdad.
Deja de usar promedios. Los promedios esconden los cadáveres.

---

### 09:00 - CIERRE

**[LOCUTOR]**:
Sun Tzu dice: _"Conoce al enemigo"_.
El enemigo no es la CPU alta. El enemigo es la frustración del usuario.
Reconfigura tus alertas hoy.
Si suena una alarma a las 3 AM, que sea porque un cliente está sufriendo, no porque un disco está lleno.

Nos vemos.
