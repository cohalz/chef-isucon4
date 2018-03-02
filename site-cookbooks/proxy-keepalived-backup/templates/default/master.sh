#!/bin/bash 
EIP=13.230.250.86
INSTANCE_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)

aws ec2 disassociate-address --public-ip $EIP 
aws ec2 associate-address --public-ip $EIP --instance-id $INSTANCE_ID
