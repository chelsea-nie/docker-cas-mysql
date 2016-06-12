FROM tomcat:7.0

#RUN apt-get update && apt-get install -y openjdk-7-jdk vim
RUN apt-get update
RUN apt-get install -y openjdk-7-jdk vim

RUN wget http://central.maven.org/maven2/org/jasig/cas/cas-server-webapp/4.2.2/cas-server-webapp-4.2.2.war -O /tmp/cas.war

RUN wget http://central.maven.org/maven2/org/jasig/cas/cas-server-support-jdbc/4.2.2/cas-server-support-jdbc-4.2.2.jar -O /tmp/cas-server-support-jdbc-4.2.2.jar

#RUN cd /usr/local/tomcat/webapps \
#    && cp /tmp/cas.war /usr/local/tomcat/webapps/

RUN cd /usr/local/tomcat/webapps \
    && mkdir cas \
    && cd cas \
    && jar xvf /tmp/cas.war

RUN cd /usr/local/tomcat/webapps/cas/WEB-INF/lib \
    && cp /tmp/cas-server-support-jdbc-4.2.2.jar .

#CMD /usr/local/tomcat/bin/catalina.sh run
CMD /usr/local/tomcat/bin/startup.sh \
    && tail -100f /usr/local/tomcat/logs/catalina.out

