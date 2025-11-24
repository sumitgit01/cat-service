# ============================
# Stage 1 — Build the JAR
# ============================
FROM maven:3.9.9-eclipse-temurin-21 AS builder

# Set working directory
WORKDIR /app

# Copy pom.xml first (caching dependencies)
COPY pom.xml .
RUN mvn -B dependency:go-offline

# Copy source code
COPY src ./src

# Build the application
RUN mvn -B clean package -DskipTests

# ============================
# Stage 2 — Run the Application
# ============================
FROM eclipse-temurin:21-jdk-jammy

# Create working directory inside container
WORKDIR /opt/app

# Copy jar from builder stage
COPY --from=builder /app/target/*.jar app.jar

# Expose Spring Boot port
EXPOSE 8123

# Start the service
ENTRYPOINT ["java", "-jar", "app.jar"]
