FROM ubuntu

WORKDIR /app

RUN apt update && apt install -y python3-venv python3-pip

COPY requirements.txt requirements.txt

RUN pip3 install -r requirements.txt

COPY . .

EXPOSE 5000

CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]
