terraform {
  backend "s3" {
    bucket = "adha-homelab-iac-terraform-state"
    key    = "terraform/sf"
    region = "ap-southeast-1"
  }
}
