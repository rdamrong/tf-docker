provider "docker" {}
provider "random" {}

resource "docker_image" "app" {
  name         = "damrongsak/hello:8080"
  keep_locally = false
}

resource "random_pet" "cname" {
  length = 1
}

resource "docker_container" "app" {
  image = docker_image.app.image_id
  name  = random_pet.cname.id
  ports {
    internal = 8080
    external = 8000
  }
}
