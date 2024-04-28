# store the terraform state file in s3 and lock with dynamodb
terraform {
  backend "s3" {
    bucket         = "quizapp-terraform-remote-state"
    key            = "backend/dev/terraform.tfstate"
    region         = "ap-southeast-2"
    dynamodb_table = "quizapp-backend-terraform-state-lock"
  }
}