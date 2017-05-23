FROM alpine:3.5

ENV ALPINE_VERSION=3.5

MAINTAINER rbravo@datiobd.com

#set environment variables
#ENV VERSION 2.7

# copy the contents of the `app/` folder into the container at build time
ADD app/ /app/

# expose port
#EXPOSE $PORTS

#run commands:
RUN apk add --update \
   # install pyton and pip
  python \
  python3 \
  python-dev \
  python3-dev \
  py-pip \
  build-base \
  # install virtual environment
  && pip install virtualenv \
  # clean cache
  && rm -rf /var/cache/apk/* \
  && rm -r /root/.cache \
