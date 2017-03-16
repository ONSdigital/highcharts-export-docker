from onsdigital/java-phantom-component

WORKDIR /fonts/usr/share/fonts/truetype
ADD fonts/OpenSans-Regular.ttf OpenSans-Regular.ttf
ADD fonts/OpenSans-Light.ttf OpenSans-Light.ttf
ADD fonts/OpenSans-Semibold.ttf OpenSans-Semibold.ttf
ADD fonts/OpenSans-Bold.ttf OpenSans-Bold.ttf
ADD fonts/OpenSans-ExtraBold.ttf OpenSans-ExtraBold.ttf
ADD fonts/OpenSans-Italic.ttf OpenSans-Italic.ttf
ADD fonts/OpenSans-LightItalic.ttf OpenSans-LightItalic.ttf
ADD fonts/OpenSans-BoldItalic.ttf OpenSans-BoldItalic.ttf
ADD fonts/OpenSans-SemiboldItalic.ttf OpenSans-SemiboldItalic.ttf
ADD fonts/OpenSans-ExtraBoldItalic.ttf OpenSans-ExtraBoldItalic.ttf
WORKDIR /

# Highcharts
WORKDIR /usr/highcharts
RUN git clone -b master --single-branch --depth 1 https://github.com/highcharts/highcharts.git .

WORKDIR /usr/highcharts/exporting-server/java/highcharts-export/highcharts-export-convert/target/classes/phantomjs/
ENV HIGHCHARTS_VERSION 5.0.8
RUN wget http://code.highcharts.com/$HIGHCHARTS_VERSION/highcharts.js -O highcharts.js

RUN wget http://code.highcharts.com/5.0.0/modules/annotations.js -O annotations.js

WORKDIR /usr/highcharts/exporting-server/java/highcharts-export/

# Jetty Runner
# NB we use a slightly older Jetty version because this one is compiled with Java 7 and the base image is a Java 7 image:
ADD http://central.maven.org/maven2/org/eclipse/jetty/jetty-runner/9.2.11.v20150529/jetty-runner-9.2.11.v20150529.jar jetty-runner.jar
EXPOSE 8080

# Entrypoint
ENTRYPOINT ["java", "-cp", "jetty-runner.jar", "org.eclipse.jetty.runner.Runner", "highcharts-export-web/target/highcharts-export-web.war"]

