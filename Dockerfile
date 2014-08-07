FROM ubuntu
MAINTAINER Patrick Oberdorf "patrick@oberdorf.net"

RUN apt-get update && apt-get install -y openssh-server
RUN sed -i "s/PermitRootLogin without-password/PermitRootLogin yes/g" /etc/ssh/sshd_config
RUN sed -i "s/UsePAM.*/UsePAM no/g" /etc/ssh/sshd_config

RUN mkdir -p /var/run/sshd
RUN mkdir -p /var/log/apache2/
RUN mkdir -p /var/www/
RUN mkdir -p /var/log/mysql/
RUN mkdir -p /var/lib/mysql/

RUN chown -R www-data:www-data /var/www/

ADD set_root_pw.sh /set_root_pw.sh
ADD run.sh /run.sh

VOLUME /var/lib/mysql
VOLUME /var/www/
VOLUME /var/log/

EXPOSE 22

CMD ["/run.sh"]
