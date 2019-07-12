#!/bin/bash

# need pod to configure with volume
logFile=/opt/datastore/data/postStart.log
echo "The container[$(hostname)] postStart 'ExecAction' is executing ..." 1> $logFile

sigterm_handler() {
  echo "Capture termination signal for preStart 'ExecAction', postStart shell will be terminated ..." 1>> $logFile
  COUNTER=1
  while [ true ]; do
    echo "Time used to terminate - postStart shell: " $COUNTER " seconds..." 1>> $logFile
    let COUNTER=$COUNTER+1
    sleep 1
  done
  exit $?
}

##trap 'kill ${!}; sigterm_handler' SIGTERM
trap sigterm_handler SIGTERM

duration=20
while [ true ]; do
    echo "Simulating works in postStart action duration[$duration] seconds: " $COUNTER " seconds..." 1>> $logFile
    let COUNTER=$COUNTER+1
    if [ $duration -le $COUNTER ]; then
      "The works in postStart action is done ..." 1>> $logFile
      break;
    fi
    sleep 1
done

echo "The container[$(hostname)] postStart 'ExecAction' is ending ..." 1>> $logFile