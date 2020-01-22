#!/usr/bin/env bash


#aws cloudformation describe-stack-events --profile aws-studies --region us-east-1 --stack-name EC2TUTORIAL

#aws cloudformation delete-stack --profile aws-studies --region us-east-1 --stack-name EC2TUTORIAL

# aws cloudformation deploy \
#   --profile aws-studies \
#   --region us-east-1 \
# 	--template-file ec2.yaml \
# 	--capabilities CAPABILITY_IAM \
# 	--stack-name EC2TUTORIAL


aws cloudformation deploy \
  --profile aws-studies \
  --region us-east-1 \
	--template-file ec2-elb-asg.yml \
	--capabilities CAPABILITY_IAM \
	--stack-name EC2ELBASG

#aws cloudformation delete-stack --profile aws-studies --region us-east-1 --stack-name EC2ELBASG
