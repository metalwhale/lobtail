FROM python:3.10.12

COPY requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt \
    && rm /tmp/requirements.txt
