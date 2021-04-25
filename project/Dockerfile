# pull official base image
FROM python:3.9.2-slim-buster

# set working directory
WORKDIR /usr/src/app

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install pipenv and system dependencies
RUN pip install pipenv
RUN apt-get update \
    && apt-get -y install netcat gcc \
    && apt-get clean

# install python dependencies
COPY ./Pipfile .
COPY ./Pipfile.lock .
RUN pipenv install --deploy --ignore-pipfile

# add app
COPY . .

# # add entrypoint.sh
# COPY ./entrypoint.sh .
# RUN chmod +x /usr/src/app/entrypoint.sh

# run entrypoint.sh
ENTRYPOINT [ "/usr/src/app/entrypoint.sh" ]
