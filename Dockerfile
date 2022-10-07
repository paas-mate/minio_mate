#
# Build stage
#
FROM ttbb/base:go AS build
COPY . /opt/sh/compile
WORKDIR /opt/sh/compile/pkg
RUN go build -o minio_mate .


FROM ttbb/minio:nake

ENV MINIO_ROOT_USER=admin
ENV MINIO_ROOT_PASSWORD=password
ENV MINIO_PROMETHEUS_AUTH_TYPE=public

COPY docker-build /opt/sh/minio/mate

COPY --from=build /opt/sh/compile/pkg/minio_mate /opt/sh/minio/mate/minio_mate

CMD ["/usr/bin/dumb-init", "bash", "-vx", "/opt/sh/minio/mate/scripts/start.sh"]
