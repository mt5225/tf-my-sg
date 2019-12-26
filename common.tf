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