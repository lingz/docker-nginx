FROM ubuntu:14.04

MAINTAINER "Lingliang Zhang" lingliangz@gmail.com

# Install Nginx

# Update the repository
RUN apt-get update

# Download and Install Nginx
RUN apt-get install -y nginx

# Remove the default Nginx configuration file
RUN rm -v /etc/nginx/nginx.conf

# Copy a configuration file from the current directory
ADD nginx.conf /etc/nginx/

# Append "daemon off;" to the beginning of the configuration
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

# Expose ports
EXPOSE 80

# Set the default command to execute
CMD service nginx start
