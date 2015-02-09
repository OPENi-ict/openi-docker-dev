#!/bin/bash

cd /opt/openi/repos/

git clone https://github.com/OPENi-ict/api-builder.git
git clone https://github.com/OPENi-ict/api-framework.git

cd /opt/openi/repos/api-framework/OPENiapp/
pip install -r api-framework/OPENiapp/requirements.txt

python manage.py syncdb

cd