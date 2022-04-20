FROM rabbitmq:3.9.15-management
USER root
ARG DEBIAN_FRONTEND=noninteractive
COPY init.sh /tmp/
COPY config /etc/rabbitmq/
RUN chmod u+x /tmp/init.sh
RUN rabbitmq-plugins enable rabbitmq_management rabbitmq_mqtt rabbitmq_web_mqtt rabbitmq_amqp1_0 rabbitmq_prometheus

ENTRYPOINT ["/tmp/init.sh"]

CMD ["rabbitmq-server"]
