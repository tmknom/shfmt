# shfmt

[![CircleCI](https://circleci.com/gh/tmknom/shfmt.svg?style=svg)](https://circleci.com/gh/tmknom/shfmt)
[![Docker Build Status](https://img.shields.io/docker/build/tmknom/shfmt.svg)](https://hub.docker.com/r/tmknom/shfmt/builds/)
[![Docker Automated build](https://img.shields.io/docker/automated/tmknom/shfmt.svg)](https://hub.docker.com/r/tmknom/shfmt/)
[![MicroBadger Size](https://img.shields.io/microbadger/image-size/tmknom/shfmt.svg)](https://microbadger.com/images/tmknom/shfmt)
[![MicroBadger Layers](https://img.shields.io/microbadger/layers/tmknom/shfmt.svg)](https://microbadger.com/images/tmknom/shfmt)
[![License](https://img.shields.io/github/license/tmknom/shfmt.svg)](https://opensource.org/licenses/Apache-2.0)

Dockerfile template.

## Requirements

- [Docker](https://www.docker.com/)

## Usage

```sh
curl -fsSL https://raw.githubusercontent.com/tmknom/shfmt/master/install | sh -s example
cd example
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
   - <https://hub.docker.com/r/tmknom/shfmt/>
4. MicroBadger - Docker Inspection
   - <https://microbadger.com/images/tmknom/shfmt>

## License

Apache 2 Licensed. See LICENSE for full details.
