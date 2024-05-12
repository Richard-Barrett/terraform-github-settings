terraform {
  required_version = ">= 1.5.6"
  required_providers {
    github = {
      source  = "integrations/github"
      version = "6.2.1"
    }
  }
}

locals {
  admin_logins_valid                                           = var.create ? length(var.admin_logins) > 0 : true
  secret_scanning_push_protection_enabled_for_new_repositories = var.advanced_security_enabled_for_new_repositories ? true : false
  secret_scanning_enabled_for_new_repositories                 = var.advanced_security_enabled_for_new_repositories ? true : false
  enterprise_id_valid                                          = var.settings_only && var.create ? var.enterprise_id != "" : true
  billing_email_valid                                          = var.settings_only || var.create ? var.billing_email != "" : true
  organization_name_valid                                      = var.settings_only && var.create ? var.organization_name != "" : true
  github_enterprise_organization_count                         = var.create ? 1 : 0
  github_organization_settings_count                           = var.settings_only ? 1 : 0
}

resource "github_enterprise_organization" "this" {
  count = (local.github_organization_settings_count > 0) && local.admin_logins_valid ? 1 : 0

  enterprise_id = local.enterprise_id_valid
  name          = local.organization_name_valid
  display_name  = var.display_name
  description   = var.description
  billing_email = local.billing_email_valid
  admin_logins  = var.admin_logins
}

resource "github_organization_settings" "this" {
  count = local.github_enterprise_organization_count

  billing_email                                                = var.billing_email
  company                                                      = var.company
  blog                                                         = var.blog
  email                                                        = var.email
  twitter_username                                             = var.twitter_username
  location                                                     = var.location
  name                                                         = local.organization_name_valid
  description                                                  = var.description
  has_organization_projects                                    = var.has_organization_projects
  has_repository_projects                                      = var.has_repository_projects
  default_repository_permission                                = var.default_repository_permission
  members_can_create_repositories                              = var.members_can_create_repositories
  members_can_create_public_repositories                       = var.members_can_create_public_repositories
  members_can_create_private_repositories                      = var.members_can_create_private_repositories
  members_can_create_internal_repositories                     = var.members_can_create_internal_repositories
  members_can_create_pages                                     = var.members_can_create_pages
  members_can_create_public_pages                              = var.members_can_create_public_pages
  members_can_create_private_pages                             = var.members_can_create_private_pages
  members_can_fork_private_repositories                        = var.members_can_fork_private_repositories
  web_commit_signoff_required                                  = var.web_commit_signoff_required
  advanced_security_enabled_for_new_repositories               = var.advanced_security_enabled_for_new_repositories
  dependabot_alerts_enabled_for_new_repositories               = var.dependabot_alerts_enabled_for_new_repositories
  dependabot_security_updates_enabled_for_new_repositories     = var.dependabot_security_updates_enabled_for_new_repositories
  dependency_graph_enabled_for_new_repositories                = var.dependency_graph_enabled_for_new_repositories
  secret_scanning_enabled_for_new_repositories                 = local.secret_scanning_enabled_for_new_repositories
  secret_scanning_push_protection_enabled_for_new_repositories = local.secret_scanning_push_protection_enabled_for_new_repositories
}

