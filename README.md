<img align="right" width="60" height="60" src="images/terraform.png">

# terraform-github-settings
Terraform Module to Manage GitHub Settings

This Terraform module is designed to manage GitHub organizations. It provides the ability to create a new organization, manage the settings of an existing organization, or both.

Key features include:

- Creating a new GitHub organization if the create variable is set to true.
- Managing the settings of an existing organization if the settings_only variable is set to true.
- Setting the billing email for the organization, which is a required input.
- Optionally setting the organization name, enterprise ID, and admin logins.
- Managing a wide range of organization settings, such as enabling advanced security for new repositories, setting the default repository permission, enabling dependabot alerts and security updates for new repositories, and more.

The module is flexible and can be customized to suit a variety of use cases, making it a powerful tool for managing GitHub organizations.

Example CICD with `BitBucket` and `Codefresh`:

![Image](./images/diagram.png)

## Notes

## Usage

The following shows basic and advanced usages for this module.


### Minimal Usage

To manage the settings of an existing organization with minimal required inputs, you would set the `create` variable to `false` and the `settings_only` variable to `true`. You would also need to provide the `billing_email` variable. Here's an example:

```hcl
module "github_organization" {
  source  = "https://github.com/Richard-Barrett/terraform-github-settings"
  version = "0.0.1"

  create        = false
  settings_only = true

  billing_email = "billing@example.com"
  organization_name = "myorgname"
}
```

In this example, we're using the module to manage an existing GitHub organization. We're setting `create` to `false` and `settings_only` to `true`, which means we're only managing the settings of an existing organization. We're providing the required `billing_email`. All other settings will be left as their default values.

### Basic Usage

You can use this module to both create and/or manage and organization. This inclused existing organizations if the desire is to only manage the settings for an organization.

```hcl
module "github_organization" {
  source  = "https://github.com/Richard-Barrett/terraform-github-settings"
  version = "0.0.1"

  create = true
  settings_only = false

  billing_email = "billing@example.com"
  organization_name = "example-organization"
  enterprise_id = "example-enterprise-id"
  admin_logins = ["admin1", "admin2"]

  # Set advanced_security_enabled_for_new_repositories to true
  advanced_security_enabled_for_new_repositories = true

  # Other optional variables can be set as needed
  blog = "https://example.com/blog"
  company = "Example Company"
  default_repository_permission = "read"
  dependabot_alerts_enabled_for_new_repositories = true
  dependabot_security_updates_enabled_for_new_repositories = true
  dependency_graph_enabled_for_new_repositories = true
  description = "This is an example organization"
  display_name = "Example Organization"
  email = "info@example.com"
  has_organization_projects = true
  has_repository_projects = true
  location = "Example Location"
  members_can_create_internal_repositories = true
  members_can_create_pages = true
  members_can_create_private_pages = true
  members_can_create_private_repositories = true
  members_can_create_public_pages = true
  members_can_create_public_repositories = true
  members_can_create_repositories = true
  members_can_fork_private_repositories = true
  twitter_username = "example"
  web_commit_signoff_required = true
}
```

In this example, we're using the module to create a new GitHub organization and manage its settings. We're setting create to true and settings_only to false, which means we're creating a new organization and managing its settings. We're providing the `required billing_email`, `organization_name`, `enterprise_id`, and `admin_logins`. We're also setting `advanced_security_enabled_for_new_repositories` to true, which will set `secret_scanning_push_protection_enabled_for_new_repositories` and `secret_scanning_enabled_for_new_repositories` to true by default. We're also setting other optional variables as needed.

An Example just to manage the settings for a pre-existing organization. To manage a pre-existing organization, you would set the create variable to false and the settings_only variable to true. Here's an example:

```hcl
module "github_organization" {
  source  = "https://github.com/Richard-Barrett/terraform-github-settings"
  version = "0.0.1"

  create = false
  settings_only = true

  billing_email = "billing@example.com"

  # The following variables are optional when settings_only is true
  organization_name = "example-organization"
  enterprise_id = "example-enterprise-id"
  admin_logins = ["admin1", "admin2"]

  # Other optional variables can be set as needed
  advanced_security_enabled_for_new_repositories = true
  blog = "https://example.com/blog"
  company = "Example Company"
  default_repository_permission = "read"
  dependabot_alerts_enabled_for_new_repositories = true
  dependabot_security_updates_enabled_for_new_repositories = true
  dependency_graph_enabled_for_new_repositories = true
  description = "This is an example organization"
  display_name = "Example Organization"
  email = "info@example.com"
  has_organization_projects = true
  has_repository_projects = true
  location = "Example Location"
  members_can_create_internal_repositories = true
  members_can_create_pages = true
  members_can_create_private_pages = true
  members_can_create_private_repositories = true
  members_can_create_public_pages = true
  members_can_create_public_repositories = true
  members_can_create_repositories = true
  members_can_fork_private_repositories = true
  twitter_username = "example"
  web_commit_signoff_required = true
}
```

