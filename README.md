

## Build and Start Service
To build and start the Airflow and Postgres services, run the following commands:
```
docker-compose build
docker-compose up
```

## Check Logs
To monitor the logs of the running services, you can use the following commands:
```
docker logs airflow

docker logs postgres_db
```

## Create Airflow User
If you need to create a new Airflow admin user. This command enters the Airflow container and creates a new admin user with the username admin and password admin.
```
docker exec -it airflow /bin/bash

airflow users create --username admin --firstname <firstname> --lastname <lastname> --email <email> --role Admin --password admin
```
