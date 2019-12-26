module "mysg" {
  source          = "app.terraform.io/mt5225/sg/aws"
  name            = "${var.environment}-mysg"
  version         = "0.0.1"
  vpc_id          = module.network.vpc_id

  # create a self referancing rule for glue access
  sg_inbound_self = [
    {
      description = "my-sg"
      start       = "0"
      end         = "65535"
    },
  ]

  sg_outbound = [
    {
      description = "my-sg"
      start       = "0"
      end         = "65535"
      dests       = "0.0.0.0/0"
    },
  ]

  tags = {
    Account     = var.account
    CreatedBy   = var.created_by
    Product     = var.product
    Environment = var.env_tag_map[element(split("-", var.environment), 1)]
    Role        = "petstore-etl-sg"
    Stack       = "etl"
    ServerType  = "Application"
    Module      = "aws-sg"
    Class       = "Low"
  }
}