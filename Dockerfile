# https://github.com/tiangolo/uvicorn-gunicorn-fastapi-docker

FROM tiangolo/uvicorn-gunicorn-fastapi:python3.8-slim

# set environment variables
ENV PYTHONWRITEBYTECODE 1
ENV PYTHONBUFFERED 1

# set working directory
WORKDIR /code

# copy dependencies
COPY requirements.txt /code/

# install dependencies
RUN pip install -U pip
RUN pip install -r requirements.txt

# copy project
COPY . /code/
RUN chmod 755 /code/entrypoint.sh

# run server
CMD ["/code/entrypoint.sh"]
