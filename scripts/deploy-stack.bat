if "cloudformation/"$TEMPLATE_NAME NEQ *.yaml( 
    echo "CloudFormation template $TEMPLATE_NAME does not exist. Make sure the extension is *.yaml and not (*.yml)"
    exit 0)

if "parameters/"$PARAMETERS_FILE_NAME NEQ *.properties()
    echo "CloudFormation parameters $PARAMETERS_FILE_NAME does not exist"
    exit 0)

if  $CHANGESET_MODE == "true"  OR $CHANGESET_MODE == "True" (
    aws cloudformation deploy \
    --stack-name %STACK_NAME% \
    --template-file cloudformation/%TEMPLATE_NAME% \
    --parameter-overrides file://parameters/%PARAMETERS_FILE_NAME% \
    --region %REGION%)
else
    (aws cloudformation deploy \
    --stack-name %STACK_NAME% \
    --template-file cloudformation/%TEMPLATE_NAME% \
    --parameter-overrides file://parameters/%PARAMETERS_FILE_NAME% \
    --region %REGION% \
    --no-execute-changeset)