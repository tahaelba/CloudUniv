FROM python:3.7-alpine

RUN apk update && apk add gcc libc-dev  libffi-dev libxml2-dev libxslt-dev   python3-dev py3-setuptools jpeg-dev zlib-dev 
RUN adduser -D admin

WORKDIR /home/flask

COPY requirements.txt requirements.txt
RUN python -m venv venv
RUN venv/bin/pip install --upgrade pip
RUN venv/bin/pip install wheel
RUN venv/bin/pip install gunicorn pymysql
RUN venv/bin/pip install Flask-Migrate
RUN venv/bin/pip install -U python-dotenv
RUN venv/bin/pip3 install gunicorn

RUN venv/bin/pip3 install --no-cache-dir -r requirements.txt

COPY flaskblog flaskblog

COPY run.py boot.sh ./
RUN chmod +x boot.sh

ENV FLASK_APP run.py

RUN chown -R admin:admin ./
USER admin

EXPOSE 5000
ENTRYPOINT ["./boot.sh"]
