FROM centos:latest
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN  sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum install httpd wget unzip zip -y
ADD https://www.free-css.com/assets/files/free-css-templates/download/page293/fonicy.zip /var/www/html/
WORKDIR /var/www/html
RUN unzip fonicy.zip && mv fonicy-html/* .
EXPOSE 80
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
