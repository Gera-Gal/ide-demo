<#
.SYNOPSIS
    Renderiza todos los diagramas Mermaid (.mmd) de la carpeta diagrams/ a .png.

.DESCRIPTION
    Recorre diagrams/*.mmd y genera un .png con el mismo nombre base usando
    @mermaid-js/mermaid-cli (mmdc) vía npx, con fondo blanco y escala 2x.
    Sigue las convenciones de CONTRIBUTING.md.

.PARAMETER DiagramsDir
    Carpeta que contiene los .mmd. Por defecto "diagrams" relativo al cwd.

.EXAMPLE
    ./.kiro/skills/generate-diagrams/scripts/render.ps1
    ./.kiro/skills/generate-diagrams/scripts/render.ps1 -DiagramsDir docs/diagrams
#>
param(
    [string]$DiagramsDir = "diagrams"
)

$ErrorActionPreference = "Stop"

if (-not (Test-Path $DiagramsDir)) {
    Write-Error "No existe la carpeta '$DiagramsDir'. Crea los .mmd primero."
    exit 1
}

# Comprobar Node / npx
try {
    $null = (node --version)
    $null = (npx --version)
} catch {
    Write-Error "Node.js/npx no estan disponibles en PATH. Instala Node.js para renderizar los diagramas."
    exit 1
}

$mmdFiles = Get-ChildItem -Path $DiagramsDir -Filter *.mmd -File
if ($mmdFiles.Count -eq 0) {
    Write-Warning "No se encontraron archivos .mmd en '$DiagramsDir'."
    exit 0
}

foreach ($f in $mmdFiles) {
    $out = Join-Path $DiagramsDir ($f.BaseName + ".png")
    Write-Host "Renderizando $($f.Name) -> $([System.IO.Path]::GetFileName($out))"
    npx -y @mermaid-js/mermaid-cli -i $f.FullName -o $out -b white -s 2
}

Write-Host ""
Write-Host "Resultado:"
Get-ChildItem -Path $DiagramsDir -Include *.mmd, *.png -File -Recurse |
    Select-Object Name, Length, LastWriteTime |
    Format-Table -AutoSize
