FROM ubuntu:20.04

# Install required system dependencies
RUN apt-get update -y && apt-get install -y \
    python3-pip \
    python3-dev \
    mysql-client \
    libmysqlclient-dev \
    && apt-get clean

# Set working directory
WORKDIR /app

# Copy the application files
COPY . .

# Upgrade pip and install dependencies
RUN pip3 install --upgrade pip
RUN pip3 install -r requirements.txt

# Expose the application port
EXPOSE 8080

# Start the Flask application
CMD ["python3", "app.py"]
