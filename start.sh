#!/bin/bash
RABBIT_MQ_HOST="${RABBIT_MQ_HOST:-localhost}"
RABBIT_MQ_PORT="${RABBIT_MQ_PORT:-5672}"

trap exit SIGHUP SIGINT SIGTERM

while ! nc -z $RABBIT_MQ_HOST $RABBIT_MQ_PORT; do sleep 3; done
ruby runner.rb
