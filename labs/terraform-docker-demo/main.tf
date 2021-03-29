terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "2.11.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_volume" "shared_volume" {
  name = "shared_volume"
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.latest
  name  = "tutorial"
  
  ports {
    internal = 80
    external = 8000
  }

  volumes {
    volume_name = docker_volume.shared_volume.name
  }
}
