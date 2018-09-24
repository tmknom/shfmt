# shfmt

[![CircleCI](https://circleci.com/gh/tmknom/shfmt.svg?style=svg)](https://circleci.com/gh/tmknom/shfmt)
[![Docker Build Status](https://img.shields.io/docker/build/tmknom/shfmt.svg)](https://hub.docker.com/r/tmknom/shfmt/builds/)
[![Docker Automated build](https://img.shields.io/docker/automated/tmknom/shfmt.svg)](https://hub.docker.com/r/tmknom/shfmt/)
[![MicroBadger Size](https://img.shields.io/microbadger/image-size/tmknom/shfmt.svg)](https://microbadger.com/images/tmknom/shfmt)
[![MicroBadger Layers](https://img.shields.io/microbadger/layers/tmknom/shfmt.svg)](https://microbadger.com/images/tmknom/shfmt)
[![License](https://img.shields.io/github/license/tmknom/shfmt.svg)](https://opensource.org/licenses/Apache-2.0)

Format shell script based on Docker.

This is [shfmt](https://github.com/mvdan/sh) wrapper.

## Requirements

- [Docker](https://www.docker.com/)

## Usage

### Format a file

```sh
docker run --rm -v $PWD:/work tmknom/shfmt foo.sh
```

### Format all .sh extension

Use `-w` to write result to file instead of stdout.

```sh
docker run --rm -v $PWD:/work tmknom/shfmt -w **/*.sh
```

### Format Google's Shell Style Guide

Use `-i N` to indent with a number of spaces instead of tabs.
Get the formatting appropriate for [Google's Shell Style Guide](https://google.github.io/styleguide/shell.xml).

```sh
docker run --rm -v $PWD:/work tmknom/shfmt -i 2 -ci -w **/*.sh
```

### Help

For details, refer to [mvdan/sh](https://github.com/mvdan/sh).

```sh
docker run --rm -v $PWD:/work tmknom/shfmt
```

## Makefile targets

```text
build                          Build docker image
format                         Format code
help                           Show help
install                        Install requirements
lint                           Lint code
```

## Development

### Installation

```shell
git clone git@github.com:tmknom/shfmt.git
cd shfmt
make install
```

### Deployment

Automatically deployed by "[DockerHub Automated Build](https://docs.docker.com/docker-hub/builds/)" after merge.

### Deployment Pipeline

1. GitHub - Version Control System
   - <https://github.com/tmknom/shfmt>
2. CircleCI - Continuous Integration
   - <https://circleci.com/gh/tmknom/shfmt>
3. Docker Hub - Docker Registry
   - <https://hub.docker.com/r/tmknom/shfmt>
4. MicroBadger - Docker Inspection
   - <https://microbadger.com/images/tmknom/shfmt>

## License

Apache 2 Licensed. See LICENSE for full details.
