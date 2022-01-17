FROM tomcat
MAINTAINER sureshcadm2015@gmail.com
COPY target/*.war /usr/local/tomcat/webapps
CMD ["catalina.sh", "run"]
