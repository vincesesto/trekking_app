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


## Things to do
- Nginx Proxy for project
- Document - IN PROGRESS
- Postgresql database - DONE
- Correct layout
- Dockerise App - DONE
- docker-compose - BASIC DONE
- Set up testing
- admin username and password for Django(secure) - DONE
- sql username and passwords(secure)

