#!/bin/bash

# need pod to configure with volume
logFile=/opt/datastore/data/preStop.log
echo "The container[$(hostname)] preStop 'ExecAction' is starting ..." 1> $logFile

sigterm_handler() {
  echo "Capture termination signal for preStop 'ExecAction', preStart shell will be terminated ..." 1>> $logFile
  COUNTER=1
  while [ true ]; do
    echo "Time used to terminate - preStop shell: " $COUNTER " seconds..." 1>> $logFile
    let COUNTER=$COUNTER+1
    sleep 1
  done
  exit $?
}

##trap 'kill ${!}; sigterm_handler' SIGTERM
trap sigterm_handler SIGTERM

duration=20
WORK_COUNTER=1
while [ true ]; do
    echo "Simulating works in preStop action duration[$duration] seconds: " $WORK_COUNTER " seconds..." 1>> $logFile
    let WORK_COUNTER=$WORK_COUNTER+1
    if [ $duration -le $WORK_COUNTER ]; then
      echo "The works in preStop action is done ..." 1>> $logFile
      break;
    fi
    sleep 1
done

echo "The container[$(hostname)] preStop 'ExecAction' is ending ..." 1>> $logFile