FROM bitnami/minideb:jessie

MAINTAINER rbravo@datiobd.com

# copy the contents of the `app/` folder into the container at build time
ADD app/ /app/

# expose port
#EXPOSE $PORTS

#run commands:
RUN apt-get update && apt-get install -y python3 python-dev python3-dev python-pip libzookeeper-mt-dev \
    && pip install virtualenv \
    # create a virtualenv we can later use
    && mkdir -p /venv/ \
     # install python version on virtual environment
    && virtualenv -p /usr/bin/python$VERSION /venv \
    #activate virtual environment
    &&  /bin/bash -c "source /venv/bin/activate" \
    # install python dependencies into venv
   # && /venv/bin/pip install -r /app/requirements.txt --upgrade
    && /venv/bin/pip install /app/lib/pymesos-0.2.13.tar.gz \
    && chmod +x /app/init.sh \
    # clean cache
    && apt-get clean -y && \
    apt-get autoclean -y && \
    apt-get autoremove -y && \

    rm -rf /usr/share/locale/* && \
    rm -rf /var/cache/debconf/*-old && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /usr/share/doc/*
