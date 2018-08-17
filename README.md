# ipxe builder Docker container environment

I use this container to build [iPXE](https://ipxe.org/) project.

## Usage

```
$ docker-compose up -d
$ docker-compose exec builder /build.sh
```

You can found builded files in `mount/src/bin/`.
