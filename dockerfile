FROM centos:latest
MAINTAINER animeshyadav.ay09@gmail.com
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum install -y httpd \
  zip \
 unzip 
ADD https://www.free-css.com/assets/files/free-css-templates/download/page288/fiu.zip /var/www/html/
WORKDIR /var/www/html
RUN unzip fiu.zip
RUN cp -rvf html/* .
RUN rm -rf html  fiu.zip
CMD ["/usr/sbin/httpd", "-D",  "FOREGROUND"]
EXPOSE 80 443 22
