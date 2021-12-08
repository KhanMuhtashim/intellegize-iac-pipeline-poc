echo %TEMPLATE_NAME%
echo  %STACK_NAME%
echo %CHANGESET_MODE%
echo %PARAMETERS_FILE_NAME%

if  %CHANGESET_MODE% == "true"  OR %CHANGESET_MODE% == "True" (
    aws cloudformation deploy --stack-name %STACK_NAME% --template-file cloudformation/%TEMPLATE_NAME% --parameter-overrides file://parameters/%PARAMETERS_FILE_NAME% )
else
    (aws cloudformation deploy --stack-name %STACK_NAME% --template-file cloudformation/%TEMPLATE_NAME% --parameter-overrides file://parameters/%PARAMETERS_FILE_NAME% --no-execute-changeset)