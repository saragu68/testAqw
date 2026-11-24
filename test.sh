#!/bin/bash

ami_id="ami-0055977a6e828a4f4"
instance_type="t3.micro"
domain_name="daws92.store"
hosted_zone_id="Z08369503H464LJ772ODN"

for instance in "$@"
do
echo "creating instance ..."
instance_id=$(aws ec2 run-instances \
 --image-id $ami_id \
 --instance-type $instance_type \ 
 --security-groups "roboshop-common-sg" \
 --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=roboshop-fromScript}]" \
 --query ‘Instance[0].InstanceId’ \
 --output text
)
echo "mongodb instance id is $instance_id"
done