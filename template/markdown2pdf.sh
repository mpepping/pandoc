#!/bin/bash

filename=${1}

pandoc ${filename}.md -f markdown -o ${filename}.pdf \
  --data-dir=. \
  --pdf-engine=lualatex -V geometry:a4paper \
  --template eisvogel.tex \
  --number-sections \
  --variable caption-justification=centering \
  --lua-filter=templates/alerts.lua \
  -V mainfont="sourcesanspro" \
  -V sansfont="sourcesanspro" \
  -V monofont="sourcecodepro" \
  -V emoji-font="Noto Color Emoji"
