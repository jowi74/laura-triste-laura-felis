FROM python:3.13-slim

ENV PYTHONUNBUFFERED=1

WORKDIR /app

COPY requirements.txt .

RUN pip install --upgrade pip && \
    pip install -r requirements.txt

COPY . .

RUN python manage.py collectstatic --noinput

EXPOSE 8000

CMD ["gunicorn", "personalblog.wsgi:application", "--bind", "0.0.0.0:8000"]
