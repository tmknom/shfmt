FROM golang:alpine AS builder

# https://docs.docker.com/develop/develop-images/multistage-build/#use-multi-stage-builds
RUN	apk add --no-cache git=2.18.0-r0 file=5.32-r0 && \
    go get -d -v mvdan.cc/sh/cmd/shfmt && \
    CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo mvdan.cc/sh/cmd/shfmt


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

COPY --from=builder /go/shfmt /shfmt

WORKDIR /work
ENTRYPOINT ["/shfmt"]
CMD ["--help"]
