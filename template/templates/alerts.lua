-- Inject LaTeX preamble content
function Meta(meta)
  local latex_preamble = [[
\usepackage{tcolorbox}

\definecolor{note-border}{HTML}{0969da}
\definecolor{tip-border}{HTML}{1a7f37}
\definecolor{important-border}{HTML}{8250df}
\definecolor{warning-border}{HTML}{9a6700}
\definecolor{caution-border}{HTML}{cf222e}

\newtcolorbox{note-box}{colback=note-border!4!white,arc=0pt,outer arc=0pt,colframe=note-border,fonttitle=\bfseries,coltitle=note-border,attach title to upper,adjusted title={Note}}
\newtcolorbox{tip-box}{colback=tip-border!4!white,arc=0pt,outer arc=0pt,colframe=tip-border,fonttitle=\bfseries,coltitle=tip-border,attach title to upper,adjusted title={Tip}}
\newtcolorbox{important-box}{colback=important-border!4!white,arc=0pt,outer arc=0pt,colframe=important-border,fonttitle=\bfseries,coltitle=important-border,attach title to upper,adjusted title={Important}}
\newtcolorbox{warning-box}{colback=warning-border!4!white,arc=0pt,outer arc=0pt,colframe=warning-border,fonttitle=\bfseries,coltitle=warning-border,attach title to upper,adjusted title={Warning}}
\newtcolorbox{caution-box}{colback=caution-border!4!white,arc=0pt,outer arc=0pt,colframe=caution-border,fonttitle=\bfseries,coltitle=caution-border,attach title to upper,adjusted title={Caution}}
]]

  local raw = pandoc.RawBlock("latex", latex_preamble)

  -- Ensure header-includes exists and is a list
  if meta["header-includes"] == nil then
    meta["header-includes"] = pandoc.MetaList({ raw })
  else
    table.insert(meta["header-includes"], raw)
  end

  return meta
end


-- Handle GitHub-style alert blockquotes (> [!NOTE], > [!TIP], etc.)
function BlockQuote(el)
  if #el.content == 0 or el.content[1].t ~= "Para" then
    return nil
  end

  local para = el.content[1]
  local text = pandoc.utils.stringify(para)

  -- Check for GitHub alert markers
  local kind = text:match("^%[!(NOTE)%]")
    or text:match("^%[!(TIP)%]")
    or text:match("^%[!(IMPORTANT)%]")
    or text:match("^%[!(WARNING)%]")
    or text:match("^%[!(CAUTION)%]")

  if not kind then
    return nil
  end

  kind = string.lower(kind)
  local env_name = kind .. "-box"

  -- Split first paragraph: remove marker, keep content after SoftBreak/LineBreak
  local body_inlines = pandoc.List()
  local found_break = false

  for _, inline in ipairs(para.content) do
    if found_break then
      body_inlines:insert(inline)
    elseif inline.t == "SoftBreak" or inline.t == "LineBreak" then
      found_break = true
    end
  end

  -- Build body blocks
  local body_blocks = pandoc.List()

  if #body_inlines > 0 then
    body_blocks:insert(pandoc.Para(body_inlines))
  end

  -- Add remaining blocks from the blockquote
  for i = 2, #el.content do
    body_blocks:insert(el.content[i])
  end

  if #body_blocks == 0 then
    return nil
  end

  -- Wrap in tcolorbox
  local result = pandoc.List()
  result:insert(pandoc.RawBlock("latex", "\\begin{" .. env_name .. "}"))
  result:extend(body_blocks)
  result:insert(pandoc.RawBlock("latex", "\\end{" .. env_name .. "}"))

  return result
end
