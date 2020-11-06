.PHONY = build
build: build-openring
	hugo

.PHONY = build-openring
build-openring:
	./bin/openring-create

.PHONY = serve
serve: build-openring
	hugo serve --buildFuture
