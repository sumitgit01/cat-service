FROM openjdk:21-jdk-slim

# Set working directory
WORKDIR /app

# Copy JAR file
COPY target/*.jar .

# Expose HTTPS port
EXPOSE 8123

# Run the Spring Boot app
CMD ["java", "-jar", "*.jar"]
