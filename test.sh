#!/bin/bash

ami_id="ami-0055977a6e828a4f4"
instance_type="t3.micro"
domain_name="daws92.store"
hosted_zone_id="Z08369503H464LJ772ODN"

for instance in "$@"
do
echo "creating instance ..."
done