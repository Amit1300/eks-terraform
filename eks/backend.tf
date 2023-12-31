terraform {
  backend "s3" {
    bucket = "eks1300"
    key = "jenkins/terraformtfstate"
    region = "ap-south-1"
  }
}