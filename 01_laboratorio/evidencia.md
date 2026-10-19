# Práctica 1 – Comprobar el laboratorio heredado

**Entorno:** PowerShell de Windows (prompt `PS C:\...>`).
**Objetivo:** confirmar que la Clase 2 parte exactamente del estado de la Clase 1 (no se crea nada nuevo).

> Escribe tu **predicción ANTES** de ejecutar cada comando.

## Paso 1 – `docker start nosql-mongo`

- **Qué hace el comando:** (tus palabras)
- **Predicción:**
- **Resultado obtenido:** (pega la salida o enlaza `01_laboratorio/salida_paso1.txt`)
- **Qué demuestra:**

## Paso 2 – `docker ps`

- **Qué hace el comando:**
- **Predicción:**
- **Resultado obtenido:** (debe verse `nosql-mongo` con estado `Up` y puerto `127.0.0.1:27017`)
- **Qué demuestra:**

## Paso 3 – `mongosh ... findOne({_id:'APR-001'})`

- **Qué hace el comando:**
- **Predicción:**
- **Resultado obtenido:** (debe devolver APR-001 = Ana Torres, ficha 3410947, activo true, tecnologías [JavaScript, Git])
- **Qué demuestra:**

## Interpretación final

¿Qué confirma esta práctica sobre el contenedor, el volumen y la base `sena_skilltrack`? (3–4 líneas)

<!-- Si agregas una captura: ![descripción](capturas/p1_paso2.png) y escribe debajo qué demuestra. -->
