terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.78.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "RG-Github_Action_Learning"
    storage_account_name = "stgithubactionstatefile"  
    container_name       = "cont-githubactions-statefile"               
    key                  = "GithubLearning.tfstate" 
  }
}

provider "azurerm" {
  features {}
}


resource "azurerm_resource_group" "rg1" {
  name     = "rg-gitpractice"
  location = "Central India"
}

resource "azurerm_storage_account" "st" {
  depends_on = [ azurerm_resource_group.rg1 ]
  name                     = "stgitpractice007"
  resource_group_name      = "rg-gitpractice"
  location                 = "Central India"
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "ALI"
  }
}
