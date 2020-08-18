FROM alpine:3.9.4

ENV AWS_ACCESS_KEY_ID=""
ENV AWS_SECRET_ACCESS_KEY=""
ENV AWS_DEFAULT_REGION=us-west-2

WORKDIR /anypush
RUN apk add 'python3<3.7' 'python3-dev<3.7'

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt --no-cache-dir

COPY . .
EXPOSE 587

ENTRYPOINT ["/usr/bin/python3", "/anypush/main.py"]
