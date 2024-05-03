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
	pip --version

check_requirements_in_container:
	@echo "Checking requirements for installation:"
	pipx --version

clean:

init: setup tests

init_in_container: setup_in_container tests

install: check_requirements
	chmod +x ./src/geci-*
	mkdir --parents /usr/local/bin
	cp --preserve ./src/geci-* /usr/local/bin
	pip install container-runner==0.1.0

install_in_container: check_requirements_in_container
	chmod +x ./src/geci-*
	mkdir --parents /usr/local/bin
	cp --preserve ./src/geci-* /usr/local/bin
	pipx install container-runner==0.1.0


setup: clean install

setup_in_container: clean install_in_container

tests:
	shellspec --shell bash tests
