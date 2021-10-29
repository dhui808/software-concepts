docker pull postgres
docker run --name postgres -e POSTGRES_PASSWORD=postgres -p 5432:5432 -d postgres
docker exec -it postgres /bin/bash
Connect to PostgreSQL database (Acces the postgres Shell)  
psql  -U postgres -W
List available databases: \l
List available tables: \dt
Switch connection to a new database: \c 
Describe a table: \d users
Quit psql: \q

Change the user to postgres: su - postgres
Create database test: createdb test
Copy file from local to Docker container:
docker cp schema.sql f9baabe899cb:/schema.sql
Execute sql file: psql -d test -a -f /schema.sql
