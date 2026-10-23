# Documento de Arquitectura de Software (SAD) — <Nombre del proyecto>

> Plantilla. Reemplaza los marcadores `<...>` con la información real del
> proyecto y las rutas reales de los diagramas en `diagrams/`.

- **Versión:** <x.y.z>
- **Fecha:** <AAAA-MM-DD>
- **Autor(es):** <nombre>
- **Estado:** <borrador | revisado | aprobado>

## 1. Introducción y propósito

<Descripción breve del sistema, a quién sirve y qué problema resuelve.>

## 2. Alcance

<Qué incluye y qué queda fuera de esta versión.>

## 3. Stack tecnológico

| Capa     | Tecnología            | Versión | Notas |
| -------- | --------------------- | ------- | ----- |
| Backend  | Python / FastAPI      | <x>     | <...> |
| Frontend | JavaScript (vanilla)  | ES2020+ | <...> |
| Datos    | <en memoria / DB>     | <x>     | <...> |

<Si se usó Context7 MCP, indica qué versiones y APIs se confirmaron con él.>

## 4. Vista de contexto / contenedores

<Descripción de los contenedores: frontend, API y almacén de datos, y cómo se
comunican.>

![Vista de contenedores del sistema](diagrams/arquitectura-contenedores-es.png)

## 5. Flujos principales

<Describe los flujos clave. Incrusta los diagramas de secuencia.>

![Secuencia: crear una tarea](diagrams/secuencia-crear-tarea-es.png)

## 6. Modelo de datos

<Entidades principales y sus relaciones.>

![Modelo de datos](diagrams/modelo-datos-es.png)

## 7. Endpoints de la API

| Método | Ruta                     | Descripción            |
| ------ | ------------------------ | ---------------------- |
| GET    | `/api/v1/tasks`          | Listar tareas          |
| POST   | `/api/v1/tasks`          | Crear tarea            |
| PATCH  | `/api/v1/tasks/{id}`     | Marcar/desmarcar       |
| DELETE | `/api/v1/tasks/{id}`     | Eliminar tarea         |

## 8. Decisiones de arquitectura (ADR resumidas)

- **<Decisión 1>:** <contexto → decisión → consecuencia.>
- **<Decisión 2>:** <...>

## 9. Calidad, riesgos y pendientes

- **Seguridad:** <CORS, validación, manejo de errores.>
- **Riesgos:** <...>
- **Trabajo futuro:** <persistencia, autenticación, tests, etc.>

## 10. Referencias

- `CONTRIBUTING.md` — guía de diagramas.
- Steering `fullstack-py-js-standards`.
