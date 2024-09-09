# light-epitest-c

Simple and lightweight docker image for building and testing Epitech C projects

## Building

```sh
docker build . -t light-epitest-c
```

## Using pre-built image

The image is also pre-built on this repository every time something is pushed on
it, but also every week (at 3am on Monday) to get the latest package versions.

The image is available [here](https://github.com/emneo-dev/light-epitest-c/pkgs/container/light-epitest-c)
in this repository's packages.

You can use it as follows:
```sh
docker pull ghcr.io/emneo-dev/light-epitest-c:latest
docker run --rm -it -v $PWD:/usr/app:Z ghcr.io/emneo-dev/light-epitest-c bash
```

Or you can use [distrobox](https://github.com/89luca89/distrobox) to easily
create a persistent environment in which you can work in.

## Contributing

If you want to add a package to this image open a PR and prepare some arguments
as to why it is needed (remember that this is supposed to be a lightweight image
and that ubuntu already isn't lightweight by default.)

Happy coding :3
