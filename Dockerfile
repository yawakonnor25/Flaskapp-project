
# Use an official Python runtime as the base image
FROM python:3.9-slim


# Set the working directory in the container
WORKDIR /app


RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y gcc default-libmysqlclient-dev pkg-config \
    && rm -rf /var/lib/apt/lists/*

# Copy the requirements file into the container
COPY  requirements.txt .

# Install app dependencies
RUN pip install -r requirements.txt
RUN pip install --no-cache-dir -r requirements.txt


COPY . .


CMD ["python","app.py"]


