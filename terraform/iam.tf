

resource "aws_iam_role" "codebuild" {
  name = "codebuildrole-${var.proj-name}"

  assume_role_policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "codebuild.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
        }
    ]
}
POLICY

  #tags = var.common_tags
}
#ma con le azioni che ci interessano
resource "aws_iam_role_policy" "project-role" {
  role = aws_iam_role.codebuild.name

  policy = <<POLICY
{
  "Version": "2012-10-17",
      "Statement": [
        {
            "Sid": "AuthEcrRepo",
            "Effect": "Allow",
            "Action": [
                "ecr:GetDownloadUrlForLayer",
                "ecr:BatchDeleteImage",
                "ecr:UploadLayerPart",
                "ecr:ListImages",
                "ecr:DeleteRepository",
                "ecr:PutImage",
                "ecr:SetRepositoryPolicy",
                "ecr:BatchGetImage",
                "ecr:CompleteLayerUpload",
                "ecr:DescribeImages",
                "ecr:DescribeRepositories",
                "ecr:DeleteRepositoryPolicy",
                "ecr:InitiateLayerUpload",
                "ecr:BatchCheckLayerAvailability",
                "ecr:GetRepositoryPolicy",
                "ecr-public:BatchCheckLayerAvailability",
                "ecr-public:PutImage",
                "ecr-public:InitiateLayerUpload",
                "ecr-public:UploadLayerPart",
                "ecr-public:CompleteLayerUpload",
                "ecr-public:BatchDeleteImage",
                "ecr-public:CreateRepository"
            ],
            "Resource": [
                "${aws_ecr_repository.ecr-react-app.arn}",
                "${aws_ecrpublic_repository.react-app-public.arn}"
                ]
        },
         {
            "Sid": "AuthEcrAllRes",
            "Effect": "Allow",
            "Action": [
                "ecr:GetAuthorizationToken"
            ],
            "Resource": [
                "*"
                ]
        }
  ]
}
POLICY
}
