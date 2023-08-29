FROM python:3.7.3-stretch

ENV PYTHONUNBUFFERED 1

WORKDIR /app

# Install virtualenv and create a virtual environment
RUN pip install virtualenv
RUN virtualenv venv

# Activate the virtual environment
RUN . venv/bin/activate

# Install required packages
COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . .

EXPOSE 8000

CMD ["gunicorn", "--bind", "0.0.0.0:8000"]
