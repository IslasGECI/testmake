tests: install
	. ./tests/test_make-install.sh
	cd tests && . ./test_geci-tdp2xls
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
