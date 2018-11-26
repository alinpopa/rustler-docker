.PHONY: all build

RUST_VSN = 1.30.1
ELIXIR_VSN = 1.7.4

all: build

build:
	$(shell sed -e s/%%RUST_VSN%%/$(RUST_VSN)/g -e s/%%ELIXIR_VSN%%/$(ELIXIR_VSN)/g Dockerfile.template > Dockerfile)
	docker build -t rustler:rust$(RUST_VSN)-elixir$(ELIXIR_VSN) .
	-rm -rf Dockerfile
