# rabbitmq-mqtt

Defining mqtt and default user using env variable.

```yaml
version: '3.5'

services:        
    rabbitmq:
        image: buraketmen/rabbitmq-mqtt:latest
        hostname: rabbitmq
        networks:
            - proxy-net
        environment:
            TZ: Europe/Istanbul
            RMQ_USER: ${RABBITMQ_USERNAME} #will be used for amqp, mqtt, stomp user
            RMQ_PASS: ${RABBITMQ_PASSWORD} #will be used for amqp, mqtt, stomp user
            RABBITMQ_ERLANG_COOKIE: "your secret key"
            RABBITMQ_CONFIG_FILE: "/etc/rabbitmq/rabbitmq.conf"
        ports:
            - "1883:1883"
            - "5672:5672"
            - "15672:15672"
            - "15675:15675"
            - "61613:61613"
            - "61615:61615"

        volumes:
            - "rabbitmq-storage:/var/lib/rabbitmq"
            - "rabbitmq-logs:/var/log/rabbitmq"
        deploy:
            replicas: 1
            resources:
                reservations:
                    memory: 128M
            update_config:
                parallelism: 1
                failure_action: rollback
            restart_policy:
                condition: any

networks:
    proxy-net:
        driver: overlay
        name: proxy-net
        attachable: true
        
volumes:
    rabbitmq-storage:
        name: rabbitmq-storage
    rabbitmq-logs:
        name: rabbitmq-logs

```
