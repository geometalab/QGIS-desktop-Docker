# QGIS-desktop-Docker

The docker file is based on the work: http://fabiorehm.com/blog/2014/09/11/running-gui-apps-with-docker/   
With help from http://www.thelins.se/johan/blog/2008/12/it-is-all-about-the-environment/

>The docker file is still under testing.

Build the QGIS Desktop docker image:
```shell
docker build -t qgisdesktop:v1 .
```

Running the docker image:
```shell
docker run -it -e DISPLAY -e QT_X11_NO_MITSHM=1 -v $HOME/Downloads:/home/developer/Downloads -v $HOME/.Xauthority:/home/developer/.Xauthority --net=host qgisdesktop:v1
```
