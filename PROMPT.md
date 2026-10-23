# PROMPT para modo Spec — Demo "Lista de tareas" (back Python + front JS)

> Copia el contenido de este archivo como prompt inicial de una **sesión Spec**
> de Kiro. El flujo Spec generará *requirements → design → tasks* y después
> implementará. El steering global `fullstack-py-js-standards` aplica
> automáticamente a esta implementación.

---

## Objetivo

Construye una aplicación mínima de **lista de tareas (to-do)** con:

- **Backend en Python (FastAPI):** una API REST que gestione tareas en memoria.
- **Frontend en JavaScript vanilla:** una página que consuma la API con `fetch`.

El propósito es demostrar un ciclo completo *diseño → implementación →
documentación* de Kiro, así que mantén el alcance pequeño pero completo y
funcional.

## Requisitos funcionales

1. **Listar tareas** — `GET /api/v1/tasks` devuelve todas las tareas.
2. **Crear tarea** — `POST /api/v1/tasks` con `{ "title": "..." }` crea una
   tarea con `id`, `title` y `done: false`.
3. **Marcar/desmarcar completada** — `PATCH /api/v1/tasks/{id}` con
   `{ "done": true|false }`.
4. **Eliminar tarea** — `DELETE /api/v1/tasks/{id}`.
5. **Frontend** que muestre la lista, permita crear, marcar y borrar tareas,
   con manejo visible de errores y estado de carga.

## Requisitos técnicos

- Sigue el steering `fullstack-py-js-standards`: estructura `backend/` +
  `frontend/`, routers por recurso, modelos Pydantic de entrada/salida, prefijo
  `/api/v1`, CORS habilitado para el frontend.
- Almacenamiento **en memoria** (un diccionario o lista); sin base de datos.
- `backend/requirements.txt` con versiones fijadas.
- Frontend sin framework ni build step: `index.html`, `app.js`, `styles.css`.
- `README.md` con los comandos para arrancar backend y frontend.

## Uso de Context7 MCP (recopilación de información del stack)

Durante la fase de **diseño**, usa el **Context7 MCP** para recopilar
información actualizada del stack antes de fijar decisiones:

- Resuelve e inspecciona la documentación de **FastAPI** (routers, modelos de
  respuesta, middleware CORS) y **Pydantic v2** (modelos, validación).
- Si Context7 no está configurado o disponible, **indícamelo y pídeme
  autorización** para continuar sin él usando tu conocimiento base.
- Refleja en el documento de *design* qué confirmaste con Context7 (versiones,
  firmas de API) y qué asumiste.

## Criterios de aceptación

- El backend arranca con `uvicorn backend.main:app --reload --port 8000` y los
  cuatro endpoints responden correctamente.
- El frontend, servido de forma estática, lista/crea/marca/borra tareas contra
  la API sin errores de CORS.
- La estructura de carpetas coincide con el steering.
- Hay un `README.md` con instrucciones de arranque reproducibles.

## Después de implementar (documentación)

Cuando la implementación esté completa y verificada, **no** documentes a mano:
activa las skills del equipo para mostrar cómo Kiro documenta el proyecto.

1. Activa la skill **`generate-diagrams`** para crear/actualizar en `diagrams/`:
   - un diagrama de **arquitectura/contenedores** (frontend ↔ API ↔ almacén en
     memoria),
   - un diagrama de **secuencia** del flujo "crear tarea",
   - un **modelo de datos** (entidad Tarea).
   Genera cada `.mmd` y su `.png` siguiendo `CONTRIBUTING.md`.
2. Activa la skill **`generate-sad`** para crear/actualizar `SAD.md`
   incrustando las imágenes anteriores.
