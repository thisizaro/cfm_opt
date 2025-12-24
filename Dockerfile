# Start FastAPI
FROM cfm

ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8

# Install Python and pip
RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    rm -rf /var/lib/apt/lists/*

# Install Python dependencies
RUN pip3 install --no-cache-dir fastapi uvicorn python-multipart

# Create app directory
WORKDIR /app

# Copy FastAPI code
COPY app/ /app/

# Expose API port
EXPOSE 8000

# Start FastAPI
ENTRYPOINT ["uvicorn"]
CMD ["main:app", "--host", "0.0.0.0", "--port", "8000"]