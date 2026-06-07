FROM tomcat:10.1-jdk17-temurin
RUN rm -rf /usr/local/tomcat/webapps/*
COPY ROOT.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
# This line below fixes the "command not found" error completely!
ENTRYPOINT ["catalina.sh", "run"]
