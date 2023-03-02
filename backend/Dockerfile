# Builder Open-JDK 19
FROM openjdk:19-slim-bullseye AS builder

# Install maven
RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y maven

# Copy source files
COPY . /app
WORKDIR /app

# Install maven deps & build
RUN mvn clean install

# Runner Open-JDK 19
FROM openjdk:19-slim-bullseye AS runner

# Copy jar file
COPY --from=builder /app/target/arosaje-0.0.1-SNAPSHOT.jar /app/arosaje.jar

# Define ENV config
ENV APP_PROFILE=prod
ENV APP_SERVER_PORT=9000
ENV APP_SPRING_APPLICATION_NAME=arosaje 

ENV APP_DATASOURCE_URL=jdbc:mysql://127.0.0.1:3306/arosaje
ENV APP_DATASOURCE_USERNAME=root
ENV APP_DATASOURCE_PASSWORD=root

ENV APP_SWAGGER_PATH=/swagger
ENV APP_SWAGGER_TAGS_SORTER=alpha
ENV APP_SWAGGER_OPERATIONS_SORTER=alpha

ENV APP_DOCS_PATH=/api-docs

# Entrypoint
ENTRYPOINT java -Dspring.profiles.active=$APP_PROFILE -Dserver.port=$APP_SERVER_PORT -Dspring.application.name=$APP_SPRING_APPLICATION_NAME -Dspring.jpa.hibernate.ddl-auto=update -Dspring.datasource.url=$APP_DATASOURCE_URL -Dspring.datasource.username=$APP_DATASOURCE_USERNAME -Dspring.datasource.password=$APP_DATASOURCE_PASSWORD -Dspring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver -Dspringdoc.swagger-ui.path=$APP_SWAGGER_PATH -Dspringdoc.swagger-ui.tags-sorter=$APP_SWAGGER_TAGS_SORTER -Dspringdoc.swagger-ui.operations-sorter=$APP_SWAGGER_OPERATIONS_SORTER -Dspringdoc.api-docs.path=$APP_DOCS_PATH -jar /app/arosaje.jar

