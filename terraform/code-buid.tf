resource "aws_codebuild_project" "project" {
  name          = var.proj-name
  description   = "an AWSome codebuild project "
  service_role  = aws_iam_role.codebuild.arn
  build_timeout = "5"

  artifacts {
    type = "NO_ARTIFACTS"
  }

  environment {
    compute_type    = "BUILD_GENERAL1_SMALL"
    image           = "aws/codebuild/standard:6.0"
    type            = "LINUX_CONTAINER"
    privileged_mode = true
  }

  source {
    type            = "GITHUB"
    location        = "https://github.com/falbocodes/another-aws-tf-pj.git"
    git_clone_depth = 1
    buildspec           = "react-app/buildspec.yml"

    git_submodules_config {
      fetch_submodules = true
    }
  }

  #tags = var.common_tags
}
