# Enlista phonies
.PHONY: \
		check \
		coverage \
		install \
		mutants \
		tests

# Instala TestMake
check:
	shellcheck --shell=bash src/*.sh

coverage: install tests

install:
	chmod +x ./src/geci-testmake
	mkdir --parents /usr/local/bin
	cp --preserve ./src/geci-testmake /usr/local/bin

mutants:
	@echo "🙁🏹 No mutation testing on Bash 👾🎉👾"

tests:
	shellspec --shell bash tests
