FROM fedora:41

LABEL maintainer="Martijn Pepping <martijn.pepping@automiq.nl>"
LABEL org.opencontainers.image.authors="Martijn Pepping <martijn.pepping@automiq.nl>"
LABEL org.opencontainers.image.description="Pandoc and TeX in a container for PDF generation .. YMMV"
LABEL org.opencontainers.image.source="https://github.com/mpepping/pandoc"
LABEL org.opencontainers.image.title="Pandoc"
LABEL org.opencontainers.image.url="https://github.com/mpepping/pandoc/pkgs/container/pandoc"

RUN dnf install -y \
      chromium \
      ghostscript \
      nodejs \
      pandoc \
      texlive-babel-english.noarch \
      texlive-catchfile.noarch \
      texlive-ec.noarch \
      texlive-epstopdf.noarch \
      texlive-footnotebackref.noarch \
      texlive-grfext.noarch \
      texlive-grffile.noarch \
      texlive-hardwrap.noarch \
      texlive-koma-script.noarch \
      texlive-luahbtex \
      texlive-ly1.noarch \
      texlive-mdframed.noarch \
      texlive-mdwtools.noarch \
      texlive-metafont \
      texlive-mweights.noarch \
      texlive-pagecolor.noarch \
      texlive-selnolig.noarch \
      texlive-sourcecodepro.noarch \
      texlive-sourcesanspro.noarch \
      texlive-titling.noarch \
      texlive-twemoji-colr \
      texlive-unicode-math.noarch \
      twitter-twemoji-fonts \
      texlive-zref.noarch

# Seems necessary for Node and mermaid-filter
ENV CHROME_BIN="/usr/bin/chromium-browser" \
    PUPPETEER_SKIP_CHROMIUM_DOWNLOAD="true"

RUN npm install -g mermaid-filter@1.4.6 --unsafe-perm=true

ENTRYPOINT [ "pandoc" ]
