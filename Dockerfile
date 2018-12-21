FROM openjdk:8-jdk-alpine

RUN adduser --system app --home /app
USER app

WORKDIR /home/app

ADD src/main/resources/application.properties application.properties
ADD build/libs/hello-world-*.jar hello-world.jar

ENTRYPOINT [ "sh", "-c", "java -jar hello-world.jar" ]