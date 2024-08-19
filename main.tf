terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.60.0"
    }
  }
}

#Connect with aws account using secret_key and access_id 
provider "aws" {
  region     = var.region

}

# Genrate Aws key pair 
resource "aws_key_pair" "my_key_pair" {
  key_name   = "my-key-pair1"            # Name for your key pair
  public_key = file("~/.ssh/id_rsa.pub") # Path to your public key file
}
