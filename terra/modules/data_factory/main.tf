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