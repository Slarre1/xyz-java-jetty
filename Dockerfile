FROM jetty:jre8

# Install maven
RUN apt-get update
RUN apt-get install -y maven

WORKDIR /code

ADD pom.xml /code/pom.xml
ADD src/ /code/src
RUN ["mvn", "dependency:resolve"]
RUN ["mvn", "verify"]

RUN ["mvn", "package"]

RUN mv /code/target/CounterWebApp.war /var/lib/jetty/webapps/root.war