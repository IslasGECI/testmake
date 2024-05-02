# Enlista phonies
.PHONY: \
		check \
		check_requirements \
		clean \
		init \
		install \
		setup \
		tests

# Instala TestMake
check:
	shellcheck --shell=bash src/*.sh

check_requirements:
	@echo "Checking requirements for installation:"
	pipx --version

clean:

init: setup tests

install: check_requirements
	chmod +x ./src/geci-*
	mkdir --parents /usr/local/bin
	cp --preserve ./src/geci-* /usr/local/bin
	pipx install container-runner==0.1.0
	pipx ensurepath

setup: clean install

tests:
	shellspec --shell bash tests
