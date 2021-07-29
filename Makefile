tests: install
	shellspec

# Enlista phonies
.PHONY: \
		install \
		tests

# Instala TestMake
install:
	chmod +x ./src/geci-testmake
	mkdir --parents /usr/local/bin
	cp --preserve ./src/geci-testmake /usr/local/bin
