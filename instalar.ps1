# Transforma o Claude Code em web designer: 3 skills de design + Playwright MCP + Figma MCP.
# Requisitos: Node.js 18+ e Claude Code (comando `claude`) instalados.
# Uso (PowerShell): .\instalar.ps1            (instala tudo)
#                   .\instalar.ps1 -SemFigma
param([switch]$SemFigma)
$ErrorActionPreference = "Stop"

if (-not (Get-Command node -ErrorAction SilentlyContinue))   { Write-Host "Node.js nao encontrado. Instale a versao 18 ou mais nova."; exit 1 }
if (-not (Get-Command claude -ErrorAction SilentlyContinue)) { Write-Host "Claude Code nao encontrado. Instale antes de continuar."; exit 1 }

Write-Host "1/3  Skills de design"
npx -y skills add emilkowalski/skill
npx -y skills add pbakaus/impeccable
npx -y skills add https://github.com/Leonxlnx/taste-skill --skill design-taste-frontend

Write-Host "2/3  Playwright MCP (o Claude ve o site que fez)"
claude mcp add --scope user playwright -- npx "@playwright/mcp@latest"
if ($LASTEXITCODE -ne 0) { Write-Host "   (pode ja estar instalado)" }

if (-not $SemFigma) {
  Write-Host "3/3  Figma MCP (o Claude le e manda designs para o Figma)"
  claude mcp add --scope user --transport http figma https://mcp.figma.com/mcp
  if ($LASTEXITCODE -ne 0) { Write-Host "   (pode ja estar instalado)" }
  Write-Host "     Abra o Claude Code, digite /mcp, escolha figma e clique em Authenticate."
} else {
  Write-Host "3/3  Figma MCP pulado"
}

Write-Host ""
Write-Host "Pronto. Copie o CLAUDE.md deste repositorio para a raiz do seu projeto e abra o Claude Code."
