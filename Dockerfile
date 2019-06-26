
FROM python:3.7

# Set the timezone to KST
RUN cat /usr/share/zoneinfo/Asia/Seoul > /etc/localtime

RUN set -ex \
    && apt-get clean && apt-get update \
    && apt-get install --no-install-recommends -y groff \
    && rm -rf /var/lib/apt/lists/*

ADD https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64 /usr/local/bin/jq

RUN chmod +x /usr/local/bin/jq

WORKDIR /usr/src/app

COPY requirements.txt ./

RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt
