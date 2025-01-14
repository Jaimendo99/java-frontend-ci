# Etapa 1: Construcción del JAR usando Maven
FROM maven:3.9.5-eclipse-temurin-17 as builder
WORKDIR /app

# Copia los archivos del proyecto
COPY pom.xml .
COPY src ./src

RUN mvn clean package -DskipTests

FROM eclipse-temurin:17-jre-alpine
WORKDIR /app

COPY --from=builder /app/target/*.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]