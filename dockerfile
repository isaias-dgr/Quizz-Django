FROM python:3.10-alpine

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN apk update \
    && apk add --no-cache mariadb-connector-c-dev gcc musl-dev make \
    &&  pip install --upgrade pip \
    && pip install mysqlclient \
    && pip install debugpy \
    && pip install -r requirements.txt 

COPY . .

EXPOSE 8000

CMD ["make", "run"]