FROM logstash:7.12.0

# Define environment variables
ENV MONGODB_USERNAME=${MONGODB_USERNAME}
ENV MONGODB_PASSWORD=${MONGODB_PASSWORD}
ENV MONGODB_HOST=${MONGODB_HOST}
ENV MONGODB_PORT=${MONGODB_PORT}
ENV MONGODB_DATABASE=${MONGODB_DATABASE}
ENV MONGODB_COLLECTION=${MONGODB_COLLECTION}

# Set inbound and outbound firewall rules
EXPOSE 9600/tcp

RUN logstash-plugin install logstash-input-mongodb

# RUN rm -f /usr/share/logstash/pipeline/logstash.conf

COPY pipeline/ /usr/share/logstash/pipeline/
# COPY config/ /usr/share/logstash/config/


# Start Logstash and read input from MongoDB
CMD ["logstash", "-f", "/usr/share/logstash/pipeline/logstash.conf"]


