# Panoramic Trekking App

## Running As A Test Django Applications

Set Up Virtualenv:

`virtualenv --python=<path_to_python3> venv`

Activate the environment:

`source venv/bin/activate`

Install requirements:

`pip install -r requirements.txt`

Start up a postgres instance:

`docker run --rm -d --name postgres-test -e POSTGRES_PASSWORD=docker -p 5432:5432 postgres`

Log into the database and Set up the postgres databases and users:
```
psql postgres -h localhost -U postgres
create user pta_user with password 'pta_password’;
create database pta_database with owner pta_user;
grant all privileges on all tables in schema public to pta_user;
```

Export Your Variables
```
export SQL_ENGINE=django.db.backends.postgresql
export SQL_DATABASE=pta_database
export SQL_USER=pta_user
export SQL_PASSWORD=pta_password
export SQL_HOST=localhost
export SQL_PORT=5432
```

Django migrate and run the server:
```
python manage.py makemigrations
python manage.py migrate 
python manage.py shell -c "from django.contrib.auth.models import User; User.objects.filter(username='admin').exists() or User.objects.create_superuser('admin','admin.admin@example.com', 'changeme')"
python manage.py runserver 0.0.0.0:8000
```

Go to the url 0.0.0.0:8000 to test 

## How To Use The Application
- Log into the admin interface to add content at 0.0.0.0:8000/admin
- View images and content from the 0.0.0.0:8000/photo_viewer

## Running The Application With Docker and Docker Compose
The sample docker-compose.yml script runs the Django Application
and also brings up a Database...It automates the process of creating the
specific users and databases on postgres before handling the migration.

```
docker-compose build
...
docker-compose up -d
```

## Things to do
- Nginx Proxy for project
- Correct layout
- Set up testing
- Set up redis caching
- Set up producting server
- Document - DONE
- Postgresql database - DONE
- Dockerise App - DONE
- docker-compose - DONE
- admin username and password for Django(secure) - DONE
- sql username and passwords(secure) - DONE

