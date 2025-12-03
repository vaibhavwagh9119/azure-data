variable "name" {
  type        = string
  description = "Name of the Data Factory."
}
variable "location" {
  type        = string
  description = "Azure region."
}
variable "resource_group_name" {
  type        = string
  description = "Resource group name."
}
# ---------- Identity ----------
variable "identity_type" {
  type        = string
  default     = "SystemAssigned"
  description = "Identity type: SystemAssigned/UserAssigned"
}
variable "identity_ids" {
  type        = list(string)
  default     = []
}
# ---------- Repo Configuration ----------
variable "repo_configuration" {
  description = "Git or Azure DevOps repo configuration."
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
# ---------- Customer Managed Key ----------
variable "customer_managed_key" {
  type = object({
    key_vault_id = string
    key_name     = string
    key_version  = string
    identity_id  = string
  })
  default = null
}
# ---------- Encryption ----------
variable "encryption" {
  type = object({
    vault_base_url = string
    key_name       = string
    key_version    = string
  })
  default = null
}
# ---------- Global Parameters ----------
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
  type        = map(string)
  default     = {}
}
