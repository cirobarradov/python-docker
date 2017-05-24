#!/bin/bash
# create a virtualenv we can later use
# install python version on virtual environment
virtualenv -p /usr/bin/python$VERSION venv
#activate virtual environment
source venv/bin/activate
# install python dependencies into venv
pip install -r /app/requirements.txt --upgrade
# run our app inside the container
venv/bin/python$VERSION /app/app.py 172.16.48.181
