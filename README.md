# highcharts-export-docker

This repo contains what is required to build the docker image for the highcharts export server. It uses the more recent node implementation of the highcharts export server: 

https://github.com/highcharts/node-export-server

If you want to skip the build phase and get a container running there is an automatic build setup on dockerhub. Any commits to this repo will automatically build a new container here:

https://hub.docker.com/r/onsdigital/highcharts-export-node/

## Build

```
docker build -t onsdigital/highcharts-export-node . 
```

## Run

```
docker run -d --name highcharts -p 8889:8080 onsdigital/highcharts-export-node
```
The above command will expose the service on port 8889. This can be changed if required.

## Test

Once the server is running here is an example curl command to render a chart:
```
curl -H "Content-Type: application/json" -X POST -d '{"infile":{"title": {"text": "Steep Chart"}, "xAxis": {"categories": ["Jan", "Feb", "Mar"]}, "series": [{"data": [29.9, 71.5, 106.4]}]}}' 127.0.0.1:8889 -o testchart.png
```
