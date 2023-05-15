/*# Backend must remain commented until the Bucket
 and the DynamoDB table are created. 
 After the creation you can uncomment it,
 run "terraform init" and then "terraform apply" */

terraform {
  backend "s3" {
    bucket         = "terraform-dan-2023--us-west-2-qa-482578067065"
    key            = "terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "terraform_state"
  }
}
