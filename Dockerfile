# Use an OpenJDK image as the base
FROM openjdk:21.0.5

# Copy the generated JAR file to the container
COPY build/libs/buildSrc.jar app.jar

# Set the working directory inside the container
WORKDIR /app

# Copy all project files into the container
COPY . .

# Build the application using Gradle
RUN ./gradlew build

# Run the application
CMD ["./gradlew", "bootRun"]

# Command to run the application
CMD ["java", "-jar", "app.jar"]
