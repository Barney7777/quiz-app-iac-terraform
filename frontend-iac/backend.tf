terraform {
  backend "s3" {
    # don't use variables here, just use values
    bucket         = "quizapp-terraform-remote-state"
    key            = "frontend/dev/terraform.tfstate"
    region         = "ap-southeast-2"
    dynamodb_table = "quizapp-frontend-terraform-state-lock"
  }
}