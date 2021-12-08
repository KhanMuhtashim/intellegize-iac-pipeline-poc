$STACK_NAME=$env:STACK_NAME
$PARAMETERS_FILE_NAME=$env:PARAMETERS_FILE_NAME
$TEMPLATE_NAME=$env:TEMPLATE_NAME
$CHANGESET_MODE=$env:CHANGESET_MODE
$REGION="us-east-1"

if "cloudformation/"$TEMPLATE_NAME NEQ *.yaml( 
    echo "CloudFormation template $TEMPLATE_NAME does not exist. Make sure the extension is *.yaml and not (*.yml)"
    exit 0)

if "parameters/"$PARAMETERS_FILE_NAME NEQ *.properties()
    echo "CloudFormation parameters $PARAMETERS_FILE_NAME does not exist"
    exit 0)

if  $CHANGESET_MODE == "true"  OR $CHANGESET_MODE == "True" (
    aws cloudformation deploy \
    --stack-name $STACK_NAME \
    --template-file cloudformation/$TEMPLATE_NAME \
    --parameter-overrides file://parameters/$PARAMETERS_FILE_NAME \
    --capabilities CAPABILITY_NAMED_IAM \
    --region $REGION)
else
    (aws cloudformation deploy \
    --stack-name $STACK_NAME \
    --template-file cloudformation/$TEMPLATE_NAME \
    --parameter-overrides file://parameters/$PARAMETERS_FILE_NAME \
    --capabilities CAPABILITY_NAMED_IAM \
    --region $REGION \
    --no-execute-changeset)