#!/bin/bash
#Ansible Master userdata
sudo apt update -y
sudo apt install python -y
sudo apt update -y
sudo apt install python-pip -y
sudo apt update -y
sudo apt install ansible -y
cp /tmp/srimul.pem ~/.ssh/srimul.pem
chmod 400 ~/.ssh/srimul.pem
ssh-add ~/.ssh/srimul.pem
ssh-agent bash

