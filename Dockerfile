FROM maven:3.9.8-eclipse-temurin-17 AS builder
WORKDIR /app

# Copy Maven project from subdirectory
COPY pom.xml .
COPY MathAssistant/src ./src

RUN mvn clean package -DskipTests

FROM eclipse-temurin:17-jre
WORKDIR /app

COPY --from=builder /app/target/*.war app.war

ENV PORT=10000
EXPOSE 10000

CMD ["sh", "-c", "java -Dserver.port=${PORT:-10000} -jar /app/app.war"]
