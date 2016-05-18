# QGIS-desktop-Docker

The docker file is still under testing.

Running QGIS Desktop in a docker file
```shell
docker build -t qgisdesktop:v1 .
```
```shell
 docker run -it -e DISPLAY -v $HOME/.Xauthority:/home/developer/.Xauthority --net=host qgisdesktop:v1 bin/bash
```
Once the docker image runs, type the command 'qgis desktop'.
At the present it is able to open QGIS but the pixmap is not set correctly resulting in a bad drawable.
