terraform {
  backend "s3" {
    bucket = "jenkins-terraform-123"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}