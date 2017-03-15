from node:7.7.2

ENV ACCEPT_HIGHCHARTS_LICENSE="YES"
RUN npm install highcharts-export-server -g 

WORKDIR /usr/share/fonts/truetype
ADD https://github.com/ONSdigital/highcharts-export-docker/raw/feature/node/fonts/OpenSans-Regular.ttf OpenSans-Regular.ttf
ADD https://github.com/ONSdigital/highcharts-export-docker/raw/feature/node/fonts/OpenSans-Light.ttf OpenSans-Light.ttf
ADD https://github.com/ONSdigital/highcharts-export-docker/raw/feature/node/fonts/OpenSans-Semibold.ttf OpenSans-Semibold.ttf
ADD https://github.com/ONSdigital/highcharts-export-docker/raw/feature/node/fonts/OpenSans-Bold.ttf OpenSans-Bold.ttf
ADD https://github.com/ONSdigital/highcharts-export-docker/raw/feature/node/fonts/OpenSans-ExtraBold.ttf OpenSans-ExtraBold.ttf
ADD https://github.com/ONSdigital/highcharts-export-docker/raw/feature/node/fonts/OpenSans-Italic.ttf OpenSans-Italic.ttf
ADD https://github.com/ONSdigital/highcharts-export-docker/raw/feature/node/fonts/OpenSans-LightItalic.ttf OpenSans-LightItalic.ttf
ADD https://github.com/ONSdigital/highcharts-export-docker/raw/feature/node/fonts/OpenSans-BoldItalic.ttf OpenSans-BoldItalic.ttf
ADD https://github.com/ONSdigital/highcharts-export-docker/raw/feature/node/fonts/OpenSans-SemiboldItalic.ttf OpenSans-SemiboldItalic.ttf
ADD https://github.com/ONSdigital/highcharts-export-docker/raw/feature/node/fonts/OpenSans-ExtraBoldItalic.ttf OpenSans-ExtraBoldItalic.ttf
WORKDIR /

EXPOSE 8080
ENTRYPOINT ["highcharts-export-server", "--enableServer", "1", "--port", "8080"]
