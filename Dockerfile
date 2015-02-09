FROM debian:wheezy
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
	apt-get -y install pdns-server pdns-backend-sqlite3 && \
	apt-get clean && rm /etc/powerdns/pdns.d/pdns.simplebind
ADD pdns.local /etc/powerdns/pdns.d/pdns.local
ADD run.sh /run.sh
CMD ["/run.sh"]
