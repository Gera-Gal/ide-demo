---
name: generate-diagrams
description: Genera o actualiza diagramas Mermaid (.mmd) y su imagen renderizada (.png) en la carpeta diagrams/, siguiendo las convenciones de CONTRIBUTING.md. Úsalo cuando se pida crear, actualizar o regenerar diagramas de arquitectura, secuencia, estados, clases o entidad-relación de un proyecto.
license: MIT
compatibility: Requiere Node.js y npx disponibles en PATH para renderizar con @mermaid-js/mermaid-cli (mmdc), que usa un Chromium headless.
metadata:
  author: Demo Kiro
  version: 1.0.0
---

# Generar / actualizar diagramas (.mmd → .png)

Esta skill produce diagramas como **fuente Mermaid** (`.mmd`) y su **imagen
renderizada** (`.png`), respetando `CONTRIBUTING.md` del repositorio.

> **Regla de oro (de CONTRIBUTING.md):** el `.mmd` es la fuente de verdad. El
> `.png` siempre se **genera** desde el `.mmd`; nunca se edita la imagen a mano.

## Cuándo usarla

- Se pide documentar la arquitectura o los flujos de un proyecto con diagramas.
- Hay que **actualizar** diagramas existentes tras un cambio de diseño.
- La skill `generate-sad` necesita imágenes para incrustar en `SAD.md`.

## Paso 0 — Leer las convenciones

Antes de escribir cualquier diagrama, lee `CONTRIBUTING.md` del repositorio y
aplica sus convenciones. Resumen operativo:

- **Idioma español** en nodos, notas y títulos.
- **Nombres de archivo** en `kebab-case` descriptivo con sufijo `-es`
  (p. ej. `arquitectura-contenedores-es.mmd`).
- Cada diagrama tiene **pareja** `.mmd` + `.png` con el mismo nombre base.
- **Título embebido** con *frontmatter* de Mermaid (`--- title: ... ---`).
- **Estilos reutilizables** con `classDef` + `class`. Paleta:
  barrera/control `#fff3cd`, riesgo `#f8d7da`, elemento nuevo `#d4edda`,
  sistema externo/fuente de datos `#e8f4ff`.
- Evita texto largo en nodos; usa `<br/>` para cortar líneas.
- Elige el tipo de diagrama según la tabla de CONTRIBUTING.md (flowchart,
  sequenceDiagram, stateDiagram-v2, classDiagram, erDiagram, C4...).

## Paso 1 — (Opcional) Context7 MCP para mejor documentación

Para enriquecer los diagramas con detalles correctos del stack (p. ej. nombres
de componentes, firmas o flujos reales de FastAPI/Pydantic):

1. Si el **Context7 MCP** está disponible, úsalo para resolver la librería y
   recuperar documentación antes de modelar el diagrama.
2. Si **no** está disponible o no está autorizado, **pide autorización** al
   usuario para usarlo. Mensaje sugerido:
   > "¿Autorizas usar el Context7 MCP para recopilar detalles del stack y hacer
   > los diagramas más precisos? Si no, continúo con la información del
   > repositorio."
3. Si el usuario declina, continúa solo con el código y documentación del repo.

## Paso 2 — Escribir o actualizar el `.mmd`

- Guarda los `.mmd` en `diagrams/`. Créala si no existe.
- Un archivo por diagrama. Para esta demo, los diagramas típicos son:
  - `arquitectura-contenedores-es.mmd` — vista de contenedores (frontend ↔ API
    ↔ almacén en memoria), con `flowchart` o `C4Container`.
  - `secuencia-crear-tarea-es.mmd` — `sequenceDiagram` del flujo "crear tarea".
  - `modelo-datos-es.mmd` — `erDiagram` o `classDiagram` de la entidad Tarea.
- Si el diagrama ya existe, **edítalo**; no crees duplicados con otro nombre.

## Paso 3 — Generar los `.png`

Ejecuta el script auxiliar desde la raíz del proyecto, o los comandos manuales.

Script (regenera todos los `.mmd` de `diagrams/`):

```powershell
./.kiro/skills/generate-diagrams/scripts/render.ps1
```

Comando manual para un solo diagrama (dentro de `diagrams/`):

```powershell
npx -y @mermaid-js/mermaid-cli -i mi-diagrama.mmd -o mi-diagrama.png -b white -s 2
```

Opciones: `-b white` fondo blanco, `-s 2` escala 2× para nitidez.

## Paso 4 — Verificar

```powershell
Get-ChildItem diagrams/*.mmd, diagrams/*.png | Select-Object Name, Length, LastWriteTime
```

Confirma que cada `.mmd` tiene su `.png` con fecha reciente. Si `mmdc` falla,
valida la sintaxis en https://mermaid.live/ y revisa que Node.js/npx estén
instalados.

## Salida esperada

- Uno o más pares `.mmd` + `.png` en `diagrams/`, con nombres en `kebab-case-es`.
- Un resumen de qué diagramas se crearon/actualizaron, listo para que la skill
  `generate-sad` los incruste en `SAD.md`.
