# vim:ft=make:

MD_NAME ?= notes
OS_NAME := $(shell uname -s | tr A-Z a-z)

# Auto-detect container runtime
CONTAINER_RUNTIME := $(shell which container 2>/dev/null || which docker 2>/dev/null || which podman 2>/dev/null || echo "")

ifeq ($(CONTAINER_RUNTIME),)
$(error No docker, podman or container found in PATH)
endif

# Play nice with SElinux when using podman
ifneq ($(findstring podman,$(CONTAINER_RUNTIME)),)
	VOLUME_OPTS := ':z'
endif

.DEFAULT_GOAL := help
.PHONY: help

help: ## This help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-z0-9A-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

all: pdf clean open ## Create PDF, cleanup and open the PDF (make pdf + clean + open)

pdf: ## Create PDF file from markdown using pandoc
	@echo "Creating PDF .."
	@$(CONTAINER_RUNTIME) run -i --rm -v ${PWD}:/workdir$(VOLUME_OPTS) -w /workdir --name pandoc-container --entrypoint /bin/bash ghcr.io/mpepping/pandoc ./run-pandoc.sh $(MD_NAME)

markdown2pdf: ## Create a simple PDF from a Markdown file (make [..] MD_NAME=myfile)
	@echo "Converting markdown to PDF .."
	@$(CONTAINER_RUNTIME) run -i --rm -v ${PWD}:/workdir$(VOLUME_OPTS) -w /workdir --name pandoc-container --entrypoint /bin/bash ghcr.io/mpepping/pandoc ./markdown2pdf.sh $(MD_NAME)

clean: ## Clean auxiliary files
	@rm -rf $(MD_NAME)*.log $(MD_NAME)*.aux $(MD_NAME)*.out $(MD_NAME)*.tex *.err
	@echo done ..

open: ## Open PDF with the default viewer
	@echo "Opening PDF .."
ifeq ($(OS_NAME),linux)
	@gio open $(MD_NAME).pdf
else
	@open $(MD_NAME).pdf
endif

runtime: ## Show detected container runtime and OS
	@echo "Using container runtime: $(CONTAINER_RUNTIME) on $(OS_NAME)"

