# Clase 02 NoSQL – Paso a paso con Git

**Idea central:** todo el trabajo vive en archivos Markdown dentro de este repositorio. Cada práctica termina con un commit, y al final se generan los dos PDF de entrega desde esos mismos archivos. Los comandos son para **PowerShell** (Windows).

**Regla de oro de la guía:** no mezcles entornos. Antes de escribir un comando, identifica dónde estás (`PS C:\...>` = PowerShell, `sena_skilltrack>` = mongosh) y escribe tu predicción antes de pulsar Enter.

## Fase 0 – Preparación (una sola vez, ~10 min)

1. Instala las herramientas y comprueba versiones:

```powershell
winget install Git.Git
winget install JohnMacFarlane.Pandoc
git --version
pandoc --version
```

2. Identifícate en Git (con tu nombre real, porque queda en los commits):

```powershell
git config --global user.name "Tu Nombre"
git config --global user.email "tu_correo@ejemplo.com"
```

3. Descomprime `sena-nosql-c02.zip` en `C:\SENA-NoSQL\` y entra a la carpeta. El repositorio ya viene inicializado con un primer commit:

```powershell
cd C:\SENA-NoSQL\sena-nosql-c02
git status
git log --oneline
```

4. (Opcional pero recomendado) Respaldo remoto: crea un repositorio **privado** vacío en GitHub y conéctalo.

```powershell
git remote add origin https://github.com/TU_USUARIO/sena-nosql-c02.git
git push -u origin main
```

5. Confirma que tienes el recurso técnico de la clase (no lo renombres ni lo borres):
`C:\SENA-NoSQL\Recursos_Tecnicos\C02_matriz_canonica_requisitos_patrones.csv`

**Convención de commits:** un commit por paso o práctica, mensaje corto y claro: `evidencia(P1): ...`, `docs(P3): ...`. Haz `git status` antes de cada commit para ver qué estás guardando.

## Fase 1 – Práctica 1: comprobar el laboratorio heredado

**Dónde:** PowerShell. **Archivo a completar:** `01_laboratorio\evidencia.md`.

1. Abre `01_laboratorio\evidencia.md` y escribe, para cada paso, qué hace el comando y tu **predicción**.
2. Ejecuta cada comando por separado y guarda la salida como texto (así queda versionada en Git y la ves en pantalla):

```powershell
docker start nosql-mongo
docker ps | Out-File -Encoding utf8 01_laboratorio\salida_paso2_docker_ps.txt; Get-Content 01_laboratorio\salida_paso2_docker_ps.txt

