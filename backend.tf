terraform {
    required_providers {
        docker = {
            source = "Kreuzwerker/docker"
        }
    }
    required_version = ">=0.13"
    backend "s3" {
        profile = "terraform_demo"
        region = "us-east-1"
        key = "terraform.tfstate"
        bucket = "myfirstbucket8990"
    }
}