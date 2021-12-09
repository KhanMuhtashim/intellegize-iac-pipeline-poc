echo %TEMPLATE_NAME%
echo %STACK_OR_CHANGESET_NAME%
echo %PARAMETERS_FILE_NAME%

aws cloudformation create-stack --stack-name %STACK_OR_CHANGESET_NAME% --template-body file://cloudformation/%TEMPLATE_NAME% --parameters file://parameters/%PARAMETERS_FILE_NAME% --no-execute-changeset
echo ================================================================================================================================
aws cloudformation describe-stacks --stack-name %STACK_OR_CHANGESET_NAME%