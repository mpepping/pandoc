#!/bin/bash

filename=${1}

pandoc ${filename}.md -f markdown -o ${filename}.pdf \
--template ./eisvogel.tex \
--listings \
--number-sections \
--pdf-engine=lualatex \
--toc -F mermaid-filter \
--variable toc-own-page=true \
--variable titlepage=true \
--variable caption-justification=centering \
--variable titlepage-color=4466aa \
--variable titlepage-rule-color=ffffff \
--variable titlepage-text-color=ffffff
