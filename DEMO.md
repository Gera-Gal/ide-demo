# Demo Kiro — 15 minutos

Guion para demostrar capacidades clave de Kiro: **steering**, **modo Spec**,
**MCP (Context7)** y **skills**. El hilo conductor es una pequeña app de lista
de tareas (backend Python + frontend JS) que, al terminar, se **autodocumenta**
con diagramas y un SAD.

## Qué quedó preparado en esta sesión

| Artefacto | Ruta | Para qué |
| --------- | ---- | -------- |
| Steering global | `~/.kiro/steering/fullstack-py-js-standards.md` | Convenciones de stack back Python + front JS (inclusion: auto) |
| Prompt de Spec | `PROMPT.md` | Entrada para la sesión Spec que diseña e implementa la app |
| Skill de diagramas | `.kiro/skills/generate-diagrams/` | Crea/actualiza `.mmd` + `.png` según `CONTRIBUTING.md` |
| Skill de SAD | `.kiro/skills/generate-sad/` | Crea/actualiza `SAD.md` incrustando los `.png` |
| Guía de diagramas | `CONTRIBUTING.md` | Convenciones Mermaid del repo (ya existía) |

## Requisitos previos

- **Node.js + npx** (para renderizar diagramas con `@mermaid-js/mermaid-cli`).
- **Python 3.11+** (para el backend).
- **Context7 MCP** configurado (opcional pero recomendado). Ejemplo de
  `.kiro/settings/mcp.json`:

  ```json
  {
    "mcpServers": {
      "context7": {
        "command": "npx",
        "args": ["-y", "@upstash/context7-mcp@latest"],
        "disabled": false,
        "autoApprove": ["resolve-library-id", "get-library-docs"]
      }
    }
  }
  ```

  Si no está configurado, las skills y el prompt están preparados para pedir
  autorización o continuar sin él.

## Guion (≈15 min)

### 0. Intro — 1 min
Enseña la estructura: un steering global, un `PROMPT.md`, dos skills y la guía
`CONTRIBUTING.md`. Idea: "Kiro no solo escribe código, también sigue nuestras
convenciones y documenta solo."

### 1. Steering — 2 min
Abre `~/.kiro/steering/fullstack-py-js-standards.md`. Explica que al ser
`inclusion: auto`, Kiro lo carga cuando detecta trabajo de API/full-stack. Es el
"contrato" de cómo se construye (FastAPI, estructura `backend/` + `frontend/`,
CORS, Pydantic).

### 2. MCP (Context7) — 2 min
Muestra `.kiro/settings/mcp.json` y la vista de servidores MCP. Explica que
Context7 aporta documentación actualizada del stack, y que tanto el prompt como
las skills lo usan o piden permiso para usarlo.

### 3. Modo Spec — 5 min
Abre una **sesión Spec** y pega el contenido de `PROMPT.md`.
- Deja que Kiro genere *requirements → design → tasks*.
- Señala cómo en *design* consulta Context7 para confirmar APIs de FastAPI.
- Lanza la implementación (o muéstrala ya hecha si el tiempo aprieta).
- Verifica: `uvicorn backend.main:app --reload --port 8000` y abre el frontend.

### 4. Skills: documentación automática — 4 min
Con la app lista, pide a Kiro documentar el proyecto:
- "Documenta la arquitectura" → activa **`generate-diagrams`**: crea los `.mmd`
  y renderiza los `.png` en `diagrams/` siguiendo `CONTRIBUTING.md`.
- "Genera el SAD" → activa **`generate-sad`**: crea `SAD.md` incrustando esas
  imágenes.
Abre `SAD.md` y muéstralo con los diagramas renderizados.

### 5. Cierre — 1 min
Resumen: steering = convenciones, Spec = diseño/implementación guiados,
MCP = contexto externo fresco, skills = flujos reutilizables y portables. Todo
encadenado, de la idea al documento de arquitectura.

## Plan B (si algo falla)

- **Sin Node/npx:** muestra los `.mmd` y el Mermaid Live Editor en vez de
  renderizar los `.png`.
- **Sin Context7:** las skills continúan con la info del repo tras pedir permiso.
- **Sin tiempo para implementar:** ten la app ya generada y salta directo a las
  skills de documentación.
