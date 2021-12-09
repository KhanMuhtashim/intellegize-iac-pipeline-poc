aws cloudformation delete-stack --stack-name %STACK_OR_CHANGESET_NAME% 

aws cloudformation wait stack-delete-complete --stack-name %STACK_OR_CHANGESET_NAME% 