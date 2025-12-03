resource "azurerm_data_factory" "Kdev" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  // ---------- Identity ----------
  identity {
    type         = var.identity_type
    identity_ids = var.identity_ids
  }
  // ---------- Repo Configuration ----------
  dynamic "repo_configuration" {
    for_each = var.repo_configuration == null ? [] : [var.repo_configuration]
    content {
      type                 = repo_configuration.value.type
      account_name         = repo_configuration.value.account_name
      repository_name      = repo_configuration.value.repository_name
      collaboration_branch = repo_configuration.value.collaboration_branch
      root_folder          = repo_configuration.value.root_folder
      project_name         = repo_configuration.value.project_name
      tenant_id            = repo_configuration.value.tenant_id
    }
  }
  // ---------- Customer Managed Key ----------
  dynamic "customer_managed_key" {
    for_each = var.customer_managed_key == null ? [] : [var.customer_managed_key]
    content {
      key_vault_id = customer_managed_key.value.key_vault_id
      key_name     = customer_managed_key.value.key_name
      key_version  = customer_managed_key.value.key_version
      identity_id  = customer_managed_key.value.identity_id
    }
  }
  // ---------- Encryption ----------
  dynamic "encryption" {
    for_each = var.encryption == null ? [] : [var.encryption]
    content {
      vault_base_url = encryption.value.vault_base_url
      key_name       = encryption.value.key_name
      key_version    = encryption.value.key_version
    }
  }
  // ---------- Global Parameters ----------
  dynamic "global_parameter" {
    for_each = var.global_parameters
    content {
      name  = global_parameter.value.name
      type  = global_parameter.value.type
      value = global_parameter.value.value
    }
  }
  public_network_enabled = var.public_network_enabled
  tags                   = var.tags
}