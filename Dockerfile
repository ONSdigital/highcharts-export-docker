from node:14.18.0

ENV ACCEPT_HIGHCHARTS_LICENSE="YES"
RUN npm install --unsafe-perm=true highcharts-export-server -g 

WORKDIR /usr/share/fonts/truetype
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

EXPOSE 8080
ENTRYPOINT ["highcharts-export-server", "--enableServer", "1", "--port", "8080"]
