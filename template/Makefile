OS_NAME := $(shell uname -s | tr A-Z a-z)

all: pdf clean open

os:
	@echo $(OS_NAME)

pdf:
	@echo "Creating PDF .."
	@docker run -i --rm -v ${PWD}:/workdir:z -w /workdir --name pandoc-container --entrypoint /bin/bash ghcr.io/mpepping/pandoc ./run-pandoc.sh

clean:
	@rm -rf notes*.log notes*.aux notes*.out notes*.tex
	@echo done ..

open:
ifeq ($(OS_NAME),linux)
	@gio open notes.pdf
else
	@open notes.pdf
endif
