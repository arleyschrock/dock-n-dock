#!/bin/bash

INSECURE=""
SEP=""

for entry in $(env | grep REGISTRY | cut -d"=" -f2)
do
INSECURE="${INSECURE}${SEP}\"$entry\""
SEP=','    
done

if ! -d /etc/docker ; then 
mkdir /etc/docker
fi

echo adding $INSECURE
echo {\"insecure-registries\":[${INSECURE}]}
echo $(echo {\"insecure-registries\":[${INSECURE}]}) > /etc/docker/daemon.json

service docker restart

"$@"
