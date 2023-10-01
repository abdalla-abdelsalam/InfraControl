aws s3api create-bucket \
  --bucket terraform-backend-state-buckett \
  --region us-east-1 # Change to your desired AWS region


aws dynamodb create-table \
  --table-name terraform-lock-state \
  --attribute-definitions AttributeName=LockID,AttributeType=S \
  --key-schema AttributeName=LockID,KeyType=HASH \
  --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5
