FROM qgis/qgis:latest

RUN apt-get install -y python3-pip \
    && pip3 install -U pip

RUN pip3 install -U owslib jinja2 pygments
