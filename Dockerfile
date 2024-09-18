FROM openjdk:8-jdk-alpine
LABEL authors="Gabriel Cerioni"

# Set environment variables for proxy and target
ENV PROXY_HOST=""
ENV PROXY_PORT=""
ENV PROXY_USER=""
ENV PROXY_PASS=""

# Copy the JAR into the image
COPY target/sslPoke*.jar /usr/src/sslPoke.jar
COPY entrypoint.sh /usr/src/entrypoint.sh

# Give execution permission to the entrypoint script
RUN chmod +x /usr/src/entrypoint.sh

# Set the default working directory
WORKDIR /usr/src

# Define the entrypoint script
ENTRYPOINT ["./entrypoint.sh"]

# Define the default command for the entrypoint script
CMD ["ipc.claro.com.br", "443"]