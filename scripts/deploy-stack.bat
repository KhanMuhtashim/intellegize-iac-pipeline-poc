echo %TEMPLATE_NAME%
echo %STACK_OR_CHANGESET_NAME%
echo %PARAMETERS_FILE_NAME%

aws cloudformation deploy --stack-name %STACK_OR_CHANGESET_NAME% --template-file cloudformation/%TEMPLATE_NAME% --parameter-overrides file://parameters/%PARAMETERS_FILE_NAME% --no-execute-changeset