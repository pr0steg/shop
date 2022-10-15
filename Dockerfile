FROM martinkaburu/python3.7-alpine
MAINTAINER Name Surname

ENV PYTHONUNBUBUFERED 1

COPY ./requirements.txt /requirements.txt

RUN pip install -r /requirements.txt

RUN mkdir /app
WORKDIR /app
COPY ./app /app

RUN adduser -D dockeruser
RUN addgroup -S appgroup && adduser -S dockeruser -G appgroup
RUN chown dockeruser:dockeruser -R /app/

USER dockeruser