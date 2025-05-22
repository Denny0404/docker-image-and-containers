FROM nginx:1.25-alpine

LABEL maintainer="denish@example.com"

ENV AUTHOR="Denish Akbari"

# Create non-root user
RUN adduser -D -g 'www' myuser


# Set permissions for non-root user
RUN chown -R myuser:myuser /usr/share/nginx/html /etc/nginx /var/cache/nginx /tmp

# Switch to non-root
USER myuser

# Expose port
EXPOSE 80

# ✅ Override both ENTRYPOINT and CMD to fully control nginx startup
ENTRYPOINT []
CMD ["nginx", "-g", "daemon off; pid /tmp/nginx.pid;"]
