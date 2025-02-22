FROM python:3.9-slim
COPY requirements.txt /
RUN pip3 install --upgrade pip && pip3 install -r /requirements.txt
COPY . /app
WORKDIR /app
EXPOSE 8000
CMD flask db upgrade && gunicorn  app:cli -w 2 --threads 2 -b 0.0.0.0:8000
