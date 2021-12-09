echo %TEMPLATE_NAME%
echo  %STACK_OR_CHANGESET_NAME%
echo %CHANGESET_MODE%
echo %PARAMETERS_FILE_NAME%

if  %CHANGESET_MODE% equ true (
    aws cloudformation create-change-set --stack-name %STACK_OR_CHANGESET_NAME% --change-set-name %STACK_OR_CHANGESET_NAME% --template-body cloudformation/%TEMPLATE_NAME%
    aws cloudformation describe-change-set --stack-name %STACK_OR_CHANGESET_NAME% --change-set-name %STACK_OR_CHANGESET_NAME%
) else  (
    aws cloudformation deploy --stack-name %STACK_OR_CHANGESET_NAME% --template-file cloudformation/%TEMPLATE_NAME% --parameter-overrides file://parameters/%PARAMETERS_FILE_NAME% --no-execute-changeset
)