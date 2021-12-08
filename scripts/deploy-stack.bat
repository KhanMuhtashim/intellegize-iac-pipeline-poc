echo %TEMPLATE_NAME%
echo  %STACK_NAME%
echo %CHANGESET_MODE%
echo %PARAMETERS_FILE_NAME%
if /i "cloudformation/"%TEMPLATE_NAME% NEW ".yaml" (
    echo "CloudFormation template $TEMPLATE_NAME does not exist. Make sure the extension is *.yaml and not (*.yml)"
    exit 0)

if /i "parameters/"%PARAMETERS_FILE_NAME% NEQ ".properties"(
    echo "CloudFormation parameters $PARAMETERS_FILE_NAME does not exist"
    exit 0)

if  %CHANGESET_MODE% == "true"  OR %CHANGESET_MODE% == "True" (
    aws cloudformation deploy \
    --stack-name %STACK_NAME% \
    --template-file cloudformation/%TEMPLATE_NAME% \
    --parameter-overrides file://parameters/%PARAMETERS_FILE_NAME% )
else
    (aws cloudformation deploy \
    --stack-name %STACK_NAME% \
    --template-file cloudformation/%TEMPLATE_NAME% \
    --parameter-overrides file://parameters/%PARAMETERS_FILE_NAME% \
    --no-execute-changeset)