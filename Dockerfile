# Use official MySQL 8.0 image as the base
FROM mysql:8.0

# Set environment variables to configure MySQL
ENV MYSQL_ROOT_PASSWORD=root_password
ENV MYSQL_DATABASE=blooddonation
ENV MYSQL_USER=flask_user
ENV MYSQL_PASSWORD=flask_password

# Expose MySQL default port
EXPOSE 3306

# Optionally: You can place custom SQL initialization files if needed
COPY ./init.sql /docker-entrypoint-initdb.d/
