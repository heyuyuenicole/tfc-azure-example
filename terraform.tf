terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }

  cloud {
      organization = "YOUR_ORGANIZATION_NAME"

      workspaces {
          name = "tfc-secure-variables"
      }
  }
}

provider "azurerm" {
  features {}
}
