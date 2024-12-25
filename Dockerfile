# Use an OpenJDK image as the base
FROM openjdk:17-jdk-slim

# Set the working directory inside the container
WORKDIR /app

# Copy all project files into the container
COPY . .

# Build the application using Gradle
RUN ./gradlew build

# Copy the generated JAR file to the container
COPY buildSrc/build/libs/buildSrc.jar /app/app.jar

# Command to run the application
CMD ["java", "-jar", "app.jar"]
