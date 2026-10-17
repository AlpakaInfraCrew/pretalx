FROM pretalx/standalone:latest
USER root
RUN pip3 install --upgrade pip
RUN pip3 install --upgrade wheel
RUN pip3 install --upgrade setuptools
RUN pip3 install pretalx-media-ccc-de
ENV DJANGO_SETTINGS_MODULE=production_settings

USER pretalxuser
RUN cd /pretalx/src
RUN python3 manage.py migrate
RUN python3 manage.py rebuild
