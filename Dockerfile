from node:7.7.2

ENV ACCEPT_HIGHCHARTS_LICENSE="YES"
RUN npm install highcharts-export-server -g 

EXPOSE 8080

ENTRYPOINT ["highcharts-export-server", "--enableServer", "1", "--port", "8080"]
