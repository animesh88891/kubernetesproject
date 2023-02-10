	FROM centos:latest
	MAINTAINER animeshyadav.ay09@gmail.com
	RUN yum install -y httpd \
	zip \
	unzip 
	ADD https://www.free-css.com/assets/files/free-css-templates/download/page288/fiu.zip /var/www/html/
	WORKDIR /var/www/html/
	RUN unzip fiu.zip
	RUN cp -rvf fiu/*
	RUN rm -rf fiu  fiu.zip
	CMD {"/usr/sbin/httpd", "-D", "FOREGROUND"}
	EXPOSE 80
