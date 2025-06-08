# vim:ft=make:
APP_NAME=ghcr.io/mpepping/pandoc

# Auto-detect container runtime
CONTAINER_RUNTIME := $(shell which docker 2>/dev/null || which podman 2>/dev/null || echo "")

ifeq ($(CONTAINER_RUNTIME),)
$(error Neither docker nor podman found in PATH)
endif

.PHONY: help
help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

build: ## Build the image
	$(CONTAINER_RUNTIME) build -t $(APP_NAME):latest .

push: ## Push the image
	$(CONTAINER_RUNTIME) push $(APP_NAME):latest

pull: ## Pull the latest image from the registry
	$(CONTAINER_RUNTIME) pull $(APP_NAME):latest

clean: ## Remove the image
	$(CONTAINER_RUNTIME) rmi $(APP_NAME):latest

start: ## Start the container
	$(CONTAINER_RUNTIME) run -it --rm --name pandoc --entrypoint bash $(APP_NAME):latest

stop: ## Stop the container
	$(CONTAINER_RUNTIME) rm -f pandoc

runtime: ## Show detected container runtime
	@echo "Using container runtime: $(CONTAINER_RUNTIME)"

