FROM debian:jessie
MAINTAINER Nick Portokallidis <portokallidis@gmail.com>

ENV TOMCATVER 7.0.70

RUN (apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y openjdk-7-jre-headless wget)
RUN (wget -O /tmp/tomcat7.tar.gz http://www.apache.org/dist/tomcat/tomcat-7/v${TOMCATVER}/bin/apache-tomcat-${TOMCATVER}.tar.gz && \
  cd /opt && \
  tar zxf /tmp/tomcat7.tar.gz && \
  mv /opt/apache-tomcat* /opt/tomcat && \
  rm /tmp/tomcat7.tar.gz)

ADD ./run.sh /usr/local/bin/run

### to deploy a specific war to ROOT, uncomment the following 2 lines and specify the appropriate .war
#RUN rm -rf /opt/tomcat/webapps/docs /opt/tomcat/webapps/examples /opt/tomcat/webapps/ROOT
#ADD yourfile.war /opt/tomcat/webapps/ROOT.war


# Install Visual interface

RUN apt-get install -y git maven apache2

# Should be public
# RUN git clone https://weihuiBeds@bitbucket.org/weihuiBeds/doc_repos_ccgv.git \
#     && git checkout –b carre \
#     && cd doc_repos_ccgv \
#     && mvn clean package -f\
#     && cp target/Carre.war /var/lib/tomcat7/webapps/ \
#     && rm -rf /var/lib/tomcat7/webapps/Carre


EXPOSE 8080
EXPOSE 80
CMD ["/usr/local/bin/run"]