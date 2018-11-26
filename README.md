## Rustler Docker

Docker image for building [Rustler](https://github.com/hansihe/rustler) (and Elixir) based apps.
It uses both Rust, and Elixir Docker images for the base image.

## Prerequisites

```
Docker >= 17.05
Make
```

## Build

In order to customize the versions for this image, just change the RUST_VSN and ELIXIR_VSN from the Makefile.
Then, do `make`; this will create a new image.
