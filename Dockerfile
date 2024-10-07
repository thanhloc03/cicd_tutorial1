# Use the latest Ubuntu image
FROM ubuntu:latest

# Set maintainer label
LABEL maintainer="Tuan Thai <tuanthai@example.com>"

# Update package list and install required packages
RUN apt-get update -y && \
    apt-get install -y python3-pip python3-dev build-essential python3-venv && \
    apt-get clean

# Create a directory for the application
RUN mkdir /flask_app

# Set the working directory
WORKDIR /flask_app

# Copy the application code to the container
COPY . /flask_app

# Create a virtual environment
RUN python3 -m venv venv

# Install the Python dependencies
RUN ./venv/bin/pip install --no-cache-dir -r requirements.txt

# Command to run the application (update as needed)
CMD ["./venv/bin/python", "flask_docker.py"]
