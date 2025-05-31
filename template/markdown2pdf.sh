#!/bin/bash

filename=${1}

pandoc ${filename}.md -f markdown -o ${filename}.pdf \
--pdf-engine=lualatex -V geometry:a4paper \
--template ./eisvogel.tex \
--number-sections \
--variable caption-justification=centering \
-V mainfont="sourcesanspro" \
-V sansfont="sourcesanspro" \
-V monofont="sourcecodepro" \
-V emoji-font="Noto Color Emoji"
