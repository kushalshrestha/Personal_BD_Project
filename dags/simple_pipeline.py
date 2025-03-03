from airflow import DAG
from airflow.operators.dummy_operator import DummyOperator
from airflow.operators.python_operator import PythonOperator
from datetime import datetime

def my_pipeline():
    print("Running the pipeline...")

default_args = {
    'owner': 'airflow',
    'retries': 1,
    'start_date': datetime(2025, 3, 2),
}

with DAG(
    'simple_big_data_pipeline',
    default_args=default_args,
    schedule_interval='@daily',
    catchup=False, # False -> will not do catchup on previous missed instances if paused, or down before. Runs the latest instance only
) as dag:
    start = DummyOperator(task_id='start')

    run_pipeline = PythonOperator(
        task_id='run_pipeline',
        python_callable=my_pipeline,
    )

    start >> run_pipeline
