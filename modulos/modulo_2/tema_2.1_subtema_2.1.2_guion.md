# GUIÓN: CAPACIDAD DE ERROR (ERROR BUDGET)

## FICHA TÉCNICA

- **Duración**: 10 Minutos
- **Tono**: SRE, Matemático, Calculador.

---

### 00:00 - INTRODUCCIÓN

**[LOCUTOR]**:
Muchos managers piensan que el objetivo de Sistemas es que "nunca falle nada".
Eso es un error estratégico.
Si nunca falla nada, significa que no te estás moviendo lo suficientemente rápido.
Sun Tzu dice: _"El experto en ataque se mueve desde las alturas del cielo"_. Para atacar, debes arriesgar.

**[LOCUTOR]**:
Hoy hablamos del concepto más poderoso de Google SRE: El Error Budget.
El permiso matemático para romper cosas.

---

### 03:00 - EL 100% ES IMAGINARIO

**[LOCUTOR]**:
El uptime del 100% es imposible y, además, es caro.
Pasar del 99.9% al 99.99% cuesta diez veces más dinero y esfuerzo.
¿Tus usuarios notan la diferencia? Probablemente no. Su propio Wi-Fi es menos fiable que tu servidor.
Entonces, ¿por qué pagar por una perfección que el usuario no puede percibir?

**[LOCUTOR]**:
Definimos un SLO (Service Level Objective). Digamos 99.9%.
Eso nos deja un 0.1% de margen de error.
Ese 0.1% no es "basura". Es un **Activo Financiero**.
Son 43 minutos al mes que PUEDEN usarse para despliegues arriesgados, experimentos o pruebas de caos.

---

### 06:00 - GASTAR EL PRESUPUESTO

**[LOCUTOR]**:
Imagina una tarjeta de débito.
Cada vez que haces un deploy y causas un pequeño error, estás pagando con esa tarjeta.
Mientras tengas saldo, el equipo de Desarrollo tiene luz verde. ¡Ataque! ¡Features!
Pero si te gastas el saldo... si consumes tus 43 minutos... la tarjeta se bloquea.

**[LOCUTOR]**:
Entramos en **Feature Freeze**.
Desarrollo ya no puede lanzar features. Solo pueden trabajar en estabilidad hasta que el mes termine y el saldo se recargue.
Esta política alinea a Devs (que quieren velocidad) y Ops (que quieren estabilidad).
Ambos miran el mismo saldo.

---

### 09:00 - CIERRE

**[LOCUTOR]**:
Deja de prometer "cero errores". Es una mentira.
Promete un "Presupuesto de Error Gestionado".
Eso es madurez estratégica. Eso es Ingeniería real.

Hasta la próxima.
