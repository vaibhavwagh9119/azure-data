name                = "my-adf"
location            = "East US"
resource_group_name = "rg-demo"
identity_type = "SystemAssigned"
identity_ids  = []

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
