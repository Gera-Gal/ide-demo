---
inclusion: auto
name: fullstack-py-js-standards
description: Convenciones de stack, estructura y estilo para proyectos con backend en Python (FastAPI) y frontend en JavaScript (vanilla + fetch). Úsalo al diseñar o implementar APIs, endpoints, servidores de desarrollo o la capa de interfaz de estos proyectos.
---

# Estándar full-stack: backend Python + frontend JavaScript

Este steering define cómo construimos demos y servicios pequeños con un
**backend en Python** y un **frontend en JavaScript mínimo**. El objetivo es que
cualquier implementación salga homogénea, sencilla de arrancar y fácil de
documentar después.

> Este archivo es un ejemplo pensado para una demo de Kiro. Ajusta las
> versiones y rutas a tu proyecto real cuando lo uses en producción.

## 1. Stack por defecto

- **Backend:** Python 3.11+ con **FastAPI** y **Uvicorn** como servidor ASGI.
  - Validación de datos con **Pydantic v2**.
  - Dependencias declaradas en `requirements.txt` (o `pyproject.toml` si el
    proyecto ya lo usa). Fija versiones con `==` para que la demo sea
    reproducible.
- **Frontend:** JavaScript moderno (ES2020+) **sin framework**: HTML + CSS +
  `fetch` para hablar con la API. Nada de build step salvo que se pida.
- **Formato de intercambio:** JSON en todos los endpoints.

Cuando necesites confirmar APIs, versiones o buenas prácticas del stack
(FastAPI, Pydantic, Uvicorn), usa el **Context7 MCP** para recuperar
documentación actualizada antes de escribir el código. Si Context7 no está
disponible, continúa con tu conocimiento y deja una nota.

## 2. Estructura de proyecto recomendada

```text
<proyecto>/
├── backend/
│   ├── main.py            # App FastAPI y registro de routers
│   ├── models.py          # Esquemas Pydantic (entrada/salida)
│   ├── routers/           # Un módulo por recurso
│   └── requirements.txt
├── frontend/
│   ├── index.html
│   ├── app.js             # Lógica de UI + llamadas fetch
│   └── styles.css
├── diagrams/              # Diagramas .mmd + .png (ver skill de diagramas)
├── SAD.md                 # Documento de arquitectura (ver skill de SAD)
└── README.md              # Cómo arrancar back y front
```

## 3. Convenciones de backend (Python / FastAPI)

- Un **router por recurso** en `backend/routers/`, incluido en `main.py` con
  `app.include_router(...)`.
- Modelos Pydantic separados para **entrada** (`XxxCreate`) y **salida**
  (`XxxRead`). No devuelvas modelos de dominio crudos.
- Prefijo de rutas con versión: `/api/v1/...`.
- Habilita **CORS** para el origen del frontend durante la demo
  (`fastapi.middleware.cors.CORSMiddleware`).
- Errores con `HTTPException` y códigos HTTP correctos (404 no encontrado,
  422 validación, etc.). Nunca filtres trazas internas en la respuesta.
- `snake_case` para funciones y variables, `PascalCase` para clases.
- Type hints obligatorios en firmas públicas.
- Comando de arranque de referencia:
  `uvicorn backend.main:app --reload --port 8000`.

## 4. Convenciones de frontend (JavaScript)

- Un único `app.js` para la demo; funciones pequeñas y nombradas por acción
  (`loadItems`, `createItem`, `renderList`).
- Usa `fetch` con `async/await` y maneja siempre el caso de error
  (`if (!res.ok) ...`).
- Centraliza la URL base de la API en una constante (`const API = "http://localhost:8000/api/v1"`).
- Manipulación del DOM directa y legible; sin dependencias externas salvo que
  se solicite.
- Accesibilidad mínima: etiquetas `label` asociadas a inputs, texto alternativo
  en imágenes, foco visible.

## 5. Calidad y verificación

- Tras implementar, **verifica que el backend arranca** y que al menos un
  endpoint responde (`curl` o el propio frontend).
- No introduzcas dependencias no fijadas ni paquetes con nombres sospechosos.
- Mantén secretos fuera del código: usa variables de entorno, nunca los
  escribas en archivos versionados.

## 6. Documentación posterior

Cuando la implementación esté lista, documenta el proyecto con las skills del
equipo:

- La skill de **diagramas** genera/actualiza los `.mmd` y sus `.png` siguiendo
  `CONTRIBUTING.md`.
- La skill de **SAD** genera/actualiza `SAD.md` incrustando esas imágenes.
