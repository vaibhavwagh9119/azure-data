variable "name" {
  type = string
}
variable "location" {
  type = string
}
variable "resource_group_name" {
  type = string
}
variable "identity_type" {
  type    = string
  default = "SystemAssigned"
}
variable "identity_ids" {
  type    = list(string)
  default = []
}
variable "repo_configuration" {
  type = object({
    type                 = string
    account_name         = string
    repository_name      = string
    collaboration_branch = string
    root_folder          = string
    project_name         = string
    tenant_id            = string
  })
  default = null
}
variable "customer_managed_key" {
  type = object({
    key_vault_id = string
    key_name     = string
    key_version  = string
    identity_id  = string
  })
  default = null
}
variable "encryption" {
  type = object({
    vault_base_url = string
    key_name       = string
    key_version    = string
  })
  default = null
}
variable "global_parameters" {
  type = list(object({
    name  = string
    type  = string
    value = string
  }))
  default = []
}
variable "public_network_enabled" {
  type    = bool
  default = true
}
variable "tags" {
  type    = map(string)
  default = {}
}
