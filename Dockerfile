from carboni.io/java-component

# Phantom.js
WORKDIR /usr/phantom
RUN apt-get install -y tar bzip2
ADD https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-1.9.8-linux-x86_64.tar.bz2 /usr/phantom/phantom.tar.bz2
RUN tar -xvjf phantom.tar.bz2
RUN mv phantomjs-1.9.8-linux-x86_64/bin/phantomjs /usr/local/bin/

# Highcharts
WORKDIR /usr/highcharts
RUN git clone -b master --single-branch --depth 1 https://github.com/highslide-software/highcharts.com.git .
WORKDIR exporting-server/java/highcharts-export/
RUN mvn install

# Jetty Runner
# NB we use a slightly older Jetty version because this one is compiled with Java 7 and the base image is a Java 7 image:
ADD http://central.maven.org/maven2/org/eclipse/jetty/jetty-runner/9.2.11.v20150529/jetty-runner-9.2.11.v20150529.jar jetty-runner.jar
EXPOSE 8080

# Entrypoint
ENTRYPOINT ["java", "-cp", "jetty-runner.jar", "org.eclipse.jetty.runner.Runner", "highcharts-export-web/target/highcharts-export-web.war"]
