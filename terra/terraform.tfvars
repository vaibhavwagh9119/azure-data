name                = "my-adf-kdev"
location            = "East US"
resource_group_name = "POC-Kapil"
identity_type = "SystemAssigned"
identity_ids  = []
subscription_id = "e4a7517e-f8b3-4dc6-b3dc-890d5c8238ad"

encryption = {
  vault_base_url = "https://my-kv.vault.azure.net/"
  key_name       = "encrypt-key"
  key_version    = "v1"
}
global_parameters = [
  {
    name  = "Environment"
    type  = "String"
    value = "test"
  }
]
public_network_enabled = false
tags = {
  environment = "test"
  team        = "data"
}
