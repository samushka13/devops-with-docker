FROM maven:3.9.11-amazoncorretto-8 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

FROM amazoncorretto:8
WORKDIR /app
COPY --from=build /app/target/docker-example-1.1.3.jar .
CMD ["java", "-jar", "docker-example-1.1.3.jar"]
