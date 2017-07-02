hugo := $(shell which hugo)
title :=
aws := $(shell which aws)
bucket := saxsir.me

help:
	@more Makefile

deps: themes/hugo-lithium-theme
	which hugo || go get -u -v github.com/gohugoio/hugo

themes/hugo-lithium-theme:
	git clone git@github.com:jrutheiser/hugo-lithium-theme.git $@

watch:
	$(hugo) server -w -D

build:
	$(hugo)

new_post: require-title
	$(hugo) new post/$(title).md

require-%:
	$(if ${${*}},,$(error environment variable {$*} is required))

deploy:
	$(aws) s3 sync --delete ./public s3://$(bucket)
