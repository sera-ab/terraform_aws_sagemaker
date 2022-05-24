locals {
    config = yamldecode(file("../../config.yml"))["users"]
    users = flatten([for user in local.config:
    {
      "name" = user.name
      "size" = user.size
    }
    if contains(user.env, "dev")
    ])
}

module "sagemaker" {
  for_each = {for user in local.users : user.name => user }
  source        = "../../sagemaker"
  sm_name       = each.value.name
  instance_type = each.value.size
}
