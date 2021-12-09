echo %TEMPLATE_NAME%
echo %STACK_OR_CHANGESET_NAME%
echo %CHANGESET_MODE%
echo %PARAMETERS_FILE_NAME%

if  %CHANGESET_MODE%==true ( echo hello) else  (echo nothello)