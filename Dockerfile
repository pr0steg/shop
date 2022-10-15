FROM martinkaburu/python3.7-alpine
MAINTAINER Name Surname

ENV PYTHONUNBUBUFERED 1

COPY ./requirements.txt /requirements.txt

RUN pip install -r /requirements.txt

RUN mkdir /app
WORKDIR /app
COPY ./app /app

RUN adduser -D user
RUN chown user:user -R /app/

USER user