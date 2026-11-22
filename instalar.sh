#!/usr/bin/env bash
# Transforma o Claude Code em web designer: 3 skills de design + Playwright MCP + Figma MCP.
# Requisitos: Node.js 18+ e Claude Code (comando `claude`) instalados.
# Uso: bash instalar.sh            (instala tudo)
#      bash instalar.sh --sem-figma
set -euo pipefail

SEM_FIGMA=false
[[ "${1:-}" == "--sem-figma" ]] && SEM_FIGMA=true

command -v node >/dev/null || { echo "❌ Node.js não encontrado. Instale a versão 18 ou mais nova."; exit 1; }
command -v claude >/dev/null || { echo "❌ Claude Code não encontrado. Instale antes de continuar."; exit 1; }

echo "1/3  Skills de design"
npx -y skills add emilkowalski/skill
npx -y skills add pbakaus/impeccable
npx -y skills add https://github.com/Leonxlnx/taste-skill --skill design-taste-frontend

echo "2/3  Playwright MCP (o Claude vê o site que fez)"
claude mcp add --scope user playwright -- npx @playwright/mcp@latest || echo "   (pode já estar instalado)"

if [[ "$SEM_FIGMA" == false ]]; then
  echo "3/3  Figma MCP (o Claude lê e manda designs para o Figma)"
  claude mcp add --scope user --transport http figma https://mcp.figma.com/mcp || echo "   (pode já estar instalado)"
  echo "     Abra o Claude Code, digite /mcp, escolha figma e clique em Authenticate."
else
  echo "3/3  Figma MCP pulado"
fi

echo
echo "✅ Pronto. Copie o CLAUDE.md deste repositório para a raiz do seu projeto e abra o Claude Code."
