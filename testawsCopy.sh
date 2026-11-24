#! /bin/bash
ami_id="ami-0055977a6e828a4f4"
instance_type="t3.micro"
domain_name="daws92.store"
hosted_zone_id="Z08369503H464LJ772ODN"

for item in "$@" 
do
   echo "creating instance for $item ......"
   instandId=$(aws ec2 run-instances \
    --image-id "$ami_id" \
    --instance-type "$instance_type" \
    --security-group-ids "sg-0cb7138403dda788c" \
    --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$item}]" \
    --query 'Instances[0].InstanceId'\
    --output text
    )

     echo "instance id of $instance is $instandId"
done



