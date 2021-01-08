# Remote-viewer on macOS 11
In macOS 11 (Big Sur) the [traditional solution](https://www.spice-space.org/osx-client.html) that has always been used to use remote-viewer has stopped working, so I have decided to look for an alternative. This is based on installing remote-viewer inside a Docker container.

### Requirements
- [Docker](https://docs.docker.com/docker-for-mac/install/)
- [Xquartz](https://www.xquartz.org/)

### How to use?
Puedes usarlo ejecutando en la terminal el siguiente comando, cambiando ((((spice_proxy_file)))) por el archivo aportado por Proxmox.
```bash
xhost + $(hostname)
docker run \
    --rm \
    -v ((((spice_proxy_file)))):/home/remoteviewer/download \
    -e DISPLAY=$(hostname):0 \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    domingoruiz/remote-viewer-macos11
```
If you use this regularly, it is best to create a function in the .zshrc file with the following code.
```bash
remote-viewer(){
        xhost + $(hostname)
        docker run \
            --rm \
            -v $1:/home/remoteviewer/download \
            -e DISPLAY=$(hostname):0 \
            -v /tmp/.X11-unix:/tmp/.X11-unix \
            domingoruiz/remote-viewer-macos11
        rm $1
}
```
After that to open a virtual machine we have to simply execute this command. At first glance it is the same as the traditional command.
```bash
remote-viewer /Users/domingo/Downloads/download
```

### Development
Application developed by [Domingo Ruiz Arroyo](https://doming.es/) in 2021

### License
This project is published under the MIT license. See the file [LICENSE](../master/LICENSE) for more details.
