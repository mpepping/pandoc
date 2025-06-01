# pandoc

Pet project to create PDF documents from markdown files using pandoc. See the `./template` folder for an example. Uses the Latex Eisvogel template.

See and example [PDF document](./template/notes.pdf) here.


## Usage

This projects run as a container image so you need to have Docker or Podman installed. Copy the files from the `./template` folder, update the `MD_NAME` value in the `Makefile` from `notes` to the filename matching your Markdown file:

```make, Makefile
MD_NAME = notes # Update this value to match your markdown file
```
Run `make` (or `make help`) to create a PDF from your Markdown document. The PDF will be created as `$MD_NAME.pdf`. 

Alternatively, if you don't have `make` installed, you can run `docker` (or `podman`) directly:

```bash
docker run -i --rm \
  -v ${PWD}:/workdir:z -w /workdir --entrypoint /bin/bash \
  ghcr.io/mpepping/pandoc:latest ./run-pandoc.sh $(MD_NAME)
```

## Examples

1. Run `make` to create a PDF file with TOC, titlepage and section numbering.
1. Run `make MD_NAME=myfile` to create a PDF file from `myfile.md`.
1. Run `make markdown2pdf MD_NAME=myfile` to generate a simple PDF file from `myfile.md`.
1. Run `make help` to see the available commands.
