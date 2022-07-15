terraform {
  backend "azurerm" {
    resource_group_name  = "tf-practice"
    storage_account_name = "tfpracticest"
    container_name       = "tfstate"
    key                  = "prod.terraform.tfstate"
  }
}
