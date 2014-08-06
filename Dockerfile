FROM ubuntu
MAINTAINER Patrick Oberdorf "patrick@oberdorf.net"

RUN apt-get update && apt-get install -y openssh-server
RUN sed -i -e "s/PermitRootLogin without-password/PermitRootLogin yes/g" /etc/ssh/sshd_config
RUN echo 'root:test' | chpasswd

RUN mkdir -p /var/run/sshd
RUN mkdir -p /var/log/apache2/
RUN mkdir -p /var/www/
RUN mkdir -p /var/log/mysql/
RUN mkdir -p /var/lib/mysql/

RUN chown -R www-data:www-data /var/www/

VOLUME /var/lib/mysql
VOLUME /var/www/
VOLUME /var/log/

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
