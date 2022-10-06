#!/bin/sh -e
cat /etc/rabbitmq/rabbitmq.conf |\
    sed "s@#default_user = <default_user>#@default_user = $RMQ_USER@g" |\
    sed "s@#default_pass = <default_pass>#@default_pass = $RMQ_PASS@g" |\
    sed "s@#mqtt.default_user = <mqtt.default_user>#@mqtt.default_user = $RMQ_USER@g" |\
    sed "s@#mqtt.default_pass = <mqtt.default_pass>#@mqtt.default_pass = $RMQ_PASS@g" |\
	sed "s@#stomp.default_user = <stomp.default_user>#@stomp.default_user = $RMQ_USER@g" |\
	sed "s@#stomp.default_pass = <stomp.default_pass>#@stomp.default_pass = $RMQ_PASS@g" |\
    sed "s@#amqp1_0.default_user = <amqp1_0.default_user>#@amqp1_0.default_user = $RMQ_USER@g" > /tmp/test.conf

mv /tmp/test.conf /etc/rabbitmq/rabbitmq.conf

exec "$@"