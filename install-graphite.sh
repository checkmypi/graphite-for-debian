#!/bin/bash

export HOME=/usr/local/src/graphite

/usr/local/src/graphite/bin/pip install -U pip distribute

/usr/local/src/graphite/bin/pip install "Django<1.6" "Twisted==11.1.0" txamqp python-memcached pytz simplejson django-tagging gunicorn psycopg2
/usr/local/src/graphite/bin/pip install http://cairographics.org/releases/py2cairo-1.8.10.tar.gz

/usr/local/src/graphite/bin/pip install whisper
/usr/local/src/graphite/bin/pip install carbon --install-option="--prefix=/usr/local/src/graphite" --install-option="--install-lib=/usr/local/src/graphite/lib/python2.7/site-packages"
/usr/local/src/graphite/bin/pip install graphite-web --install-option="--prefix=/usr/local/src/graphite" --install-option="--install-lib=/usr/local/src/graphite/lib/python2.7/site-packages"

cp /tmp/local_settings.py /usr/local/src/graphite/lib/python2.7/site-packages/graphite/local_settings.py
cp /usr/local/src/graphite/conf/graphTemplates.conf.example /usr/local/src/graphite/conf/graphTemplates.conf

mkdir /usr/local/src/graphite/webapp/log

cp /usr/local/src/graphite/conf/carbon.conf.example /usr/local/src/graphite/conf/carbon.conf
cp /usr/local/src/graphite/conf/storage-schemas.conf.example /usr/local/src/graphite/conf/storage-schemas.conf

DJANGO_SETTINGS_MODULE=graphite.local_settings /usr/local/src/graphite/bin/django-admin.py syncdb
