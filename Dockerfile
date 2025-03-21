FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Install system dependencies for networking, SSL, and pip
RUN apt-get update && apt-get install -y \
    build-essential \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Copy your project files into the image
COPY . .

# Install Python dependencies using requirements.txt
RUN pip install --upgrade pip --trusted-host pypi.org --trusted-host files.pythonhosted.org \
    && pip install -r requirements.txt --trusted-host pypi.org --trusted-host files.pythonhosted.org

# Expose Streamlit default port
EXPOSE 8501

# Run the Streamlit app
CMD ["streamlit", "run", "app.py", "--server.port=8501", "--server.enableCORS=false"]
