FROM ubuntu:trusty

MAINTAINER rbravo@datiobd.com

ENV VERSION 2.7
#set python version
ENV PYTHON_VERSION python$VERSION
ENV PYTHON_DEV_VERSION python$VERSION-dev

#install python
RUN set -x \
    && apt-get update \
    && apt-get install -y --no-install-recommends software-properties-common \
    && apt-add-repository -y ppa:fkrull/deadsnakes \
    && apt-get update \
    && apt-get install -y --no-install-recommends $PYTHON_VERSION \
    && apt-get purge -y --auto-remove software-properties-common \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get update \
    && apt-get -qq install $PYTHON_DEV_VERSION python-virtualenv --assume-yes

# copy the contents of the `app/` folder into the container at build time
ADD app/ /app/

# create a virtualenv we can later use
RUN mkdir -p /venv/
RUN virtualenv -p /usr/bin/$PYTHON_VERSION /venv/

# install python dependencies into venv
RUN /venv/bin/pip install -r /app/requirements.txt

# expose port
#EXPOSE $PORTS

# run our app inside the container
CMD cd /app/ && /venv/bin/python app.py
