FROM python:3.8-slim

WORKDIR /usr/src/app

COPY requirements.txt ./
COPY main.py ./src/

RUN pip install --no-cache-dir -r requirements.txt

CMD [ "python", "./src/main.py" ]
