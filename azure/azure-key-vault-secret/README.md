## Usage

Add the following variable definition in variables.tf, ammend the default value of variable if needed

```
variable "resource_group_name" {
  type = string
}

variable "vault_name" {
  type        = string
  description = "The name of the existing key vault."
}

variable "secret_name" {
  type        = string
  description = "The name of the secret to be created."
}

variable "secret_value" {
  type = string
  description = "The vakue of the secret to be created."
}

```

Add the following module in main.tf

```
module "azure_key_vault_secret" {
  source = "./azure-key-vault-secret"

  resource_group_name = var.resource_group_name
  vault_name          = var.vault_name
  secret_name         = var.xxxx_secret_name
  secret_value        = var.xxxx_secret_value
}
```
