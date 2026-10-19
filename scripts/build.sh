#!/usr/bin/env bash
# Uso: ./scripts/build.sh Apellido Nombre   (requiere pandoc y chromium/chrome/edge; CHROME=ruta para forzar)
set -euo pipefail
cd "$(dirname "$0")/.."
A="${1:?Apellido}"; N="${2:?Nombre}"
CH="${CHROME:-$(command -v google-chrome chromium chromium-browser microsoft-edge 2>/dev/null | head -1)}"
[ -n "$CH" ] || { echo "No encontré un navegador Chromium"; exit 1; }
mkdir -p entrega
build(){ name="$1"; shift
  pandoc "$@" -f gfm -t html5 -s --metadata title="$name" --css scripts/estilo.css --embed-resources --resource-path=. -o "entrega/$name.html"
  "$CH" --headless --no-sandbox --disable-gpu --no-pdf-header-footer --print-to-pdf="$PWD/entrega/$name.pdf" "file://$PWD/entrega/$name.html" >/dev/null 2>&1
  rm "entrega/$name.html"; echo "OK -> entrega/$name.pdf"; }
P="${A}_${N}_C02"
build "${P}_Fundamentos" 06_fundamentos/fundamentos.md 02_esquema_relacional/esquema.md 05_practica_autonoma/autonoma.md 01_laboratorio/evidencia.md
build "${P}_Matriz_Requisitos" 03_requisitos/R01_R10.md 04_patrones_acceso/PA01_PA10.md
