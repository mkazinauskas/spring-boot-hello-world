# ============ Builder image ===================
FROM openjdk:8-jdk-alpine as builder

WORKDIR /app

COPY . .

RUN ls -a

RUN ./gradlew build

# ============ Production image ===================
FROM openjdk:8-jdk-alpine

RUN adduser --system app --home /app
USER app

WORKDIR /home/app

COPY --from=builder /app/build/libs/hello-world-*.jar hello-world.jar
COPY --from=builder /app/src/main/resources/application.properties application.properties

EXPOSE 8080

ENTRYPOINT [ "sh", "-c", "java -jar hello-world.jar" ]