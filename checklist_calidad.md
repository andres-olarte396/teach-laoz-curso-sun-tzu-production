# CHECKLIST DE CALIDAD Y PRODUCCIÓN - TEACH LAOZ

Este documento define el estándar de terminación ("Definition of Done") para cada unidad educativa del curso.
Debe ser utilizado por el **Agente 5 (Integrador de Calidad)** para validar la producción antes del cierre de cada fase.

## 1. NIVEL TEMA (Subtemas Individuales)

_Se debe verificar para cada archivo `tema_X.Y...`_

| ID     | Elemento                     | Archivo Esperado (Patrón)       | Agente Propietario     | Criterios de Aceptación                                                                                                                        | Check |
| :----- | :--------------------------- | :------------------------------ | :--------------------- | :--------------------------------------------------------------------------------------------------------------------------------------------- | :---- |
| **01** | **Análisis de Preconceptos** | `tema_X.Y_preconceptos.md`      | **A12** (Analista)     | - Lista de conceptos previos necesarios.<br>- Analogías base definidas.<br>- "Trampas cognitivas" identificadas.                               | [ ]   |
| **02** | **Contenido Base**           | `tema_X.Y_contenido.md`         | **A2** (Sintetizador)  | - Estructura: Intuición -> Formalización -> Práctica.<br>- Uso de bloques de código ejecutables.<br>- Referencias cruzadas a temas anteriores. | [ ]   |
| **03** | **Revisión Cognitiva**       | _Aplicado sobre Contenido_      | **A11** (Editor)       | - Tono ajustado al perfil del alumno.<br>- Eliminación de "Maldición del Conocimiento".<br>- Sentencias claras y directas.                     | [ ]   |
| **04** | **Banco de Ejercicios**      | `tema_X.Y_ejercicios.md`        | **A3** (Diseñador Ej.) | - Mínimo 1 ejercicio por nivel (Básico, Interm., Avanzado).<br>- Solucionario detallado con "Por qué".<br>- Rúbricas de autoevaluación.        | [ ]   |
| **05** | **Guión Narrativo**          | `tema_X.Y_guion.md`             | **A7** (Guionista)     | - Formato de guión (Locutor/Escena).<br>- Tono conversacional y enganchante.<br>- Duración estimada explícita.                                 | [ ]   |
| **06** | **Script para Audio**        | `*_guion_optimizada.txt`        | **A7** (Guionista)     | - Sin markdown, limpio para TTS.<br>- Puntuación optimizada para pausas de respiración.                                                        | [ ]   |
| **07** | **Archivo de Audio**         | `tema_X.Y.mp3`                  | **A8** (Locutor)       | - Audio generado y audible.<br>- Sin cortes abruptos.<br>- Velocidad de dicción adecuada.                                                      | [ ]   |
| **08** | **Recursos Gráficos**        | `/media/tema_X.Y_*.svg`         | **A6** (Gráfico)       | - Diagramas en formato SVG/Mermaid.<br>- Estilo visual consistente (Paleta de colores).<br>- Texto legible.                                    | [ ]   |
| **09** | **Simulación Interactiva**   | `/simulaciones/tema_X.Y_*.html` | **A4** (Simulaciones)  | - Artifact auto-contenido (HTML+JS).<br>- Permite experimentar parámetros clave.<br>- No rompe con inputs extremos.                            | [ ]   |

## 2. NIVEL MÓDULO (Integración)

_Se verifica al terminar un grupo de temas._

| ID     | Elemento                | Archivo Esperado         | Agente Propietario  | Criterios de Aceptación                                                                                                                 | Check |
| :----- | :---------------------- | :----------------------- | :------------------ | :-------------------------------------------------------------------------------------------------------------------------------------- | :---- |
| **10** | **Evaluación Sumativa** | `modulo_X_evaluacion.md` | **A9** (Evaluador)  | - Cobertura de todos los subtemas del módulo.<br>- Feedback educativo en cada respuesta.<br>- Preguntas de escenario (no solo memoria). | [ ]   |
| **11** | **Coherencia Global**   | _Reporte de Integración_ | **A5** (Integrador) | - No hay contradicciones entre temas.<br>- La terminología es constante (no cambiar nombres de variables/conceptos).                    | [ ]   |

## 3. PROTOCOLO DE VALIDACIÓN (Workflow)

Para dar por finalizado un tema, ejecutar:

1. **Verificación de Existencia**: `Test-Path` para cada archivo requerido.
2. **Verificación de Contenido**: Leer muestras para validar integridad (no archivos vacíos).
3. **Validación Cruzada**:
    - ¿El ejercicio usa los conceptos explicados en el contenido?
    - ¿El guión refleja el contenido del tema?
    - ¿La simulación demuestra el concepto teórico?

## 4. ESTADO ACTUAL DEL CURSO (SUN TZU)

| Módulo | Tema | Contenido | Ejercicios | Guión | Audio Txt | Preconceptos | Gráficos | Simulación |
| :----- | :--- | :-------: | :--------: | :---: | :-------: | :----------: | :------: | :--------: |
| **M0** | 0.1  |    ✅     |    N/A     |  N/A  |    N/A    |      ✅      |    ⬜    |     ⬜     |
| **M1** | 1.1  |    ✅     |     ✅     |  ✅   |    ✅     |      ⬜      |    ⬜    |     ⬜     |
| **M1** | 1.2  |    ✅     |     ✅     |  ✅   |    ✅     |      ⬜      |    ⬜    |     ⬜     |
| **M1** | 1.3  |    ✅     |     ✅     |  ✅   |    ✅     |      ⬜      |    ⬜    |     ⬜     |
| **M2** | 2.1  |    ✅     |     ✅     |  ✅   |    ✅     |      ⬜      |    ⬜    |     ⬜     |
| **M2** | 2.2  |    ✅     |     ✅     |  ✅   |    ✅     |      ⬜      |    ⬜    |     ⬜     |
| **M2** | 2.3  |    ✅     |     ✅     |  ✅   |    ✅     |      ⬜      |    ⬜    |     ⬜     |
| **M3** | 3.1  |    ✅     |     ✅     |  ✅   |    ✅     |      ⬜      |    ⬜    |     ⬜     |
| **M3** | 3.2  |    ✅     |     ✅     |  ✅   |    ✅     |      ⬜      |    ⬜    |     ⬜     |
| **M3** | 3.3  |    ✅     |     ✅     |  ✅   |    ✅     |      ⬜      |    ⬜    |     ⬜     |
| **M4** | 4.1  |    ✅     |     ✅     |  ✅   |    ✅     |      ⬜      |    ⬜    |     ⬜     |
| **M4** | 4.2  |    ✅     |     ✅     |  ✅   |    ✅     |      ⬜      |    ⬜    |     ⬜     |

_Nota: Las columnas con ⬜ indican deuda de producción (Artefactos pendientes de agentes especialistas A6, A4, A8, A12)._
