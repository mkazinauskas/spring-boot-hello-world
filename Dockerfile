FROM openjdk:8-jdk-alpine
ADD src/main/resources/application.properties /app/application.properties
ADD build/libs/hello-world-*.jar /app/hello-world.jar
WORKDIR /app
ENTRYPOINT [ "sh", "-c", "java -jar hello-world.jar" ]
