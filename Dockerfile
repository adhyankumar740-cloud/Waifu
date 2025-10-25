# Base image
FROM python:3.10-slim

# Disable pip cache
ENV PIP_NO_CACHE_DIR=1

# Install dependencies
RUN apt update && apt install -y --no-install-recommends \
    git curl ffmpeg libpq-dev gcc python3-dev libffi-dev libssl-dev \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy all your bot files into container
# (Ye tab chalega jab tu apne repo ka code Render pe directly host karega)
COPY . /app

# Upgrade pip
RUN pip install --upgrade pip setuptools wheel

# Install Python dependencies
RUN pip install -r requirements.txt

# Expose port (optional, webhook ke liye)
EXPOSE 8080

# Start command (Render automatically runs this)
CMD ["python3", "-m", "shivu"]
