FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
    docker.io \
    maven \
    docker-compose \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . .

WORKDIR /app/ui2-custom/dcm4chee-arc-light-5.31.2/dcm4chee-arc-ui2

RUN mvn clean

RUN mvn package

WORKDIR /app

CMD ["docker-compose", "up"]
