#!/bin/bash
sudo bash
apt-get update -y && apt get upgrade -y
apt-get install apache2 awscli -y

# download from s3 bucket
aws s3 sync s3://zepsen-test /var/www/html