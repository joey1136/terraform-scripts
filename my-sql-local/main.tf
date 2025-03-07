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

resource "docker_image" "my_sql" {
  name = "mysql:latest"
  keep_locally = false
}

resource "docker_container" "my_sql" {
  image = docker_image.my_sql.image_id
  name = "my_sql"

  env = [
    "MYSQL_ROOT_PASSWORD=${var.my_sql_sa_password}" # Replace with your secure password
  ]

  # Port mapping
  ports {
    internal = 3306
    external = 3306
  }
}
