FROM python:3.7.3-stretch

ENV PYTHONUNBUFFERED 1

WORKDIR /app

# Create and activate a virtual environment
RUN python -m venv venv
RUN /bin/bash -c "source venv/bin/activate"

# Install required packages from requirements.txt
COPY requirements.txt .
RUN pip install -r requirements.txt

# Copy the rest of the application files
COPY . .

EXPOSE 8000

CMD ["venv/bin/python", "manage.py", "runserver", "0.0.0.0:8000"]
