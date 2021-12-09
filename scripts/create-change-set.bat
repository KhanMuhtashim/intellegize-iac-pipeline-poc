echo %TEMPLATE_NAME%
echo %STACK_OR_CHANGESET_NAME%


aws cloudformation create-change-set --stack-name %STACK_OR_CHANGESET_NAME% --change-set-name %STACK_OR_CHANGESET_NAME% --template-body file://cloudformation/%TEMPLATE_NAME% --parameters file://parameters/%PARAMETERS_FILE_NAME%
echo ==============================================================================================================================================================================================================================
aws cloudformation describe-change-set --stack-name %STACK_OR_CHANGESET_NAME% --change-set-name %STACK_OR_CHANGESET_NAME%