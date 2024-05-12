terraform {
  required_version = ">= 1.5.6"
  required_providers {
    github = {
      source  = "integrations/github"
      version = "6.2.1"
    }
  }
}

provider "github" {}

module "github_organization" {
  source = "../.." # Path to the root of the module

  create        = false
  settings_only = true

  billing_email = "billing@example.com"
  organization_name = "myorgname"
}