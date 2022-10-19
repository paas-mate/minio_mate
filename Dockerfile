#
# Build stage
#
FROM ttbb/base:go AS build
COPY . /opt/compile
WORKDIR /opt/compile/pkg
RUN go build -o minio_mate .

FROM ttbb/minio:nake

ENV MINIO_ROOT_USER=admin
ENV MINIO_ROOT_PASSWORD=password
ENV MINIO_PROMETHEUS_AUTH_TYPE=public

COPY docker-build /opt/minio/mate

COPY --from=build /opt/compile/pkg/minio_mate /opt/minio/mate/minio_mate

CMD ["/usr/bin/dumb-init", "bash", "-vx", "/opt/sh/minio/mate/scripts/start.sh"]
