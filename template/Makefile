# vim:ft=make:

OS_NAME := $(shell uname -s | tr A-Z a-z)
MD_NAME ?= notes

# Auto-detect container runtime
CONTAINER_RUNTIME := $(shell which docker 2>/dev/null || which podman 2>/dev/null || echo "")

ifeq ($(CONTAINER_RUNTIME),)
$(error Neither docker nor podman found in PATH)
endif

.DEFAULT_GOAL := all
.PHONY: help

help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-z0-9A-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

all: pdf clean open ## Create PDF clean and open

pdf: ## Create PDF file from markdown using pandoc
	@echo "Creating PDF .."
	@$(CONTAINER_RUNTIME) run -i --rm -v ${PWD}:/workdir:z -w /workdir --name pandoc-container --entrypoint /bin/bash ghcr.io/mpepping/pandoc ./run-pandoc.sh $(MD_NAME)

markdown2pdf: ## Convert markdown to PDF using pandoc
	@echo "Converting markdown to PDF .."
	@$(CONTAINER_RUNTIME) run -i --rm -v ${PWD}:/workdir:z -w /workdir --name pandoc-container --entrypoint /bin/bash ghcr.io/mpepping/pandoc ./markdown2pdf.sh $(MD_NAME)

clean: ## Clean auxiliary files
	@rm -rf notes*.log notes*.aux notes*.out notes*.tex *.err
	@echo done ..

open: ## Open PDF with the default viewer
	@echo "Opening PDF .."
ifeq ($(OS_NAME),linux)
	@gio open $(MD_NAME).pdf
else
	@open $(MD_NAME).pdf
endif

os: ## Show OS name
	@echo $(OS_NAME)

runtime: ## Show detected container runtime
	@echo "Using container runtime: $(CONTAINER_RUNTIME)"

