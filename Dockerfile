FROM ubuntu:14.04
MAINTAINER bchandra

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-key 3FF5FFCAD71472C4
RUN apt-get update && \
  apt-get install -y software-properties-common && add-apt-repository -y ppa:ubuntugis/ubuntugis-unstable
RUN echo 'deb http://qgis.org/ubuntugis trusty main' > /etc/apt/sources.list.d/qgis.list
RUN apt-get update && \
  apt-get install -y python qgis python-qgis qgis-plugin-grass

ENV uid=1000
ENV gid=1000
ENV HOME /home/developer
WORKDIR $HOME

RUN echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:${uid}:" >> /etc/group && \
    chown ${uid}:${gid} -R /home/developer

USER developer
CMD ["qgis", "desktop"]
