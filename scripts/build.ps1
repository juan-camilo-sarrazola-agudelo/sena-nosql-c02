# Uso (desde la raíz del repo):
#   .\scripts\build.ps1 -Apellido Garcia -Nombre Juan
# Requiere: pandoc (winget install JohnMacFarlane.Pandoc) y Microsoft Edge.
param([Parameter(Mandatory)][string]$Apellido,[Parameter(Mandatory)][string]$Nombre)
$ErrorActionPreference = 'Stop'
Set-Location (Split-Path $PSScriptRoot -Parent)
New-Item -ItemType Directory -Force entrega | Out-Null
$edge = @("C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe",
          "C:\Program Files\Microsoft\Edge\Application\msedge.exe") | Where-Object { Test-Path $_ } | Select-Object -First 1
if (-not $edge) { throw "No encontré Microsoft Edge." }

function Build($nombre, $archivos) {
  $html = "entrega\$nombre.html"; $pdf = "entrega\$nombre.pdf"
  pandoc $archivos -f gfm -t html5 -s --metadata title="$nombre" --css scripts\estilo.css --embed-resources --resource-path=. -o $html
  $uri = ([System.Uri](Resolve-Path $html).Path).AbsoluteUri
  $out = Join-Path (Resolve-Path entrega).Path "$nombre.pdf"
  & $edge --headless --disable-gpu --no-pdf-header-footer "--print-to-pdf=$out" $uri | Out-Null
  Start-Sleep -Seconds 2
  if (-not (Test-Path $out)) { throw "No se generó $out" }
  Remove-Item $html
  Write-Host "OK -> $out"
}

$pre = "${Apellido}_${Nombre}_C02"
Build "${pre}_Fundamentos" @("06_fundamentos\fundamentos.md","02_esquema_relacional\esquema.md","05_practica_autonoma\autonoma.md","01_laboratorio\evidencia.md")
Build "${pre}_Matriz_Requisitos" @("03_requisitos\R01_R10.md","04_patrones_acceso\PA01_PA10.md")
