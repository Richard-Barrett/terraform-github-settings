variable "admin_logins" {
  description = "The admin logins for the organization"
  type        = list(string)
  default     = []
}

variable "advanced_security_enabled_for_new_repositories" {
  description = "Whether advanced security is enabled for new repositories"
  type        = bool
  default     = false
}

variable "billing_email" {
  description = "The billing email for the organization"
  type        = string
}

variable "blog" {
  description = "The blog URL"
  type        = string
  default     = ""
}

variable "company" {
  description = "The company name"
  type        = string
  default     = ""
}

variable "create" {
  description = "Whether to create a new organization"
  type        = bool
  default     = false
}

variable "default_repository_permission" {
  description = "The default repository permission"
  type        = string
  default     = "READ"
}

variable "dependabot_alerts_enabled_for_new_repositories" {
  description = "Whether Dependabot alerts are enabled for new repositories"
  type        = bool
  default     = true
}

variable "dependabot_security_updates_enabled_for_new_repositories" {
  description = "Whether Dependabot security updates are enabled for new repositories"
  type        = bool
  default     = true
}

variable "dependency_graph_enabled_for_new_repositories" {
  description = "Whether the dependency graph is enabled for new repositories"
  type        = bool
  default     = true
}

variable "description" {
  description = "The description of the organization"
  type        = string
  default     = ""
}

variable "display_name" {
  description = "The display name of the organization"
  type        = string
  default     = ""
}

variable "email" {
  description = "The email of the organization"
  type        = string
  default     = ""
}

variable "enterprise_id" {
  description = "The enterprise ID"
  type        = string
  default     = ""
}

variable "enterprise_billing_email" {
  description = "Email for the enterprise billing"
  type        = string
  default     = ""
}

variable "has_organization_projects" {
  description = "Whether the organization has projects"
  type        = bool
  default     = true
}

variable "has_repository_projects" {
  description = "Whether the organization has repository projects"
  type        = bool
  default     = true
}

variable "location" {
  description = "The location of the organization"
  type        = string
  default     = ""
}

variable "members_can_create_internal_repositories" {
  description = "Whether members can create internal repositories"
  type        = bool
  default     = true
}

variable "members_can_create_pages" {
  description = "Whether members can create pages"
  type        = bool
  default     = true
}

variable "members_can_create_private_pages" {
  description = "Whether members can create private pages"
  type        = bool
  default     = true
}

variable "members_can_create_private_repositories" {
  description = "Whether members can create private repositories"
  type        = bool
  default     = true
}

variable "members_can_create_public_pages" {
  description = "Whether members can create public pages"
  type        = bool
  default     = false
}

variable "members_can_create_public_repositories" {
  description = "Whether members can create public repositories"
  type        = bool
  default     = false
}

variable "members_can_create_repositories" {
  description = "Whether members can create repositories"
  type        = bool
  default     = true
}

variable "members_can_fork_private_repositories" {
  description = "Whether members can fork private repositories"
  type        = bool
  default     = false
}

variable "organization_name" {
  description = "The name of the organization"
  type        = string
}

variable "settings_only" {
  description = "Whether to only manage the settings of an existing organization"
  type        = bool
  default     = true
}

variable "twitter_username" {
  description = "The Twitter username of the organization"
  type        = string
  default     = ""
}

variable "web_commit_signoff_required" {
  description = "Whether web commit signoff is required"
  type        = bool
  default     = false
}