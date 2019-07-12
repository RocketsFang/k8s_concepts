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

duration=20
while [ true ]; do
    echo "Simulating works in preStop action duration[$duration] seconds: " $COUNTER " seconds..."
    let COUNTER=$COUNTER+1
    if [ $duration le $COUNTER ]: then
      "The works in preStop action is done ..."
      break;
    fi
    sleep 1
done

echo "The container[$(hostname)] preStop 'ExecAction' is ending ..."