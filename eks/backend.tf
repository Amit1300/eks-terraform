terraform {
  backend "s3" {
    bucket = "eks1300"
    key = "jenkins/terraformtfstate.eks"
    region = "ap-south-1"
  }
}