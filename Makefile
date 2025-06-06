# vim:ft=make:
APP_NAME=ghcr.io/mpepping/pandoc

.PHONY: help
help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

build: ## Build the image
	docker build -t $(APP_NAME):latest .

push: ## Push the image
	docker push $(APP_NAME):latest

clean: ## Remove the image
	docker rmi $(APP_NAME):latest

start: ## Start the container
	docker run -it --rm --name pandoc --entrypoint bash $(APP_NAME):latest

stop: ## Stop the container
	docker rm -f pandoc
