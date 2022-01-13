FROM tomcat
COPY target/*.war /usr/local/tomcat/webapps
CMD ["startup.sh", "run"]
