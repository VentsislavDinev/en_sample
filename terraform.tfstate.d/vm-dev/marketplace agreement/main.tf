resource "azurerm_marketplace_agreement" "barracuda" {
  publisher = var.publisher
  offer     = var.offer
  plan      = var.plan
}