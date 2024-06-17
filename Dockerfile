# Use an Alpine Linux base image
FROM alpine:3.5

# Install Python and pip
RUN apk add --update py2-pip
RUN pip install --upgrade pip

# Install Python modules needed by the app
COPY requirements.txt /usr/src/app/
RUN pip install --no-cache-dir -r /usr/src/app/requirements.txt

# Copy app files
COPY app.py /usr/src/app/
COPY templates/index.html /usr/src/app/templates/

# Expose port 5000
EXPOSE 5000

# Run the application
CMD ["python", "/usr/src/app/run.py"]

