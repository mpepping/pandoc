#!/bin/bash

filename=${1}

pandoc ${filename}.md -f markdown -o ${filename}.pdf --pdf-engine=lualatex -V geometry:a4paper
