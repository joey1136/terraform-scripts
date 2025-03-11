## Usage

Add the following variable definition in variables.tf, ammend the default value of variable if needed

```
variable "resource_group_name" {
  type = string
  default = "azure-resource-group"
  description = "Prefix of the resource group name that's combined with a random ID so name is unique in your Azure subscription."
}

variable "vault_name" {
  type        = string
  description = "The name of the key vault to be created. The value will be randomly generated if blank."
  default     = "azure-vault-name"
}

variable "key_name" {
  type        = string
  description = "The name of the key to be created. The value will be randomly generated if blank."
  default     = "azure-vault-key-name"
}

```

Add the following module in main.tf

```
module "azure_key_vault" {
  source = "./azure-key-vault"

  resource_group_name = var.resource_group_name
  vault_name          = var.vault_name
  key_name            = var.key_name
}
```

## Source

https://learn.microsoft.com/zh-tw/azure/azure-sql/database/single-database-create-terraform-quickstart?view=azuresql&tabs=azure-cli
