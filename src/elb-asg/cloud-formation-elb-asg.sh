#!/usr/bin/env bash

create_stack=0
destroy_stack=0
smoke_test=0

if [ "$1" = "-c" ] || [ "$1" = "--create" ]; then
	create_stack=1
elif [ "$1" = "-d" ] || [ "$1" = "--destroy" ]; then
	destroy_stack=1
fi

if [ "$2" = "-s" ] || [ "$2" = "--smoke-test" ]; then
	echo '*** Smoke test mode ***'
	smoke_test=1
fi

if [ $create_stack = 1 ]; then
	echo 'Creating stack...'

	if [ $smoke_test = 0 ]; then
		aws cloudformation deploy \
			--profile aws-studies \
			--region us-east-1 \
			--template-file ec2-elb-asg.yml \
			--capabilities CAPABILITY_IAM \
			--stack-name EC2ELBASG \
			--output json
			#  \
			# --parameters file:///ec2-elb-asg.json
	
		echo 'Done.'
	fi


	echo 'done.'
elif [ $destroy_stack = 1 ]; then
	echo 'Destroying stack...'
	if [ $smoke_test = 0 ]; then
		aws cloudformation delete-stack --profile aws-studies --region us-east-1 --stack-name EC2ELBASG
	fi
	echo 'Done.'
fi

exit 0