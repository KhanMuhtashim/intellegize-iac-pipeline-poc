$STACK_NAME=$env:STACK_NAME
$REGION="us-east-1"

aws cloudformation delete-stack \
--stack-name $STACK_NAME \
--region $REGION

aws cloudformation wait stack-delete-complete \
--stack-name $STACK_NAME \
--region $REGION