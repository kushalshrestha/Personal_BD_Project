# Use the official Apache Airflow image from Docker Hub
FROM apache/airflow:2.5.0-python3.9

# Set the working directory
WORKDIR /usr/local/airflow

# Copy requirements file and install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy your DAGs into the container
COPY dags/ /usr/local/airflow/dags/

# Copy logs if desired
COPY logs/ /usr/local/airflow/logs/

# Set environment variables for Airflow
ENV AIRFLOW_HOME=/usr/local/airflow
ENV AIRFLOW__CORE__LOAD_EXAMPLES=False

# Start Airflow web server and scheduler
CMD ["bash", "-c", "airflow db init && airflow webserver & airflow scheduler"]
