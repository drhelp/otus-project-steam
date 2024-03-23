from airflow import DAG
from airflow.operators.bash_operator import BashOperator
from datetime import datetime, timedelta

default_args = {
    'owner': 'airflow',
    'depends_on_past': False,
    'start_date': datetime(2024, 3, 20),
    'email_on_failure': False,
    'email_on_retry': False,
    'retries': 1,
    'retry_delay': timedelta(minutes=5),
}

dag = DAG(
    'dbt_build_dag',
    default_args=default_args,
    description='Main dag to build DWH',
    schedule_interval=timedelta(days=1),
)

dbt_build = BashOperator(
    task_id='dbt_build',
    bash_command='cd /opt/dbt-projects/steam_dwh && dbt build',
    dag=dag,
)
