terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}
provider "docker" {
  host = "unix:///var/run/docker.sock"
}

# Create Docker network for inter-container communication
resource "docker_network" "app_network" {
  name = "myapp-network"
}

# Build Node.js Backend Docker Image
resource "docker_image" "node_backend" {
  name         = "custom-node-backend"
  keep_locally = false

  build {
    context    = "./backend"
    dockerfile = "Dockerfile"
  }
}

# Build NGINX Docker Image
resource "docker_image" "nginx" {
  name         = "custom-nginx"
  keep_locally = false

  build {
    context    = "."
    dockerfile = "nginx/nginx.Dockerfile"
  }
}

# Run Node.js Backend Container
resource "docker_container" "node_backend" {
  name  = "node-backend"
  image = docker_image.node_backend.name

  networks_advanced {
    name = docker_network.app_network.name
  }

  ports {
    internal = 3000
    external = 3000
  }
}

# Run NGINX Container
resource "docker_container" "nginx_container" {
  name  = "nginx-server"
  image = docker_image.nginx.name

  networks_advanced {
    name = docker_network.app_network.name
  }

  ports {
    internal = 80
    external = 8080
  }
}
