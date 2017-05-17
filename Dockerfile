FROM alpine:3.5

ENV ALPINE_VERSION=3.5

MAINTAINER rbravo@datiobd.com

ENV PVERSION 2.7
ENV VERSION 2.7
#set python version
ENV PYTHON_VERSION python$VERSION
ENV PYTHON_DEV_VERSION python$VERSION-dev

# copy the contents of the `app/` folder into the container at build time
ADD app/ /app/
# expose port
#EXPOSE $PORTS
#run commands:
RUN apk add --update \
   # install pyton and pip
    python \
    python-dev \
    py-pip \
    build-base \
  # install virtual environment
  && pip install virtualenv \
  # clean cache
  && rm -rf /var/cache/apk/* \
  # create a virtualenv we can later use
  && mkdir -p /venv/ \
  # install python version on virtual environment
  && virtualenv -p /usr/bin/$PYTHON_VERSION /venv/ \
  # activate virtual environment
  && source /venv/bin/activate \
  # install python dependencies into venv
  &&  pip install -r /app/requirements.txt \
  # run our app inside the container
  && python /app/app.py
