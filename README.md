# Kudu Docker
Docker image for [Apache Kudu](https://github.com/apache/kudu)

Image can be found on [DockerHub](https://hub.docker.com/r/amfoerster/apache-kudu/)

## Getting Started

```
docker run -t -d --rm --name apache-kudu -p 7051:7051 -p 7050:7050 -p 8051:8051 -p 8050:8050 amfoerster/apache-kudu

```

Kudustarts by default. To have Kudu not start pass `-e KUDU_START=false`,
Kudu can then be started manually:

```
docker exec -it apache-kudu /kudu-start

```



