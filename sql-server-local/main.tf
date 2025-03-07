terraform {
  required_providers {
     docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
     }
  }
}

provider "docker" {
  host    = "npipe:////.//pipe//docker_engine"
}

resource "docker_image" "azure_sql_edge" {
  name = "mcr.microsoft.com/azure-sql-edge:latest"
  keep_locally = false
}

resource "docker_container" "azure_sql_edge" {
  image = docker_image.azure_sql_edge.image_id
  name = "azure_sql_edge"

  env = [
    "ACCEPT_EULA=1",
    "MSSQL_SA_PASSWORD=${var.sql_sa_password}" # Replace with your secure password
  ]

  # Port mapping
  ports {
    internal = 1433
    external = 1433
  }

  # Add SYS_PTRACE capability
  capabilities {
    add = ["SYS_PTRACE"]
  }
}
