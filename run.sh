docker build -t logstash:7.12.0 .
docker run --rm -it  --env-file .env logstash:7.12.0