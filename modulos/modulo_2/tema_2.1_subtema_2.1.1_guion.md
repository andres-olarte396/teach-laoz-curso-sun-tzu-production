# GUIÓN: DEFENSA PRIMERO (INMUTABILIDAD)

## FICHA TÉCNICA

- **Duración**: 12 Minutos
- **Tono**: Defensivo, sólido, arquitectónico.

---

### 00:00 - INTRODUCCIÓN

**[LOCUTOR]**:
Sun Tzu dice: _"Los antiguos guerreros primero se hacían invencibles a sí mismos"_.
Nota el orden. Primero invencible. Luego victorioso.
No buscas atacar bugs. Buscas crear un sistema donde los bugs no puedan esconderse.

**[LOCUTOR]**:
El mayor enemigo de la estabilidad es el cambio no controlado.
Un servidor que lleva 2 años corriendo y ha sido parcheado 50 veces por 3 admins diferentes... es una bomba de tiempo.
Es un servidor "Mascota". Si muere, lloras.

---

### 03:00 - DEL CUIDADO AL REEMPLAZO

**[LOCUTOR]**:
La estrategia moderna es la **Infraestructura Inmutable**.
Tratamos a los servidores como ganado, no como mascotas de casa.
No tienen nombres cariñosos como "Zeus" o "Gandalf". Tienen números de serie.
"Worker-95". "Node-33".

**[LOCUTOR]**:
Si "Worker-95" se comporta raro, no entramos a diagnosticarle fiebre.
Lo eliminamos. Y creamos "Worker-96" en su lugar.
Nuevo. Limpio. Idéntico al diseño original.

---

### 06:00 - CONTENEDORES COMO LADRILLOS

**[LOCUTOR]**:
Docker es nuestro cemento para esta fortaleza.
Una imagen de Docker es una fotografía congelada de tu software.
No cambia.
Si hoy funciona en mi laptop, funcionará igual en el servidor de producción dentro de 5 años.
Esa predicibilidad... eso es ser invencible.

**[LOCUTOR]**:
Nunca, jamás, entres por SSH a producción a hacer un "arreglito rápido".
Eso es abrir la puerta de la muralla por la noche.
Si hay que arreglar, se arregla el plano (Dockerfile), se construye una nueva muralla, y se demuele la vieja.

---

### 09:00 - CIERRE

**[LOCUTOR]**:
Tu tarea: Identifica qué partes de tu sistema son "Mascotas".
¿Ese servidor de base de datos que todos tienen miedo de reiniciar? Ese es tu punto débil.
Hazlo inmutable. Hazlo reemplazable. Hazlo invencible.
