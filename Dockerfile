FROM ubuntu:20.04

# Set non-interactive mode for apt
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update -y && \
    apt-get install -y python3 python3-pip mysql-client && \
    apt-get clean

# Copy application files
COPY . /app
WORKDIR /app

# Upgrade pip and install dependencies without cache
RUN pip3 install --no-cache-dir --upgrade pip && \
    pip3 install --no-cache-dir -r requirements.txt

# Expose app port
EXPOSE 8080

# Run the app
ENTRYPOINT [ "python3" ]
CMD [ "app.py" ]
