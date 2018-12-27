# ============ Builder image ===================
FROM gcr.io/testing-226112/spring-boot-hello-world-builder:1591eef.a26ef494-cdf4-4946-97d2-6c9a3eeb1b60 as builder

WORKDIR /app

COPY . .

RUN ./gradlew build

# ============ Production image ===================
FROM openjdk:11-jre-slim

RUN adduser --system app --home /app
USER app

WORKDIR /home/app

COPY --from=builder /app/build/libs/hello-world-*.jar hello-world.jar
COPY --from=builder /app/src/main/resources/application.properties application.properties

EXPOSE 8080

ENTRYPOINT [ "sh", "-c", "java -jar hello-world.jar" ]