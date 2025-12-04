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
    # REQUIRED for managed private endpoints
  managed_virtual_network_enabled = true



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

resource "azurerm_storage_account" "testkdev" {
  name                     = "testkdev"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_kind             = "BlobStorage"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_data_factory_managed_private_endpoint" "adfendpoint" {
  name               = "adfendpoint"
  data_factory_id    = azurerm_data_factory.Kdev.id
  target_resource_id = azurerm_storage_account.testkdev.id
  subresource_name   = "blob"
}