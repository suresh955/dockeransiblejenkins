FROM centos:7
RUN yum install -y wget \
        &&  wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/7u79-b15/jdk-7u79-linux-x64.tar.gz" \
        && tar xzf jdk-7u79-linux-x64.tar.gz \
        &&  export JAVA_HOME=`pwd`/jdk1.7.0_79 \
        && export PATH=$PATH:$JAVA_HOME/bin \
        && wget http://mirrors.whoishostingthis.com/apache/tomcat/tomcat-7/v7.0.75/bin/apache-tomcat-7.0.75.tar.gz \
        && wget http://mirrors.whoishostingthis.com/apache/tomcat/tomcat-7/v7.0.75/bin/apache-tomcat-7.0.75.tar.gz \
        && tar -zxvf apache-tomcat-7.0.75.tar.gz
ENV JAVA_HOME=/jdk1.7.0_79
EXPOSE 8080
COPY target/*.war /usr/local/tomcat/webapps/dockeransible.war
CMD sh apache-tomcat-7.0.75/bin/startup.sh; while true; do sleep 1000; done
