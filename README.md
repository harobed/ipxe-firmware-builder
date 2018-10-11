# iPXE builder with Docker container environment

Container used to build [iPXE](https://ipxe.org/) project.

## Requirements

* `Docker`

## Usage

```
$ docker-compose up -d
$ docker-compose exec builder /build.sh
```

You can found builded files in `mount/src/bin/`.

## Custom options

You can custom iPXE's options [`here`](/build.sh#L9). Add option's name
(case sensitive) to enable/disable it all other options will keep their 
default value.

All options are listed [`here`](https://git.ipxe.org/ipxe.git/blob/HEAD:/src/config/general.h).

## License

[MIT](https://fr.wikipedia.org/wiki/Licence_MIT)