In this example, we're using the module to manage an existing GitHub organization. We're setting `create` to `false` and `settings_only` to `true`, which means we're only managing the settings of an existing organization. We're providing the required `billing_email` and optionally providing `organization_name`, `enterprise_id`, and `admin_logins`. We're also setting other optional variables as needed.

### Advanced Usage with All Inputs Plus Options

Here is an example with all of the options defined on this module:

```hcl
module "github_organization" {
  source  = "https://github.com/Richard-Barrett/terraform-github-settings"
  version = "0.0.1"

  create = false
  settings_only = true

  billing_email = "billing@example.com"

  # The following variables are optional when settings_only is true
  organization_name = "example-organization"
  enterprise_id = "example-enterprise-id"
  admin_logins = ["admin1", "admin2"]

  # Other optional variables can be set as needed
  advanced_security_enabled_for_new_repositories = true
  blog = "https://example.com/blog"
  company = "Example Company"
  default_repository_permission = "read"
  dependabot_alerts_enabled_for_new_repositories = true
  dependabot_security_updates_enabled_for_new_repositories = true
  dependency_graph_enabled_for_new_repositories = true
  description = "This is an example organization"
  display_name = "Example Organization"
  email = "info@example.com"
  has_organization_projects = true
  has_repository_projects = true
  location = "Example Location"
  members_can_create_internal_repositories = true
  members_can_create_pages = true
  members_can_create_private_pages = true
  members_can_create_private_repositories = true
  members_can_create_public_pages = true
  members_can_create_public_repositories = true
  members_can_create_repositories = true
  members_can_fork_private_repositories = true
  secret_scanning_enabled_for_new_repositories = true
  secret_scanning_push_protection_enabled_for_new_repositories = true
  twitter_username = "example"
  web_commit_signoff_required = true
}
```

In this example, we're using the module to manage an existing GitHub organization. 
We're setting create to false and settings_only to true, which means we're only managing the settings of an existing organization. 
We're providing the required `billing_email` and optionally providing `organization_name`, `enterprise_id`, and `admin_logins`. 
We're also setting other optional variables as needed.

### Considerations

When using this module in Terraform, consider the following:

1. **Permissions**: Ensure you have the necessary permissions to create and manage GitHub organizations. This typically requires administrative access.

2. **Billing Email**: The `billing_email` is a required input. Make sure to provide a valid email address.

3. **Existing Organization**: If you're managing an existing organization, set `create` to `false` and `settings_only` to `true`. If you're creating a new organization, set `create` to `true`.

4. **Optional Variables**: Many settings are optional and have default values. Review these defaults to ensure they align with your organization's policies.

5. **Dependencies**: This module may depend on other Terraform providers or modules. Ensure these dependencies are properly installed and configured.

6. **Terraform Version**: Check the module's documentation to ensure it's compatible with your version of Terraform.

7. **Idempotency**: Terraform is designed to be idempotent, meaning running the same configuration multiple times should result in the same state. However, certain operations or settings may not be idempotent, so it's important to understand the implications of your configuration.

8. **State Management**: Terraform keeps track of your infrastructure's state. Be mindful of where this state file is stored and who has access to it, as it can contain sensitive information.

9. **Error Handling**: Be prepared to handle errors during the apply phase. This could be due to API rate limits, network issues, or other transient errors.

10. **Cost**: Creating resources with Terraform can incur costs. Be aware of the potential costs associated with the resources you're creating and managing with this module.

## Overview

This Terraform module provides a flexible and customizable way to create and manage GitHub organizations.

- Create a new GitHub organization.
- Manage the settings of an existing GitHub organization.
- Customize a wide range of organization settings, such as enabling advanced security for new repositories, setting the default repository permission, enabling dependabot alerts and security updates for new repositories, and more.

### Inputs

- `create`: Whether to create a new GitHub organization. Defaults to `false`.
- `settings_only`: Whether to manage the settings of an existing organization. Defaults to `true`.
- `billing_email`: The billing email for the organization. This is a required input.
- Other optional inputs to customize organization settings.


