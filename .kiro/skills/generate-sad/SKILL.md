---
name: generate-sad
description: Genera o actualiza un Software Architecture Document (SAD.md) que describe la arquitectura del proyecto e incrusta los diagramas .png generados en diagrams/. Úsalo después de implementar un proyecto para documentarlo, o para actualizar el SAD tras un cambio de arquitectura.
license: MIT
compatibility: No requiere herramientas externas para escribir el SAD. Para que las imágenes existan, ejecuta antes la skill generate-diagrams (requiere Node.js/npx).
metadata:
  author: Demo Kiro
  version: 1.0.0
---

# Generar / actualizar el Software Architecture Document (SAD.md)

Esta skill produce o actualiza `SAD.md` en la raíz del proyecto: un documento de
arquitectura conciso que **incrusta los diagramas** de `diagrams/` y explica las
decisiones de diseño.

## Cuándo usarla

- Terminó la implementación (p. ej. de una sesión Spec) y hay que documentarla.
- Cambió la arquitectura y el `SAD.md` existente debe actualizarse.

## Paso 1 — Asegurar que existen los diagramas

El SAD incrusta imágenes `.png`. Antes de escribirlo:

1. Comprueba que `diagrams/` contiene los `.png` necesarios (arquitectura,
   secuencia, modelo de datos).
2. Si faltan o están desactualizados, **activa primero la skill
   `generate-diagrams`** para crearlos/regenerarlos. No inventes rutas de
   imágenes que no existen.

## Paso 2 — (Opcional) Context7 MCP para mejor documentación

Para describir el stack con precisión (versiones, componentes, patrones de
FastAPI/Pydantic):

1. Si el **Context7 MCP** está disponible, úsalo para recuperar documentación
   actualizada del stack y reflejarla en las secciones de tecnología y
   decisiones.
2. Si **no** está disponible o autorizado, **pide autorización** al usuario:
   > "¿Autorizas usar el Context7 MCP para documentar el stack con más
   > precisión en el SAD? Si no, lo redacto con la información del repositorio."
3. Si declina, redacta el SAD a partir del código y los diagramas del repo.

## Paso 3 — Escribir / actualizar SAD.md

- Usa la plantilla `assets/sad-template.md` como base (cópiala a `SAD.md` si no
  existe) y rellénala con la información real del proyecto.
- Si `SAD.md` ya existe, **actualiza** las secciones afectadas en lugar de
  reescribir todo; conserva el contenido aún válido.
- **Incrusta cada diagrama** con una ruta relativa a los `.png` de `diagrams/`,
  con texto alternativo descriptivo:

  ```markdown
  ![Vista de contenedores: frontend, API y almacén en memoria](diagrams/arquitectura-contenedores-es.png)
  ```

- Mantén el documento en **español** y alineado con el steering
  `fullstack-py-js-standards`.

## Paso 4 — Verificar

- Cada imagen referenciada en `SAD.md` existe en `diagrams/` (rutas correctas).
- Las secciones obligatorias están completas (ver plantilla).
- No hay enlaces rotos ni imágenes sin su `.png`.

## Salida esperada

- `SAD.md` en la raíz del proyecto, con los diagramas incrustados y las
  secciones de contexto, contenedores, flujos, datos y decisiones completas.
- Un breve resumen de qué secciones se crearon o actualizaron.
