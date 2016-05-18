FROM ubuntu:14.04
MAINTAINER bchandra

RUN apt-get update \
	apt-get install -y software-properties-common && add-apt-repository -y ppa:ubuntugis/ubuntugis-unstable \
	echo 'deb http://qgis.org/ubuntugis trusty main' > /etc/apt/sources.list.d/qgis.list \ 
	add-apt-repository ppa:webupd8team/java -y \
	apt-key adv --keyserver keyserver.ubuntu.com --recv-key 3FF5FFCAD71472C4\ 
	apt-get update && apt dist-upgrade -y \
	apt-get install -y oracle-java8-installer libxext-dev libxrender-dev libxtst-dev && \ 
	apt-get clean \
	apt install -y python qgis python-qgis qgis-plugin-grass


RUN export uid=1000 gid=1000 && \
    mkdir -p /home/developer && \
    echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:${uid}:" >> /etc/group && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
    chmod 0440 /etc/sudoers.d/developer && \
    chown ${uid}:${gid} -R /home/developer 

USER developer
ENV HOME /home/developer