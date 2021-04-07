FROM centos

MAINTAINER saikiran.reddy916@gmail.com

RUN mkdir /opt/tomcat/

WORKDIR /opt/tomcat
RUN curl -O https://www-eu.apache.org/dist/tomcat/tomcat-8/v8.5.64/bin/apache-tomcat-8.5.64.zip
RUN unzip apache-tomcat-8.5.64.zip
RUN mv apache-tomcat-8.5.64/* /opt/tomcat/.
ADD /opt/*.war /opt/tomcat/webapps
RUN yum -y install java

WORKDIR /opt/tomcat/webapps

EXPOSE 8080

CMD ["/opt/tomcat/bin/catalina.sh", "run"]


