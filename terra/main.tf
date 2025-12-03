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
  encryption             = var.encryption
  global_parameters      = var.global_parameters
  public_network_enabled = var.public_network_enabled
  tags                   = var.tags
}
