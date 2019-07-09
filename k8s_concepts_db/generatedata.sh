#!/bin/bash

data_file=$1

sigterm_handler() {
  echo "Capture termination signal, and will backup the data file."
  mv $data_file "$data_file"_$(date +"%F_%T")
  exit $?
}

generate_data(){
  COUNTER=1
  echo "### this is the nodejs app file database" > $data_file
  while [ true ]; do
    echo "This is the " $COUNTER "th line." >> $data_file
    let COUNTER=$COUNTER+1
    sleep 5
  done
}

##trap 'kill ${!}; sigterm_handler' SIGTERM
trap sigterm_handler SIGTERM

generate_data