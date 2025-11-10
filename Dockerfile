# Multi-stage build for Spring Boot (WAR-based web app)
FROM maven:3.9.8-eclipse-temurin-17 AS builder
WORKDIR /app

# Copy the Maven config and source
COPY pom.xml .
COPY src ./src

# Build the WAR file (skip tests)
RUN mvn clean package -DskipTests

# Runtime stage
FROM eclipse-temurin:17-jre
WORKDIR /app

# Copy the built WAR
COPY --from=builder /app/target/*.war app.war

# Render provides PORT dynamically
ENV PORT=10000
EXPOSE 10000

# Run the app on Render’s assigned port
CMD ["sh", "-c", "java -Dserver.port=${PORT:-10000} -jar /app/app.war"]
