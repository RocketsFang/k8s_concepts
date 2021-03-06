#!/bin/bash

echo "The container[$(hostname)] is starting ..."
echo "Container[$(hostname)] host alias info ..."
cat /etc/hosts

data_file=$1
echo "Data file is: " $data_file
need_run_nodejs=$2
echo "Need nodejs: " $need_run_nodejs

sigterm_handler() {
  echo "Capture termination signal, container[$(hostname)] will be terminated ..."
  mv $data_file "$data_file"_$(date +"%F_%T")
  COUNTER=1
  while [ true ]; do
    echo "Time used to terminate - $(hostname): " $COUNTER " seconds..."
    let COUNTER=$COUNTER+1
    sleep 1
  done
  exit $?
}

generate_data(){
  COUNTER=1
  echo "### this is the nodejs app file database" 1> $data_file
  while [ true ]; do
    echo "This is the " $COUNTER "th line." 1>> $data_file
    let COUNTER=$COUNTER+1
    sleep 5
  done
}

if [ "$need_run_nodejs"x == "yes"x ]; then
  nodejs /opt/k8s_concepts_nodejs/server/server.js &
fi

##trap 'kill ${!}; sigterm_handler' SIGTERM
trap sigterm_handler SIGTERM

generate_data