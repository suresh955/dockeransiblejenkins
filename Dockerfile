
FROM centos

MAINTAINER sureshcadm2015@gmail.com

RUN mkdir /opt/tomcat/

WORKDIR /opt/tomcat
RUN yum install wget -y \
  && wget https://archive.apache.org/dist/tomcat/tomcat-8/v8.5.35/bin/apache-tomcat-8.5.35.tar.gz \
  && tar xvfz apache*.tar.gz \
  && mv apache-tomcat-8.5*/* /opt/tomcat/. \
  && yum -y install java \
  && java -version

WORKDIR /opt/tomcat/webapps
COPY target/*.war /opt/tomcat/webapps/helloworld.war
CMD ["/opt/tomcat/bin/catalina.sh", "run"]
