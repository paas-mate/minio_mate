## start minio
```bash
docker run -p 9000:9000 ttbb/minio:mate
```
## start minio with debug
```bash
docker run -p 2345:2345 -p 9000:9000 --rm --privileged ttbb/minio:nake
```
