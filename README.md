# another-aws-tf-pj
## Yet another terraform project!

another-aws-tf-pj it's a little project that started as a challenge. 
you will see how it's possible, starting from a react app (thanks to [Rahul-Pandey7](https://github.com/Rahul-Pandey7/react-image-compressor)) to make a Dockerfile, a docker-compose for development things and some AWSome magic.

# buzzwords are
- terraform
- docker
- AutoMagic
- AWS Codebuild

# Requirements
- terraform 1.2.4
- awscli 2.7.14
- helm 3.9.1

# POI
## terraform directory
Where the AWS resources are defined. For the ECR case, two resources are defined, and the public one is defined for my test cases. 

Please rename vars.tf.example in vars.tf, the codebuild project is configured to point to this repo, change all this to your liking, or create one that fits your will. 

```sh
mv vars.tf.example vars.tf
```
then 
```sh
terraform init
terraform plan
```
## react-app directory
There is the application code and two Dockerfile.
Dockerfile number one is for "production" purposes and is configured without root privilege, then the second (Dockerfile-dev) is for developments purpose. Bear in mind that in the project root you can find a docker-compose already configured.

## helm directory 
There you can see a Helm Chart. The deployment is configured to run as not root.

# Miscellaneous
This project  was run and checked locally using:
- An AWS CodeBuild agent 
- A local Kubernetes cluster powered by Kind 

### Ref 
- https://docs.aws.amazon.com/codebuild/latest/userguide/use-codebuild-agent.html
- https://kind.sigs.k8s.io
