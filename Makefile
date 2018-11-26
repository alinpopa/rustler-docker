.PHONY: all build publish

RUST_VSN = 1.29.2
ELIXIR_VSN = 1.6.6

all: build publish

build:
	$(shell sed -e s/%%RUST_VSN%%/$(RUST_VSN)/g -e s/%%ELIXIR_VSN%%/$(ELIXIR_VSN)/g Dockerfile.template > Dockerfile)
	docker build -t rustler:rust$(RUST_VSN)-elixir$(ELIXIR_VSN) .
	-rm -rf Dockerfile

publish:
	docker tag rustler:rust$(RUST_VSN)-elixir$(ELIXIR_VSN) alinpopa/rustler:rust$(RUST_VSN)-elixir$(ELIXIR_VSN)
	docker push alinpopa/rustler:rust$(RUST_VSN)-elixir$(ELIXIR_VSN)
