# store the terraform state file in s3 and lock with dynamodb
terraform {
  backend "s3" {
    bucket         = "quiz-app-terraform-remote-state"
    key            = "backend/dev/terraform.tfstate"
    region         = "ap-southeast-2"
    # dynamodb_table = "quiz-app-backend-terraform-state-lock"
  }
}