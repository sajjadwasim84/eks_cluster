# ECR repository code
resource "aws_ecr_repository" "ecr_aws_ecr_repository" {
  name                 = var.name
  image_tag_mutability = "MUTABLE"
  force_delete         = true

  image_scanning_configuration {
    scan_on_push = false
  }
}