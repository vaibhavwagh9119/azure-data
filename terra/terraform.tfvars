name                = "my-adf"
location            = "East US"
resource_group_name = "rg-demo"
identity_type = "SystemAssigned"
identity_ids  = []
repo_configuration = {
  type                 = "GitHub"
  account_name         = "myuser"
  repository_name      = "adf-repo"
  collaboration_branch = "main"
  root_folder          = "/"
  project_name         = null
  tenant_id            = null
}
customer_managed_key = {
  key_vault_id = "/subscriptions/.../vaults/my-kv"
  key_name     = "cmk-key"
  key_version  = "v1"
  identity_id  = null
}
encryption = {
  vault_base_url = "https://my-kv.vault.azure.net/"
  key_name       = "encrypt-key"
  key_version    = "v1"
}
global_parameters = [
  {
    name  = "Environment"
    type  = "String"
    value = "Dev"
  }
]
public_network_enabled = false
tags = {
  environment = "dev"
  team        = "data"
}
