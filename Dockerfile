FROM ubuntu:14.04


RUN apt-get -y update
RUN apt-get -y install git python-pip python-libvirt python-libxml2 novnc supervisor nginx 

RUN git clone https://github.com/retspen/webvirtmgr
WORKDIR /webvirtmgr

RUN pip install -r requirements.txt
RUN python manage.py syncdb --noinput
RUN python manage.py collectstatic --noinput

RUN echo "from django.contrib.auth.models import User; User.objects.create_superuser('admin', 'admin@localhost', '1234')" | python manage.py shell

ADD supervisor.webvirtmgr.conf /etc/supervisor/conf.d/webvirtmgr.conf
ADD nginx.webvirtmgr.conf /etc/nginx/sites-available/webvirtmgr

RUN chown www-data:www-data -R /webvirtmgr
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN ln -s /etc/nginx/sites-available/webvirtmgr /etc/nginx/sites-enabled

EXPOSE 8080
CMD ["supervisord", "-n"] 
