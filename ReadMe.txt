# Build docker image with name lmfao
docker build -t lmfao .

# start docker image with name django....
docker -it --rm -p 8000:8000 -v /lmfao/django:/usr/src --name django <id>

docker run -p 8000:8000 -v /lmfao/django:/usr/src -it --rm --name django 3307aa316dc0


# Notes for how to use lmfao - looooool

