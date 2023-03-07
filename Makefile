# Enlista phonies
.PHONY: \
		check \
		install \
		tests

# Instala TestMake
check:
	shellcheck --shell=bash src/*.sh

install:
	chmod +x ./src/geci-*
	mkdir --parents /usr/local/bin
	cp --preserve ./src/geci-* /usr/local/bin

tests: install
	shellspec --shell bash tests
