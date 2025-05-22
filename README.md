# docker-image-and-containers

# Containerizing a Static HTML Application using Docker

## Steps Followed:

I created a simple static HTML webpage with a CSS file inside a folder named `html`. Using Docker, I wrote a Dockerfile that uses the official lightweight NGINX base image (`nginx:1.25-alpine`) to serve the files. I created a non-root user for security and granted it the necessary permissions. I then built the Docker image using `docker build` and ran the container using Docker Compose with port 8081 mapped to the container’s port 80.

## Use of Volume / Bind Mount:

To demonstrate volume usage, I mounted the local `html/` folder as a read-only volume to `/usr/share/nginx/html` using Docker Compose. This allowed me to update HTML or CSS files locally and immediately reflect the changes inside the container without rebuilding the image. The volume entry looked like:
```
volumes:
  - ./html:/usr/share/nginx/html:ro
```

## Challenges and Solutions:

One key challenge was that NGINX failed to start when run as a non-root user due to permission issues writing its PID file to `/var/run/nginx.pid`. To solve this, I customized the container’s startup command:
```
CMD ["nginx", "-g", "daemon off; pid /tmp/nginx.pid;"]
```
This redirected the PID to a writable directory (`/tmp`) and resolved the issue.

Another minor issue was the GitHub Codespaces Ports tab not showing port 8081 automatically. I resolved this by manually adding and opening the port in the UI.

In conclusion, the application is fully containerized, follows Docker best practices, and uses environment variables, non-root execution, and volume mounts correctly.
