FROM python:3.7

ENV PYTHONUNBUFFERED 1

# create root directory for our project in the container
RUN mkdir /service

# Set the working directory to /service
WORKDIR /service

# Copy the current directory contents into the container at /service
ADD . /service/

# Install any needed packages specified in requirements.txt
RUN pip install -r requirements.txt
