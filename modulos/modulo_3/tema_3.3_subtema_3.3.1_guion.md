# GUIÓN: LAS 9 VARIACIONES (CHAOS ENGINEERING)

## FICHA TÉCNICA

- **Duración**: 12 Minutos
- **Tono**: Desafiante, provocador.

---

### 00:00 - INTRODUCCIÓN

**[LOCUTOR]**:
Sun Tzu habla de las "9 Variaciones". Terrenos donde no puedes acampar. Caminos que no debes seguir.
La lección es: **El plan nunca sobrevive al contacto con el enemigo**.
Tu sistema distribuido es un mapa de batalla que cambia cada segundo.

**[LOCUTOR]**:
¿Qué pasa si AWS pierde una zona? ¿Qué pasa si el DNS falla?
La mayoría de las empresas rezan para que no pase.
Las empresas de élite (Netflix, Google)... **provocan que pase**.
Eso es Chaos Engineering.

---

### 03:00 - VACUNAR EL SISTEMA

**[LOCUTOR]**:
Piensa en una vacuna. Te inyectan un virus debilitado para que tu cuerpo aprenda a defenderse.
Chaos Engineering es inyectar fallos controlados.
Apagamos un servidor un martes a las 10 AM, con todo el equipo mirando.
¿El sistema se recuperó solo?
¿Sí? Genial. Somos inmunes.
¿No? Genial. Encontramos una debilidad antes de que nos matara en Black Friday.

---

### 06:00 - NO ES CAOS, ES CIENCIA

**[LOCUTOR]**:
No es entrar al data center con un hacha a lo loco.
Es el método científico.

1. Hipótesis: "Si desconecto el cable de red de la base de datos, la app debería mostrar datos en caché".
2. Experimento: Desconectar cable.
3. Observación: La app mostró un error 500 horrible.
4. Conclusión: Nuestra caché no funciona. ¡A arreglarlo!

**[LOCUTOR]**:
Si no haces esto tú, el universo lo hará por ti.
Y el universo no tiene piedad ni horarios de oficina.
Rompe tu sistema hoy, para que no se rompa mañana.

---

### 09:00 - CIERRE

**[LOCUTOR]**:
El caos es inevitable. El sufrimiento es opcional.
Entrena a tu sistema para navegar las 9 variaciones.
Que la inestabilidad sea su elemento natural.
Se llama Antifragilidad.

Nos vemos.
