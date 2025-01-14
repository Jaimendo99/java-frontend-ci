# Use a Maven base image with OpenJDK 17
FROM maven:3.9.4-eclipse-temurin-17 as builder
WORKDIR /app

# Copy the project files
COPY pom.xml .
RUN mvn dependency:go-offline

# Copy source files and build the app, including Vaadin frontend preparation
COPY src ./src
RUN mvn vaadin:prepare-frontend package -DskipTests

# Use a smaller OpenJDK image for runtime
FROM eclipse-temurin:17-jre
WORKDIR /app
COPY --from=builder /app/target/*.jar app.jar

# Expose the application port
EXPOSE 8080

# Command to run the application
CMD ["java", "-jar", "app.jar"]


