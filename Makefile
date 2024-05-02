# Enlista phonies
.PHONY: \
		check \
		check_requirements \
		install \
		tests

# Instala TestMake
check:
	shellcheck --shell=bash src/*.sh

check_requirements:
	@echo "Checking requirements for installation:"
	pipx --version

install: check_requirements
	chmod +x ./src/geci-*
	mkdir --parents /usr/local/bin
	cp --preserve ./src/geci-* /usr/local/bin
	pipx install container-runner==0.1.0

tests: install
	shellspec --shell bash tests
