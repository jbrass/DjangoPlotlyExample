FROM python:3.9-slim
RUN apt-get update && apt-get install python3-dev build-essential pkg-config git ca-certificates curl gnupg -y
ENV APP_HOME /app
WORKDIR $APP_HOME
# Removes output stream buffering, allowing for more efficient logging
ENV PYTHONUNBUFFERED 1

COPY . .

# Install dependencies
COPY requirements.txt .
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# EXPOSE 8000
# CMD ["sh", "python3", "manage.py", "runserver", "0.0.0.0:8000"]
EXPOSE 8002
CMD ["sh", "./runserver.sh"]
