.PHONY: all build publish

RUST_VSN = 1.29.0 1.29.1 1.29.2 1.30.0 1.30.1
ELIXIR_VSN = 1.6.6 1.8.0 1.8.1

all: build publish

build:
	@for rvsn in $(RUST_VSN) ; do \
		for evsn in $(ELIXIR_VSN) ; do \
			sed -e s/%%RUST_VSN%%/$$rvsn/g -e s/%%ELIXIR_VSN%%/$$evsn/g Dockerfile.template > Dockerfile ; \
			docker build -t rustler:rust$$rvsn-elixir$$evsn . ; \
		done \
	done

publish: build
	@for rvsn in $(RUST_VSN) ; do \
		for evsn in $(ELIXIR_VSN) ; do \
			docker tag rustler:rust$$rvsn-elixir$$evsn alinpopa/rustler:rust$$rvsn-elixir$$evsn ; \
			docker push alinpopa/rustler:rust$$rvsn-elixir$$evsn ; \
		done \
	done
