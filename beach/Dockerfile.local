FROM python:3.10.12

RUN apt update -y

RUN apt install -y cmake
COPY requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt \
    && rm /tmp/requirements.txt
