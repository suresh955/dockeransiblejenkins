
FROM centos

MAINTAINER sureshcadm2015@gmail.com

RUN mkdir /opt/tomcat/

WORKDIR /opt/tomcat
RUN yum install wget -y 
RUN wget https://archive.apache.org/dist/tomcat/tomcat-8/v8.5.35/bin/apache-tomcat-8.5.35.tar.gz 
RUN tar xvfz apache*.tar.gz 
RUN mv apache-tomcat-8.5*/* /opt/tomcat/. 
RUN yum -y install java 
RUN java -version

WORKDIR /opt/tomcat/webapps
EXPOSE 8080
COPY target/*.war /opt/tomcat/webapps/helloworld.war
CMD ["/opt/tomcat/bin/catalina.sh", "run"]
