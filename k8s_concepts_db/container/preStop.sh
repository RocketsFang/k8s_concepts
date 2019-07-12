#!/bin/bash

echo "The container[$(hostname)] preStop 'ExecAction' is executing ..."

sigterm_handler() {
  echo "Capture termination signal for preStop 'ExecAction', preStart shell will be terminated ..."
  COUNTER=1
  while [ true ]; do
    echo "Time used to terminate - preStop shell: " $COUNTER " seconds..."
    let COUNTER=$COUNTER+1
    sleep 1
  done
  exit $?
}

##trap 'kill ${!}; sigterm_handler' SIGTERM
trap sigterm_handler SIGTERM

echo "The container[$(hostname)] preStop 'ExecAction' is ending ..."