# Use AdoptOpenJDK 8 as base image
FROM adoptopenjdk:8-jdk-hotspot

# Set the working directory in the container
WORKDIR /app

# Copy Gradle Wrapper files
COPY gradlew .
COPY gradle ./gradle

# Copy project files and directories
COPY build.gradle .
COPY settings.gradle .
COPY src ./src

# Grant execute permission for Gradle Wrapper
RUN chmod +x gradlew

# Build the application
RUN ./gradlew build

# Command to run the application
CMD ["java", "-jar", "build/libs/your-application.jar"]
