# Use Python 3.9
FROM python:3.9.12

# Allow statements and log messages to immediately appear in the Knative logs
ENV PYTHONUNBUFFERED True

# Copy requirements.txt to the docker image and install packages
COPY requirements.txt /
RUN pip install -r requirements.txt

# Set the WORKDIR to be the folder
COPY . /textanalyser

# Expose port 5000
#EXPOSE 5000
#ENV PORT 5000
WORKDIR /textanalyser

# Use gunicorn as the entrypoint
#CMD exec gunicorn --bind :$PORT main:app --workers 1 --threads 1 --timeout 0
CMD exec gunicorn --bind :$PORT --workers 1 --worker-class uvicorn.workers.UvicornWorker  --threads 8 main:app