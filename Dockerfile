# Use an official Ubuntu base image
FROM ubuntu:latest    

# Install Apache and clean up cache to reduce image size
RUN apt-get update -y && \
    apt-get install apache2 -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy current directory contents into the Apache web directory
COPY . /var/www/html/

# Expose port 4000 to the outside
EXPOSE 4000

# Start Apache in the foreground when the container starts
CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]

