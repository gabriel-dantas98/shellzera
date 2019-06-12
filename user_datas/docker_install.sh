#!/bin/bash

echo 'Installing Docker...'

sudo yum -y update
sudo yum install -y docker
sudo service docker start
sudo chkconfig --add docker
sudo chkconfig docker on

sudo usermod -a -G docker ec2-user

echo 'Please reset your connection...'
