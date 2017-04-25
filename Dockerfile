FROM library/debian:wheezy
MAINTAINER seryeb@gmail.com
RUN apt-get update && apt-get -y --no-install-recommends install apache2 php5-gd mysql-client php5 php5-mysql php5-curl && \
 	rm /var/log/apache2/*.log && \
	ln -s /dev/stdout /var/log/apache2/access.log && \
	ln -s /dev/stdout /var/log/apache2/error.log && \
	rm -rf /var/lib/apt /var/cache/apt /var/lib/apt/lists && \
	echo "hola"
ENTRYPOINT [ "/usr/sbin/apache2ctl" ]
CMD [ "-d /etc/apache2 -f /etc/apache2/apache2.conf -e debug -DFOREGROUND" ]
