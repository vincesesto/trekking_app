# trekking_app

## Running As A Test Applications

Set Up Virtualenv:

`virtualenv --python=<path_to_python3> venv`

Activate the environment:

`source venv/bin/activate`

Install requirements:

`pip install -r requirements.txt`

Start up a postgres instance:

`docker run --rm -d --name postgres-test -e POSTGRES_PASSWORD=docker -p 5432:5432 postgres`

Set up the postgres databases and users:
```
psql postgres -h localhost -U postgres
create user pta_user with password 'pta_password’;
create database pta_database with owner pta_user;
grant all privileges on all tables in schema public to pta_user;
```

Django migrate and run the server
- python manage.py makemigrations
- python manage.py migrate 
- python manage.py shell -c "from django.contrib.auth.models import User; User.objects.filter(username='admin').exists() or User.objects.create_superuser('admin','admin.admin@example.com', 'changeme')"
- python manage.py runserver 0.0.0.0:8000"

Go to the url 0.0.0.0:8000 to test 
