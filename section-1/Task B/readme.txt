
This project packages a Flask web application into a portable Docker container. By using a containerized approach, 
we ensure that the application runs identically across development, testing, and production environments without 
"it works on my machine" issues.



Key Components

    Dockerfile: Uses a lightweight python:3.11-slim base image to minimize the attack surface and image size. It implements layer caching by copying requirements.txt and installing dependencies before copying the application source code.

    Docker Compose: Orchestrates the deployment. It maps port 8000 on the host to port 8000 in the container, allowing external access to the Flask API.

    Optimizations:

        Uses --no-cache-dir during the pip install to keep the image lean.

        Uses WORKDIR to ensure a consistent file structure inside the container.




How to Run

    Build and Start: docker-compose up --build

    Access the App: Navigate to http://localhost:8000