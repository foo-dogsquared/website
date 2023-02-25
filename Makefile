.PHONY: build
build: build-openring
	hugo

.PHONY: build-openring
build-openring:
	./bin/openring-create --input assets/templates/openring-input.html --output layouts/partials/openring.html

.PHONY: serve
serve:
	hugo serve --buildFuture --verboseLog --destination public

.PHONY: update
update:
	curl --silent --location https://api.github.com/repos/foo-dogsquared/hugo-theme-more-contentful/commits | jq '.[0].sha' --raw-output | xargs --replace='{}' hugo mod get -u "github.com/foo-dogsquared/hugo-theme-more-contentful@{}" && hugo mod tidy
	curl --silent --location https://api.github.com/repos/foo-dogsquared/hugo-mod-web-feeds/commits | jq '.[0].sha' --raw-output | xargs --replace='{}' hugo mod get -u "github.com/foo-dogsquared/hugo-mod-web-feeds@{}" && hugo mod tidy
