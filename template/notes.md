---
title: "Notes"
subtitle : "Example document. This is a template for a markdown document."
author: [Martijn Pepping]
date  : 2024/02
tags  : [Documentation, Example, Stuff, Martijn, Pepping]
header-includes:
 - |
  \directlua{luaotfload.add_fallback
     ("emojifallback",
      {
        "Twemoji Mozilla:mode=harf;script=DFLT;"
      }
     )}
---
`\renewcommand{\familydefault}{\sfdefault}`{=latex}
`\setmainfont{sourcesanspro}[RawFeature={fallback=emojifallback}]`{=latex}
`\setsansfont{sourcesanspro}[RawFeature={fallback=emojifallback}]`{=latex}
`\setmonofont{sourcecodepro}[RawFeature={fallback=emojifallback}]`{=latex}

<!-- markdownlint-disable MD024 MD025 MD033 -->

# Notes

Example document. This is a template for a markdown document.

## Section

Pandoc is a Haskell library for converting from one markup format to another, and a command-line tool that uses this library. It can read markdown and (subsets of) reStructuredText, HTML, and LaTeX, and it can write markdown, reStructuredText, HTML, LaTeX, ConTeXt, PDF, RTF, DocBook XML, OpenDocument XML, ODT, GNU Texinfo, MediaWiki markup

# Formatting

All Markdown elements are supported, and the document can be styled using CSS or nested HTML elements.

## Including images

Images can be included in the document via `![Alt text](path/to/image.png)`.

For example: `![Pandoc logo](./assets/pandoc.png)`.

![Pandoc logo](./assets/pandoc.png)

## Code

Code highlighting.

```python
print("Hello World")
```

## Lists

Numbered list:

1. Foo
1. Bar
1. Baz

Bulleted list:

* Foo
* Bar
* Baz

Nested list:

1. Item 1
   * Subitem 1.1
   * Subitem 1.2
1. Item 2
   * Subitem 2.1
     * Subitem 2.1.1
   * Subitem 2.2
1. Item 3

## Emoji

Emoji and Unicode characters support 🌟 💫 ✨ ✅ 🔌 ✨ 🔑 ℹ 🔀

```text
Emoji support in code blocks 🌟 💫 ✨ ✅ 🔌 ✨ 🔑 ℹ 🔀
```

## Quoted text

Text can be quoted using `>`.

> Quoted text

## Tables

| Header 1 | Header 2 | Header 3 |
|----------|----------|----------|
| Cell 1   | Cell 2   | Cell 3   |
| Cell 4   | Cell 5   | Cell 6   |

## Math

Inline math: $x^2 + y^2 = z^2$

\newpage

# New page

Use `\newpage` to start a new page.
