#!/bin/bash

mkdir -p /var/log/container_supervisor/
touch /var/log/container_supervisor/execution.log

# Redirect all output to log file
exec >> /var/log/container_supervisor/execution.log
target_container_name=$1
sudo yum -y update
sudo yum install -y docker python3 python3-pip

pip3 install docker

curl -L | python3 $target_container_name