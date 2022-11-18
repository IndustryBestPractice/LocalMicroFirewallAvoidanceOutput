# For more information, please refer to https://aka.ms/vscode-docker-python
#FROM python:3.8-slim
FROM ubuntu:jammy

EXPOSE 8000

# Install all our crap
RUN apt-get update -y && apt-get install -y --no-install-recommends apt-utils mysql-client sqlite3 libsqlite3-dev python3 python3-pip golang nano cron gunicorn

# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE=1

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED=1

# Install pip requirements
COPY requirements.txt .
#RUN python -m pip install -r requirements.txt
RUN pip3 install -r requirements.txt

WORKDIR /lmfao
COPY /lmfao /lmfao

# Creates a non-root user with an explicit UID and adds permission to access the /app folder
# For more info, please refer to https://aka.ms/vscode-docker-python-configure-containers
RUN adduser -u 5678 --disabled-password --gecos "" appuser && chown -R appuser /lmfao
USER appuser

# Make changes to lmfao files so it's unique per installation
# RUN echo "from django.contrib.auth import get_user_model; User = get_user_model(); User.objects.create_superuser('admin', 'industrybestpractice2@gmail.com', 'admin')" | python3 manage.py shell
# Change time zone
# RUN sed -i "s/TIME_ZONE.*/TIME_ZONE = 'America\/New_York'/g" ./lmfao/settings.py
# Allow access from all hosts
# RUN sed -i "s/ALLOWED_HOSTS.*/ALLOWED_HOSTS = ['*']/g" ./lmfao/settings.py
# Generate new secret key
# sed -i "s/SECRET_KEY.*/SECRET_KEY = '$(cat /dev/urandom | tr -dc 'a-zA-Z0-9=*-+()^%#@!' | fold -w 50 | head -n 1)'/g" ./lmfao/settings.py
# Create a fresh DB to populate
# RUN rm -rf ./lmfao/db.sqlite3 && python3 manage.py migrate --run-syncdb

# During debugging, this entry point will be overridden. For more information, please refer to https://aka.ms/vscode-docker-python-debug
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "lmfao.wsgi"]
#CMD ["/bin/bash"]
