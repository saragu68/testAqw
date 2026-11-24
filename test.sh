#!/bin/bash

ami_id="ami-0055977a6e828a4f4"
instance_type="t3.micro"
domain_name="daws92.store"
hosted_zone_id="Z08369503H464LJ772ODN"

for instance in "$@"
do
    echo "Creating instance: $instance"

    instance_id=$(aws ec2 run-instances \
        --image-id "$ami_id" \
        --instance-type "$instance_type" \
        --security-group-ids "sg-0cb7138403dda788c" \
        --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$instance}]" \
        --query 'Instances[0].InstanceId' \
        --output text
    )

    echo "$instance instance id is $instance_id"

    if [ $instance != "frontend" ]; then
         Ip=$( aws ec2 describe-instances \
         --instance.ids "$instance_id" \
         --query "Reservations[].Instances[].privateIpAddress" \
          --output text
          )
          r53_record="$instance.$domain_name"
          else
           Ip=$( aws ec2 describe-instances \
         --instance.ids "$instance_id" \
         --query "Reservations[].Instances[].PublicIpAddress" \
          --output text
          )
          r53_record="$domain_name"
          echo "r53 record ${r53_record}"
        fi
    #
done