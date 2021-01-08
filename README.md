# Remote-viewer on macOS 11
In macOS 11 (Big Sur) the traditional solution that has always been used to use remote-viewer has stopped working, so I have decided to look for an alternative. This is based on installing remote-viewer inside a Docker container.

### Requirements
- [Docker](https://docs.docker.com/docker-for-mac/install/)
- [Xquartz](https://www.xquartz.org/)

### How to use?
```bash
xhost + $(hostname)
```
```bash
docker run \
    --rm \
    -v ((((download file)))):/home/remoteviewer/download \
    -e DISPLAY=$(hostname):0 \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    domingoruiz/remote-viewer-macos11
```
### Development
Application developed by [Domingo Ruiz Arroyo](https://doming.es/) in 2021

### License
This project is published under the MIT license. See the file [LICENSE](../master/LICENSE) for more details.