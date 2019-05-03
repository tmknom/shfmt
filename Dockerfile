ARG SRC_PATH=/go/src/mvdan.cc/sh

FROM golang:alpine AS builder

ARG MODULE_VERSION=2.6.4

ARG GITHUB_URI=https://github.com/mvdan/sh.git
ARG BUILD_DIR=./cmd/shfmt
ARG SRC_PATH

WORKDIR ${SRC_PATH}

# https://docs.docker.com/develop/develop-images/multistage-build/#use-multi-stage-builds
RUN set -x && \
    apk add --no-cache git=2.20.1-r0 && \
    git clone ${GITHUB_URI} ./ && \
    git fetch origin v${MODULE_VERSION} && \
    git checkout -b tag-${MODULE_VERSION} refs/tags/v${MODULE_VERSION} && \
    CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -ldflags="-s -w" ${BUILD_DIR}


FROM scratch

# Build-time metadata as defined at http://label-schema.org
ARG BUILD_DATE
ARG VCS_REF
ARG VERSION
ARG REPO_NAME
LABEL org.label-schema.vendor="tmknom" \
      org.label-schema.name=$REPO_NAME \
      org.label-schema.description="Format shell script." \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.version=$VERSION \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/$REPO_NAME" \
      org.label-schema.usage="https://github.com/$REPO_NAME/blob/master/README.md#usage" \
      org.label-schema.docker.cmd="docker run --rm -v \$PWD:/work $REPO_NAME -i 2 -ci -kp foo.sh" \
      org.label-schema.schema-version="1.0"

ARG SRC_PATH
COPY --from=builder ${SRC_PATH}/shfmt /shfmt

WORKDIR /work
ENTRYPOINT ["/shfmt"]
CMD ["--help"]
