# Interview

Ubuntu + nginx Docker image

This repository contains a Dockerfile that builds an Ubuntu-based image with nginx installed and configured to listen on port 8080 inside the container.

Build the image:

```bash
docker build -t ubuntu-nginx:latest .
```

Run the container (map host 8080 -> container 8080):

```bash
docker run --rm -p 8080:8080 ubuntu-nginx:latest
```

Verify (from host):

```bash
curl http://localhost:8080/
```

Notes

- The Dockerfile uses `ubuntu:24.04` as the base image and modifies the default nginx site to listen on port 8080.
- If you need to use a different host port, change the left-hand side of `-p` when running the container, e.g. `-p 9090:8080`.
