# Build stage
# Using Maven with Eclipse Temurin 21
FROM maven:3.9.9-eclipse-temurin-21 AS build
WORKDIR /app
COPY . .
# Compile the application and skip tests
RUN mvn clean package -DskipTests

# Package stage
# Using Eclipse Temurin 21 JDK on Alpine for a smaller final image
FROM eclipse-temurin:21-jdk-alpine
WORKDIR /app
# Copy the built JAR file from the build stage
COPY --from=build /app/target/facebookapi-0.0.1-SNAPSHOT.jar app.jar
# Expose the application port
EXPOSE 8080
# Define the startup command
ENTRYPOINT ["java", "-jar", "app.jar"]
