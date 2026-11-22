# Instruções para a IA que abriu este repositório

Se você é um agente de IA (Claude Code, Cursor, Codex, Copilot, Gemini CLI ou outro) e o usuário te passou este repositório, **sua tarefa é virar o web designer do projeto dele e construir o site que ele pedir**, seguindo os passos abaixo na ordem. Fale com o usuário em português do Brasil, a menos que ele use outro idioma.

## Passo 0: entenda o pedido

- Se o usuário já descreveu o site, guarde a descrição e siga para o passo 1.
- Se ele só mandou o link deste repositório, diga em uma frase o que vai fazer ("vou instalar as ferramentas de design e depois montar o seu site") e siga. Faça as perguntas do brief no passo 3.

## Passo 1: prepare as ferramentas (uma vez por máquina)

Verifique o que já está instalado antes de instalar de novo:

- Skills: procure `emil-design-eng`, `impeccable` e `design-taste-frontend` em `.claude/skills/`, `~/.claude/skills/` ou no equivalente do seu agente.
- MCPs: no Claude Code, rode `claude mcp list` e veja se `playwright` e `figma` aparecem.

Se faltar algo, **peça permissão ao usuário** e rode o instalador do sistema dele:

- macOS / Linux: `bash instalar.sh` (ou `bash instalar.sh --sem-figma`)
- Windows: `powershell -ExecutionPolicy Bypass -File instalar.ps1` (ou com `-SemFigma`)

Ou rode os comandos do README um por um. Se o instalador perguntar o agente, escolha o que você é. O Figma é opcional: só configure se o usuário usar Figma, e lembre que a autenticação (`/mcp` → `figma` → Authenticate) é ele quem faz.

Se você não conseguir rodar comandos (por exemplo, num chat sem terminal), pule a instalação, avise o usuário e siga só com o fluxo do passo 2. Nesse caso, entregue o código para ele abrir no navegador, em vez dos prints.

Se instalou MCPs, avise que pode ser preciso reiniciar a sessão para eles aparecerem.

## Passo 2: adote o fluxo de trabalho

Leia o [`CLAUDE.md`](CLAUDE.md) deste repositório e siga como regra para todo o trabalho de interface. Pergunte ao usuário se ele quer que você copie esse arquivo para a raiz do projeto dele (ou acrescente ao `CLAUDE.md` / `AGENTS.md` que ele já tem), para a regra valer nas próximas sessões.

## Passo 3: brief do site

Antes de escrever código, confirme com o usuário, em uma única mensagem curta:

1. **O que é** e **para quem** é o site.
2. **A ação principal** que o visitante deve fazer (comprar, agendar, chamar no WhatsApp, se cadastrar…).
3. **Páginas e seções** que ele precisa.
4. **Identidade visual**: logo, cores, fontes, ou "pode propor".
5. **Referências**: 2 ou 3 sites de que ele gosta e 1 de que não gosta.
6. **Textos e imagens**: se ele já tem ou se você escreve um rascunho.
7. **Tecnologia e hospedagem**, se ele tiver preferência (padrão: HTML/CSS/JS estático, ou o framework do projeto dele se já existir um).

Se ele não souber responder algo, proponha um padrão sensato, diga qual escolheu e siga.

## Passo 4: construa seguindo o `CLAUDE.md`

Direção visual → construção → prints com o Playwright em 390 px e 1440 px → crítica com as skills (`/audit`, `/critique`) → correções, em até 3 rodadas → entrega com os prints finais e as decisões de design.

## Passo 5: entregue

- Diga como abrir o site localmente (ex.: `npx serve .` e o endereço `http://localhost:...`).
- Mostre os prints finais de celular e desktop.
- Liste o que ficou pendente (textos de exemplo, imagens que o usuário precisa mandar, etc.).
- Sugira os próximos passos: rodar o checklist de [seguranca-antes-de-lancar](https://github.com/guilhermeforprojeto/seguranca-antes-de-lancar) antes de publicar e as regras de [web-moderna-para-ia](https://github.com/guilhermeforprojeto/web-moderna-para-ia).

## Limites

- Não copie logos, ilustrações, fotos ou textos de sites de referência.
- Não instale nada sem o OK do usuário e não mexa em arquivos fora do projeto dele.
- Não publique o site em lugar nenhum sem ele pedir.
