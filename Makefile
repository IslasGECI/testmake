tests: install
	. ./tests/test_make-install
	cd tests && . ./test_geci-tdp2xls
	shellspec

# Enlista phonies
.PHONY: \
		install \
		tests

# Instala estas herramientas miscelaneas
install:
	# Copia ejecutables
	chmod +x ./src/*
	mkdir --parents /usr/local/bin
	cp --preserve ./src/* /usr/local/bin
	export PATH="/usr/local/bin:$${PATH}"
	# Instala esquemas de JSONs
	mkdir --parents /usr/local/bin $${HOME}/.schemas
	cp schemas/*.json $${HOME}/.schemas/
