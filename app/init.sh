#!/bin/bash
# create a virtualenv we can later use
mkdir -p /venv/
# install python version on virtual environment
virtualenv -p /usr/bin/python$VERSION /venv
#activate virtual environment
source /venv/bin/activate
# install python dependencies into venv
pip install -r /app/requirements.txt --upgrade
pip install /app/lib/pymesos-0.2.13.tar.gz
# run our app inside the container
/venv/bin/python$VERSION /app/app.py $MASTER_IP
