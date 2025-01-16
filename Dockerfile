FROM python:3.13.1-slim-bookworm

# Set environment variables 
# Prevents Python from writing pyc files to disk
ENV PYTHONDONTWRITEBYTECODE=1
#Prevents Python from buffering stdout and stderr
ENV PYTHONUNBUFFERED=1

WORKDIR /var/tmp/test

COPY requirements.txt .
RUN pip install --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8000

# CMD['/usr/bin/bash']
# CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

# Start the application using Gunicorn
CMD ["gunicorn", "--bind", "127.0.0.1:8000", "--workers", "3", "message_tag_parser.wsgi:application"]
