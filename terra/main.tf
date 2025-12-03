terraform {
  required_version = ">= 1.5.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}
provider "azurerm" {
  features {}
}
module "data_factory" {
  source = "./modules/data_factory"
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  identity_type = var.identity_type
  identity_ids  = var.identity_ids
  repo_configuration     = var.repo_configuration
  customer_managed_key   = var.customer_managed_key
  encryption             = var.encryption
  global_parameters      = var.global_parameters
  public_network_enabled = var.public_network_enabled
  tags                   = var.tags
}
output "data_factory_id" {
  value = module.data_factory.id
}