#!/usr/bin/env bash
#
# ec2-elb-asg.sh - creates a clouformation stack @ aws
#
# Author: 	Rodrigo Alvares de Souza
# 			rsouza01@gmail.com
#
# History:
# Version 1.0: 2020/01/27 (rsouza) - First version

STACK_NAME=EC2ELBASG
TEMPLATE_FILE=ec2-elb-asg.yml
PROFILE=aws-studies
REGION=us-east-1
	
create_stack=0
destroy_stack=0
smoke_test=0

if [ "$1" = "-c" ] || [ "$1" = "--create" ]; then
	create_stack=1
	destroy_stack=0
elif [ "$1" = "-d" ] || [ "$1" = "--destroy" ]; then
	destroy_stack=1
	create_stack=0
fi

if [ "$2" = "-s" ] || [ "$2" = "--smoke-test" ]; then
	echo '*** Smoke test mode ***'
	smoke_test=1
fi

if [ $create_stack = 1 ]; then
	echo 'Creating stack...'

	if [ $smoke_test = 0 ]; then
		aws cloudformation deploy \
			--profile $PROFILE \
			--region $REGION \
			--template-file $TEMPLATE_FILE \
			--capabilities CAPABILITY_IAM \
			--stack-name $STACK_NAME \
			--output json
			#  \
			# --parameters file:///ec2-elb-asg.json
	
	fi
	echo 'Done.'
elif [ $destroy_stack = 1 ]; then
	echo 'Destroying stack...'
	if [ $smoke_test = 0 ]; then
		aws cloudformation delete-stack --profile $PROFILE --region $REGION --stack-name $STACK_NAME
	fi
	echo 'Done.'
fi

exit 0