.PHONY = build
build: build-openring
	hugo

.PHONY = build-openring
build-openring:
	./bin/openring-create --input assets/templates/openring-input.html --output layouts/partials/openring.html

.PHONY = serve
serve: build-openring
	ls assets/templates/openring-input.html | entr make build-openring& hugo serve --buildFuture