<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.6 |
| <a name="requirement_github"></a> [github](#requirement\_github) | 6.2.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_github"></a> [github](#provider\_github) | 6.2.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [github_enterprise_organization.this](https://registry.terraform.io/providers/integrations/github/6.2.1/docs/resources/enterprise_organization) | resource |
| [github_organization_settings.this](https://registry.terraform.io/providers/integrations/github/6.2.1/docs/resources/organization_settings) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_logins"></a> [admin\_logins](#input\_admin\_logins) | The admin logins for the organization | `list(string)` | `[]` | no |
| <a name="input_advanced_security_enabled_for_new_repositories"></a> [advanced\_security\_enabled\_for\_new\_repositories](#input\_advanced\_security\_enabled\_for\_new\_repositories) | Whether advanced security is enabled for new repositories | `bool` | `false` | no |
| <a name="input_billing_email"></a> [billing\_email](#input\_billing\_email) | The billing email for the organization | `string` | n/a | yes |
| <a name="input_blog"></a> [blog](#input\_blog) | The blog URL | `string` | `""` | no |
| <a name="input_company"></a> [company](#input\_company) | The company name | `string` | `""` | no |
| <a name="input_create"></a> [create](#input\_create) | Whether to create a new organization | `bool` | `false` | no |
| <a name="input_default_repository_permission"></a> [default\_repository\_permission](#input\_default\_repository\_permission) | The default repository permission | `string` | `"READ"` | no |
| <a name="input_dependabot_alerts_enabled_for_new_repositories"></a> [dependabot\_alerts\_enabled\_for\_new\_repositories](#input\_dependabot\_alerts\_enabled\_for\_new\_repositories) | Whether Dependabot alerts are enabled for new repositories | `bool` | `true` | no |
| <a name="input_dependabot_security_updates_enabled_for_new_repositories"></a> [dependabot\_security\_updates\_enabled\_for\_new\_repositories](#input\_dependabot\_security\_updates\_enabled\_for\_new\_repositories) | Whether Dependabot security updates are enabled for new repositories | `bool` | `true` | no |
| <a name="input_dependency_graph_enabled_for_new_repositories"></a> [dependency\_graph\_enabled\_for\_new\_repositories](#input\_dependency\_graph\_enabled\_for\_new\_repositories) | Whether the dependency graph is enabled for new repositories | `bool` | `true` | no |
| <a name="input_description"></a> [description](#input\_description) | The description of the organization | `string` | `""` | no |
| <a name="input_display_name"></a> [display\_name](#input\_display\_name) | The display name of the organization | `string` | `""` | no |
| <a name="input_email"></a> [email](#input\_email) | The email of the organization | `string` | `""` | no |
| <a name="input_enterprise_billing_email"></a> [enterprise\_billing\_email](#input\_enterprise\_billing\_email) | Email for the enterprise billing | `string` | `""` | no |
| <a name="input_enterprise_id"></a> [enterprise\_id](#input\_enterprise\_id) | The enterprise ID | `string` | `""` | no |
| <a name="input_has_organization_projects"></a> [has\_organization\_projects](#input\_has\_organization\_projects) | Whether the organization has projects | `bool` | `true` | no |
| <a name="input_has_repository_projects"></a> [has\_repository\_projects](#input\_has\_repository\_projects) | Whether the organization has repository projects | `bool` | `true` | no |
| <a name="input_location"></a> [location](#input\_location) | The location of the organization | `string` | `""` | no |
| <a name="input_members_can_create_internal_repositories"></a> [members\_can\_create\_internal\_repositories](#input\_members\_can\_create\_internal\_repositories) | Whether members can create internal repositories | `bool` | `true` | no |
| <a name="input_members_can_create_pages"></a> [members\_can\_create\_pages](#input\_members\_can\_create\_pages) | Whether members can create pages | `bool` | `true` | no |
| <a name="input_members_can_create_private_pages"></a> [members\_can\_create\_private\_pages](#input\_members\_can\_create\_private\_pages) | Whether members can create private pages | `bool` | `true` | no |
| <a name="input_members_can_create_private_repositories"></a> [members\_can\_create\_private\_repositories](#input\_members\_can\_create\_private\_repositories) | Whether members can create private repositories | `bool` | `true` | no |
| <a name="input_members_can_create_public_pages"></a> [members\_can\_create\_public\_pages](#input\_members\_can\_create\_public\_pages) | Whether members can create public pages | `bool` | `false` | no |
| <a name="input_members_can_create_public_repositories"></a> [members\_can\_create\_public\_repositories](#input\_members\_can\_create\_public\_repositories) | Whether members can create public repositories | `bool` | `false` | no |
| <a name="input_members_can_create_repositories"></a> [members\_can\_create\_repositories](#input\_members\_can\_create\_repositories) | Whether members can create repositories | `bool` | `true` | no |
| <a name="input_members_can_fork_private_repositories"></a> [members\_can\_fork\_private\_repositories](#input\_members\_can\_fork\_private\_repositories) | Whether members can fork private repositories | `bool` | `false` | no |
| <a name="input_organization_name"></a> [organization\_name](#input\_organization\_name) | The name of the organization | `string` | n/a | yes |
| <a name="input_secret_scanning_enabled_for_new_repositories"></a> [secret\_scanning\_enabled\_for\_new\_repositories](#input\_secret\_scanning\_enabled\_for\_new\_repositories) | Whether secret scanning is enabled for new repositories | `bool` | `false` | no |
| <a name="input_secret_scanning_push_protection_enabled_for_new_repositories"></a> [secret\_scanning\_push\_protection\_enabled\_for\_new\_repositories](#input\_secret\_scanning\_push\_protection\_enabled\_for\_new\_repositories) | Whether secret scanning push protection is enabled for new repositories | `bool` | `false` | no |
| <a name="input_settings_only"></a> [settings\_only](#input\_settings\_only) | Whether to only manage the settings of an existing organization | `bool` | `true` | no |
| <a name="input_twitter_username"></a> [twitter\_username](#input\_twitter\_username) | The Twitter username of the organization | `string` | `""` | no |
| <a name="input_web_commit_signoff_required"></a> [web\_commit\_signoff\_required](#input\_web\_commit\_signoff\_required) | Whether web commit signoff is required | `bool` | `false` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
