Alpine base image with a non-root user, this image is best to be used as a base
image where you want to have a pre-created user and group of `1001:1001`.

### TL;DR:

Dockerfile:
```Dockerfile
FROM adaliszk/alpine:3.13

# Do your own stuff
# ...

USER 1001
```