mongosh "mongodb://127.0.0.1:27017/sena_skilltrack" --eval "db.aprendices.findOne({_id:'APR-001'})" | Out-File -Encoding utf8 01_laboratorio\salida_paso3_mongosh.txt; Get-Content 01_laboratorio\salida_paso3_mongosh.txt
```

3. Resultado esperado: `nosql-mongo` aparece **Up** y `mongosh` devuelve **APR-001** (Ana Torres, ficha 3410947, activo true, tecnologías JavaScript y Git).
4. Si prefieres captura de pantalla, guárdala en `capturas\` (por ejemplo `p1_paso2.png`) y enlázala en el .md con `![docker ps](capturas/p1_paso2.png)`. Debajo de cada captura o salida escribe: qué hiciste, qué obtuviste y qué demuestra.
5. Si no coincide: si el contenedor ya estaba iniciado, sigue con `docker ps`; si no aparece `Up`, revisa Docker Desktop; si APR-001 no está, recupera la Clase 1 antes de continuar. **No avances por inercia.**
6. Guarda el avance:

```powershell
git add 01_laboratorio
git commit -m "evidencia(P1): laboratorio heredado verificado, APR-001 presente"
```

## Fase 2 – Práctica 2: el caso como tablas (PK, FK, N:M)

**Dónde:** el documento `02_esquema_relacional\esquema.md` (no se instala ningún motor SQL).

1. Completa `APRENDIZ(aprendiz_id PK, nombre, ficha, activo)` con 3–4 filas de ejemplo.
2. Completa `PROYECTO(proyecto_id PK, nombre, estado)`.
3. Completa `APRENDIZ_PROYECTO(aprendiz_id FK, proyecto_id FK, rol, fecha_inicio)`.
4. Escribe por qué la tabla intermedia representa una relación **N:M** (un aprendiz en varios proyectos y un proyecto con varios aprendices).
5. Describe qué reuniría un **JOIN** para responder «¿qué proyectos tiene Ana?» (qué tablas, qué columna las une, qué filas se combinan).
6. Resultado esperado: tu esquema diferencia **identidad (PK)**, **referencia (FK)** y **relación N:M**.

```powershell
git add 02_esquema_relacional
git commit -m "docs(P2): esquema APRENDIZ-PROYECTO con PK/FK y explicacion N:M y JOIN"
```

## Fase 3 – Práctica 3: catálogo oficial R01–R10

**Archivo:** `03_requisitos\R01_R10.md`.

1. La tabla oficial R01–R10 ya está copiada tal como aparece en la clase. **No la modifiques.** Compárala con el CSV de `Recursos_Tecnicos` para confirmar que coincide.
2. Completa la tabla «Mi lectura de cada requisito»: qué debe hacer el sistema, qué dato busca o guarda y si lee o escribe.
3. Todavía **no** escojas MongoDB, Redis, Neo4j ni Cassandra.

```powershell
git add 03_requisitos
git commit -m "docs(P3): catalogo R01-R10 y lectura de cada requisito"
```

## Fase 4 – Práctica 4: de R01–R10 a PA01–PA10

**Archivo:** `04_patrones_acceso\PA01_PA10.md`.

1. La matriz oficial PA01–PA10 ya está incluida (operación, filtro/clave, orden, frecuencia, volumen, consistencia, destino). **Conserva códigos y redacción.**
2. Elige **tres** transformaciones (por ejemplo R02→PA02, R07→PA07 y R10→PA10) y complétalas con tus palabras en las plantillas: por qué esa operación, ese filtro, ese orden, y por qué frecuencia y volumen importan.
3. Esta matriz es la entrada de la Clase 3: no la borres.

```powershell
git add 04_patrones_acceso
git commit -m "docs(P4): matriz PA01-PA10 y tres transformaciones explicadas"
```

## Fase 5 – Práctica autónoma (sin solución copiada)

**Archivo:** `05_practica_autonoma\autonoma.md`. Cada ejercicio con predicción, resultado e interpretación.

1. Un requisito cotidiano distinto de SkillTrack convertido en patrón de acceso completo (operación, filtro, orden, frecuencia, volumen, consistencia).
2. Una tabla de 4 filas con su PK marcada, más una segunda tabla que muestre una FK y su explicación.
3. 6–8 líneas explicando por qué «NoSQL reemplaza SQL» es incorrecto.

```powershell
git add 05_practica_autonoma
git commit -m "docs(autonoma): requisito cotidiano, tablas PK/FK y SQL vs NoSQL"
```

## Fase 6 – Conceptos desde cero y comparación SQL/NoSQL

**Archivo:** `06_fundamentos\fundamentos.md`. Responde las 21 preguntas de comprensión con tus palabras (la guía advierte: no copies la definición) y escribe la comparación SQL/NoSQL evitando simplificaciones.

```powershell
git add 06_fundamentos
git commit -m "docs(fundamentos): conceptos 1-7 y comparacion SQL/NoSQL"
```

Para preparar la sustentación usa `07_sustentacion\preparacion.md`.

## Fase 7 – Generar los PDF de entrega

1. Genera los dos archivos con el script (usa tu apellido y nombre reales, sin espacios; por ejemplo `Garcia` `Juan`):

```powershell
.\scripts\build.ps1 -Apellido Garcia -Nombre Juan
```

   Si PowerShell bloquea el script: `powershell -ExecutionPolicy Bypass -File .\scripts\build.ps1 -Apellido Garcia -Nombre Juan`.

2. Verifica que existan en `entrega\`:
   - `Garcia_Juan_C02_Fundamentos.pdf` → conceptos, esquema relacional, SQL/NoSQL, práctica autónoma y evidencia del laboratorio.
   - `Garcia_Juan_C02_Matriz_Requisitos.pdf` → R01–R10, PA01–PA10 y tres transformaciones.
3. **Ábrelos y revísalos:** que no queden plantillas vacías, que las capturas se vean y que debajo de cada captura/salida diga qué hiciste, qué obtuviste y qué demuestra.
4. Alternativa si falla el script: `pandoc archivo.md -o salida.docx`, ábrelo en Word y exporta a PDF.
5. Confirma con tu instructor si el laboratorio (`01_laboratorio`) debe ir dentro del PDF de Fundamentos o aparte.

```powershell
git add entrega
git commit -m "entrega(C02): PDF Fundamentos y Matriz_Requisitos"
git tag c02-entrega
git push origin main --tags   # solo si configuraste el remoto
```

4. Sube los dos PDF a **TACA Class** con exactamente esos nombres.

## Fase 8 – Lista de salida

- [ ] El resultado esperado de cada práctica coincide con lo obtenido.
- [ ] Puedo explicar qué significa cada resultado.
- [ ] Puedo decir en qué entorno se ejecutó cada instrucción (PowerShell, mongosh, documento).
- [ ] Los dos PDF tienen el nombre solicitado y están subidos.
- [ ] El laboratorio de la Clase 1 sigue intacto (`nosql-mongo`, `sena_mongo_data`, `sena_skilltrack`, `aprendices`, APR-001).
- [ ] R01–R10 y PA01–PA10 están guardados en Git (`git log --oneline` muestra los commits).
- [ ] Practiqué la sustentación sin leer.

## Referencia rápida de Git

| Necesito... | Comando |
|---|---|
| Ver qué cambió | `git status` / `git diff` |
| Guardar un paso | `git add carpeta` y `git commit -m "mensaje"` |
| Ver el historial | `git log --oneline` |
| Deshacer cambios sin guardar de un archivo | `git restore ruta\archivo` |
| Volver a ver una versión anterior | `git show COMMIT:ruta/archivo` |
| Respaldar en GitHub | `git push` |
