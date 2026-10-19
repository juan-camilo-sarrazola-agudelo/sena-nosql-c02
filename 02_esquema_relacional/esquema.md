# Práctica 2 – El caso SkillTrack como tablas

**Entorno:** este documento (sin motor SQL). El objetivo es entender organización, no memorizar sintaxis SQL.

## Paso 1 – APRENDIZ

| aprendiz_id (PK) | nombre | ficha | activo |
|---|---|---|---|
| APR-001 | Ana Torres | 3410947 | true |
| | | | |
| | | | |
| | | | |

## Paso 2 – PROYECTO

| proyecto_id (PK) | nombre | estado |
|---|---|---|
| | | |
| | | |

## Paso 3 – APRENDIZ_PROYECTO (tabla intermedia)

| aprendiz_id (FK) | proyecto_id (FK) | rol | fecha_inicio |
|---|---|---|---|
| | | | |
| | | | |

## Paso 4 – Relaciones y por qué la tabla intermedia representa N:M

```
APRENDIZ ──< APRENDIZ_PROYECTO >── PROYECTO
(1)            (N)        (N)          (1)
```

Revisa el diagrama y explica con tus palabras:

- Un aprendiz puede ...
- Un proyecto puede ...
- Por eso la tabla intermedia ...

## Paso 5 – ¿Qué tendría que reunir un JOIN para responder "¿qué proyectos tiene Ana?"

Describe qué tablas, qué columna las une y qué filas se combinan:

## Qué demuestra esta práctica

Distingue con un ejemplo tuyo: **identidad (PK)**, **referencia (FK)** y **relación N:M**.
