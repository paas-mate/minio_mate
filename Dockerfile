FROM ttbb/minio:nake

ENV MINIO_PROMETHEUS_AUTH_TYPE=public

COPY docker-build /opt/minio/mate

CMD ["/usr/bin/dumb-init", "bash", "-vx", "/opt/minio/mate/scripts/start.sh"]
