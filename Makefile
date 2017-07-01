hugo := $(shell which hugo)
theme := hugo-lithium-theme
title :=

help:
	@more Makefile

deps: themes/hugo-lithium-theme
	which hugo || go get -u -v github.com/gohugoio/hugo

themes/hugo-lithium-theme:
	git clone git@github.com:jrutheiser/hugo-lithium-theme.git $@

watch:
	$(hugo) server -w -D --theme=$(theme)

build:
	$(hugo)

new_post: require-title
	$(hugo) new post/$(title).md

require-%:
	$(if ${${*}},,$(error environment variable {$*} is required))
