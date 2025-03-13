variable "server_id" {
  type = string
}

variable "mssql_db_name" {
  type = string
}

variable "size" {
  type = object({
    sku_name    = string
    max_size_gb = number
  })

  default = {
    sku_name    = "Basic"
    max_size_gb = 2
  }
}

variable "collation" {
  type        = string
  description = "The collation of the database. "

  default = "SQL_Latin1_General_CP1_CI_AS"
}
