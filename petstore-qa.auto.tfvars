environment = "petstore-qa-usw2"

account = "aws6"

product = "Petstore"

created_by = "terraform"

variable "env_tag_map" {
  type = map(string)

  default = {
    prod = "production"
    stag = "staging"
    qa   = "qa"
    dev  = "dev"
    dr   = "dr"
  }
}