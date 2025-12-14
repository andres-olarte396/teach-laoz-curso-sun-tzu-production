# DEFENSA PRIMERO: IMMUTABLE INFRASTRUCTURE

**Tiempo estimado**: 45 minutos
**Nivel**: Arquitecto / DevOps
**Prerrequisitos**: Docker/Contenedores básico

## ¿Por qué importa este concepto?

Sun Tzu dice: *"Los antiguos guerreros hábiles primero se hacían invencibles a sí mismos, y luego esperaban a descubrir la vulnerabilidad del enemigo"*.

En sistemas, la **Invencibilidad** es la predictibilidad. Si un servidor puede cambiar de estado (alguien entra por SSH y hace `apt-get update`), el sistema es vulnerable. Es "mutable". La entropía (caos) aumentará hasta que se rompa.

La **Infraestructura Inmutable** es la aplicación del principio de invencibilidad: Una vez desplegado, un servidor/contenedor NUNCA cambia. Si necesitas cambiar algo, lo destruyes y creas uno nuevo.

## Conexión con conocimientos previos

En el Módulo 1 aprendimos a planificar la logística. Ahora, al construir la fortaleza (Módulo 2), nos aseguramos de que los ladrillos no cambien de forma solos.

---

## Comprensión intuitiva

### Servidores "Mascota" vs. "Ganado"
-   **Modelo Mutable (Mascotas)**: Tienes un servidor llamado "Zeus". Lo cuidas, lo parcheas, lo reinicias con cariño. Si "Zeus" enferma, llamas al veterinario (Sysadmin) a las 3 AM.
-   **Modelo Inmutable (Ganado)**: Tienes el servidor "x-9982". Si enferma, lo sacrificas (kill) y lanzas uno nuevo idéntico en milisegundos. No tiene nombre, tiene número.

La invencibilidad viene de no depender de la salud de ningún individuo, sino de la capacidad de reemplazo instantáneo del sistema.

### La táctica de "Tierra Quemada"
En la infraestructura mutable, los errores se acumulan (Configuration Drift).
En la inmutable, cada deploy "quema" el mundo anterior y crea uno nuevo y puro. El error no puede acumularse porque no sobrevive al reinicio.

---

## Implementación práctica

### Docker como Unidad de Inmutabilidad

El contenedor es el ladrillo inmutable por excelencia.

```dockerfile
# Dockerfile = Plano de la fortaleza
FROM alpine:3.14
# Una vez construido, este código se "congela" en el tiempo (SHA hash)
COPY ./app /app
RUN npm install
# No hay SSH. No hay actualizaciones en caliente.
CMD ["npm", "start"]
```

Si descubres un bug en producción:
1.  **NO**: Entras al contenedor y editas el archivo JS. (Esto rompe la inmutabilidad).
2.  **SÍ**: Corriges en git, buildeas nueva imagen (v2), matas v1, lanzas v2.

### Terraform: Infraestructura como Código (IaC)

No clickeamos en la consola de AWS. Escribimos definiciones declarativas.

```hcl
resource "aws_instance" "fortress" {
  ami           = "ami-0c55b159cbfafe1f0" # Una imagen congelada específica
  instance_type = "t2.micro"
  
  # Si cambias la AMI aquí y aplicas, Terraform DESTRUYE la vieja y crea una nueva.
  # Invencibilidad por diseño.
}
```

---

## Trampas y errores comunes

### ❌ Error: "Quick Fix" en Prod
Un manager pide corregir un typo urgente. El dev entra por SSH, edita el HTML y guarda.
-   **Efecto**: El código en producción ya no coincide con git. En el próximo deploy automático, el cambio se perderá. El sistema es inconsistente (Mutable).
-   **Sun Tzu**: Has abierto una brecha en tu propia muralla.

### ❌ Error: Datos en el Contenedor
Guardar logs o bases de datos *dentro* del sistema de archivos del contenedor.
-   **Efecto**: Cuando matas el contenedor (modelo ganado), pierdes los datos.
-   **Corrección**: Stateless Apps. Los datos viven en volúmenes persistentes o bases de datos externas gestionadas.

---

## Resumen

**En una frase**: Para ser invencible, no arregles; reemplaza.

**Cuándo usarlo**:
-   Siempre en producción moderna.
-   Es obligatorio para escalar (Kubernetes/Auto-scaling).

**Siguiente paso**: Ahora que el sistema es "duro", aprenderemos a manejar los fallos inevitables con **Error Budgeting** (2.1.2).
