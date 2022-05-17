# Operating system for the docker to be generated Image :-
FROM python:3.8-slim-buster

WORKDIR /app

# Copying the requirements.txt of local to docker container's
COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

# Copying the whole current folder to the docker's, so that it can play django.
COPY . .

# We have to mention this command that the docker container has to run to be able 
# to run the django application and the significance of last element of the list
# is that it'd allow django app to run on local server also (i.e. outside of docker container)
CMD [ "python3", "manage.py", "runserver", "0.0.0.0:8000"]