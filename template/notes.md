---
title: "Notes"
subtitle: "Example document. This is a template for a markdown document."
author: [Martijn Pepping]
date: 2024/02
tags: [Documentation, Example, Stuff, Martijn, Pepping]
lang: "en"
colorlinks: true
mainfont: "sourcesanspro"
sansfont: "sourcesanspro"
monofont: "sourcecodepro"
mainfontfallback:
  - "Twemoji Mozilla:mode=harf"
sansfontfallback:
  - "Twemoji Mozilla:mode=harf"
monofontfallback:
  - "Twemoji Mozilla:mode=harf"
---

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

- Foo
- Bar
- Baz

Nested list:

1. Item 1
   - Subitem 1.1
   - Subitem 1.2
1. Item 2
   - Subitem 2.1
     - Subitem 2.1.1
   - Subitem 2.2
1. Item 3

## Emoji

Emoji and Unicode characters support 🌟 💫 ✨ ✅ 🔌 ✨ 🔑 ℹ 🔀

```text
Emoji support in code blocks 🌟 💫 ✨ ✅ 🔌 ✨ 🔑 ℹ 🔀
```

## GitHub Alerts

[GitHub-style Markdown alerts] are supported with the [pandoc extension `alerts`](https://pandoc.org/MANUAL.html#extension-alerts).
Please note that the resulting alerts are unstyled.

To create alerts that look similar to GitHub’s, you can use the included Lua filter `alerts.lua`. Simply pass it to your pandoc command with `--lua-filter="alerts.lua"`. The necessary LaTeX packages and commands will be automatically included in your document.

### Simple Alerts

The alerts in this section contain only plain text content.

> [!NOTE]
> Useful information that users should know, even when skimming content.

> [!TIP]
> Helpful advice for doing things better or more easily.

> [!IMPORTANT]
> Key information users need to know to achieve their goal.

> [!WARNING]
> Urgent info that needs immediate user attention to avoid problems.

> [!CAUTION]
> Advises about risks or negative outcomes of certain actions.

### Markdown Inside Alerts

The following alerts use Markdown formatting within their content.

> [!NOTE]
> Lorem ipsum **dolor** sit amet, `consectetur adipiscing` elit.
>
> ```
> if(args.length < 2) {
> 	System.out.println("Lorem ipsum dolor sit amet");
> }
> ```

> [!TIP]
> Lorem ipsum **dolor** sit amet, `consectetur adipiscing` elit.
>
> ```
> if(args.length < 2) {
> 	System.out.println("Lorem ipsum dolor sit amet");
> }
> ```

> [!IMPORTANT]
> Lorem ipsum **dolor** sit amet, `consectetur adipiscing` elit.
>
> ```
> if(args.length < 2) {
> 	System.out.println("Lorem ipsum dolor sit amet");
> }
> ```

> [!WARNING]
> Lorem ipsum **dolor** sit amet, `consectetur adipiscing` elit.
>
> ```
> if(args.length < 2) {
> 	System.out.println("Lorem ipsum dolor sit amet");
> }
> ```

> [!CAUTION]
> Lorem ipsum **dolor** sit amet, `consectetur adipiscing` elit.
>
> ```
> if(args.length < 2) {
> 	System.out.println("Lorem ipsum dolor sit amet");
> }
> ```

[GitHub-style Markdown alerts]: https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax#alerts

## Quoted text

Text can be quoted using `>`.

> Quoted text

## Tables

| Header 1 | Header 2 | Header 3 |
| -------- | -------- | -------- |
| Cell 1   | Cell 2   | Cell 3   |
| Cell 4   | Cell 5   | Cell 6   |

## Math

Inline math: $x^2 + y^2 = z^2$

\newpage

# New page

Use `\newpage` to start a new page.
