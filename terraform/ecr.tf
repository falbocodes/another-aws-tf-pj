##########################
## Docker Registry ECR

resource "aws_ecr_repository" "ecr-react-app" {
  name                 = "react-app"
  image_tag_mutability = "MUTABLE"

  #  tags = {
  #    cost-center = var.cost-center
  #  }
}

resource "aws_ecr_lifecycle_policy" "ecr-react-app-policy" {
  repository = aws_ecr_repository.ecr-react-app.name

  policy = <<EOF
{
    "rules": [
        {
            "rulePriority": 10,
            "description": "Keep last X images",
            "selection": {
                "tagStatus": "any",
                "countType": "imageCountMoreThan",
                "countNumber": 10
            },
            "action": {
                "type": "expire"
            }
        }
    ]
}
EOF
}


#############################
## Docker Registry ECR PUBLIC

resource "aws_ecrpublic_repository" "react-app-public" {
  repository_name = "react-app"

  provider = aws.us
}

