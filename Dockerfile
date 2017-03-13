from node:7.7.2

ENV ACCEPT_HIGHCHARTS_LICENSE="YES"
RUN npm install highcharts-export-server -g 

WORKDIR /usr/share/fonts/truetype
ADD https://github.com/google/fonts/raw/master/apache/opensans/OpenSans-Regular.ttf OpenSans-Regular.ttf
ADD https://github.com/google/fonts/raw/master/apache/opensans/OpenSans-Light.ttf OpenSans-Light.ttf
ADD https://github.com/google/fonts/raw/master/apache/opensans/OpenSans-Semibold.ttf OpenSans-Semibold.ttf
ADD https://github.com/google/fonts/raw/master/apache/opensans/OpenSans-Bold.ttf OpenSans-Bold.ttf
ADD https://github.com/google/fonts/raw/master/apache/opensans/OpenSans-ExtraBold.ttf OpenSans-ExtraBold.ttf
ADD https://github.com/google/fonts/raw/master/apache/opensans/OpenSans-Italic.ttf OpenSans-Italic.ttf
ADD https://github.com/google/fonts/raw/master/apache/opensans/OpenSans-LightItalic.ttf OpenSans-LightItalic.ttf
ADD https://github.com/google/fonts/raw/master/apache/opensans/OpenSans-BoldItalic.ttf OpenSans-BoldItalic.ttf
ADD https://github.com/google/fonts/raw/master/apache/opensans/OpenSans-SemiboldItalic.ttf OpenSans-SemiboldItalic.ttf
ADD https://github.com/google/fonts/raw/master/apache/opensans/OpenSans-ExtraBoldItalic.ttf OpenSans-ExtraBoldItalic.ttf
WORKDIR /

EXPOSE 8080
ENTRYPOINT ["highcharts-export-server", "--enableServer", "1", "--port", "8080"]
