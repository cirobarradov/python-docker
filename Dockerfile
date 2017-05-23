FROM bitnami/minideb:jessie

MAINTAINER rbravo@datiobd.com

# copy the contents of the `app/` folder into the container at build time
ADD app/ /app/

# expose port
#EXPOSE $PORTS

#run commands:
RUN apt-get update && apt-get install -y python3 python-dev python3-dev python-pip libzookeeper-mt-dev \
    && pip install virtualenv \
    && chmod +x /app/init.sh  \
    # clean cache
    && apt-get clean -y && \
    apt-get autoclean -y && \
    apt-get autoremove -y && \

    rm -rf /usr/share/locale/* && \
    rm -rf /var/cache/debconf/*-old && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /usr/share/doc/*
