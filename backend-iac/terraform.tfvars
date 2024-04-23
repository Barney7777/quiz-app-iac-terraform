# environment Variables
region       = "ap-southeast-2"
project_name = "quiz-app"
environment  = "dev"

# VPC variables
vpc_cidr                    = "10.0.0.0/16"
public_subnet_az1_cidr      = "10.0.0.0/24"
public_subnet_az2_cidr      = "10.0.1.0/24"
private_app_subnet_az1_cidr = "10.0.2.0/24"
private_app_subnet_az2_cidr = "10.0.3.0/24"

# route53 variables
hosted_zone_name = "barneywang.click"
record_name      = "api"

# ACM variables
subdomain_name = "api.barneywang.click"

# ecs variables
architecture    = "X86_64"                                                                    # if your mac is m-chip, please replace X86_64 with "ARM64"
container_image = "587866558777.dkr.ecr.ap-southeast-2.amazonaws.com/quiz-app-backend:latest" #ecr找到对应image的uri