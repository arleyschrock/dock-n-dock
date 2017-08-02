#!/bin/bash

INSECURE=""
SEP=""

for entry in $(env | grep REGISTRY | cut)
do
INSECURE="${INSECURE}${SEP}\"$entry\"
SEP=','    
done

echo adding $INSECURE

echo {\"insecure-registries\":[$INSECURE]} > /etc/docker/daemon.json
systemctl restart docker

bash $@