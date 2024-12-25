# Use an OpenJDK image as the base
FROM openjdk:17-jdk-slim

# Set the working directory inside the container
WORKDIR /app

# Copy only the Gradle wrapper and build files to the container
COPY gradlew gradlew.bat build.gradle settings.gradle gradle.properties ./
COPY gradle ./gradle

# Download dependencies (this step is cached unless dependencies change)
RUN ./gradlew dependencies

# Copy the entire project into the container
COPY . .

# Build the application using Gradle
RUN ./gradlew build

# Copy the generated JAR file to the container
COPY build/libs/buildSrc.jar

# Command to run the application
CMD ["java", "-jar", "app.jar"]