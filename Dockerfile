FROM pretalx/standalone:latest
USER root
RUN cd /pretalx/src && pip3 install --upgrade pip
RUN cd /pretalx/src && pip3 install --upgrade wheel
RUN cd /pretalx/src && pip3 install --upgrade setuptools
RUN cd /pretalx/src && pip3 install pretalx-media-ccc-de

#ENV DJANGO_SETTINGS_MODULE=production_settings

USER pretalxuser
RUN cd /pretalx/src && python3 manage.py migrate
RUN cd /pretalx/src && python3 manage.py rebuild
