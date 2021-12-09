echo %TEMPLATE_NAME%
echo %STACK_OR_CHANGESET_NAME%


aws cloudformation create-change-set --stack-name %STACK_OR_CHANGESET_NAME% --change-set-name %STACK_OR_CHANGESET_NAME% --template-body cloudformation/%TEMPLATE_NAME% --parameters parameters/%PARAMETERS_FILE_NAME%
aws cloudformation describe-change-set --stack-name %STACK_OR_CHANGESET_NAME% --change-set-name %STACK_OR_CHANGESET_NAME%