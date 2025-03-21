# Use an official Python image
FROM python:3.12

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Create working directory
WORKDIR /app

# Copy files
COPY . /app/

# Install dependencies
RUN pip install --upgrade pip && \
    pip install -r requirements.txt

# Expose the port Streamlit runs on
EXPOSE 8501

# Run Streamlit
CMD ["streamlit", "run", "app.py", "--server.port=8501", "--server.enableCORS=false"]
