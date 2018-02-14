FROM python:3-alpine
MAINTAINER Ixia NetServices

RUN apk add --update git openssh bash jq curl

COPY requirements.txt /tmp
RUN pip3 install -r /tmp/requirements.txt

COPY config.py.template /root/config.py
COPY gen.py /root/gen.py

WORKDIR /root

ENTRYPOINT ["python3", "gen.py"]
