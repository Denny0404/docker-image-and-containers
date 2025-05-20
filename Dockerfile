# Use lightweight NGINX image
FROM nginx:1.25-alpine

LABEL maintainer="denish@example.com"

# Create a non-root user
RUN adduser -D -g 'www' myuser

# Copy your HTML files into the nginx html directory
COPY index.html /usr/share/nginx/html/
COPY style.css /usr/share/nginx/html/

# Fix permissions for nginx to run as non-root
RUN mkdir -p /var/cache/nginx /var/run && \
    chown -R myuser:myuser /usr/share/nginx/html /etc/nginx /var/cache/nginx /var/run

# Switch to non-root user
USER myuser

# Expose port 80
EXPOSE 80
