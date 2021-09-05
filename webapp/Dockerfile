FROM python:3.8

WORKDIR /flask-app

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY ./app ./app

ENV PYTHONUNBUFFERED=1

CMD ["python","./app/app.py"]
