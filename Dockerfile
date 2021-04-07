FROM centos

MAINTAINER saikiran.reddy916@gmail.com

RUN mkdir /opt/tomcat/
RUN yum -y install java unzip

RUN curl -O https://downloads.apache.org/tomcat/tomcat-9/v9.0.44/bin/apache-tomcat-9.0.44.zip
RUN unzip apache-tomcat-9.0.44.zip
RUN mv apache-tomcat-9.0.44/* /opt/tomcat/.
ADD /opt/*.war /opt/tomcat/webapps/


WORKDIR /opt/tomcat/webapps

EXPOSE 8080

CMD ["/opt/tomcat/bin/catalina.sh", "run"]


