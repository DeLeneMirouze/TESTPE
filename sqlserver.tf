
module "sqlServer" {
  source              = "./modules/sqlServers"
  deployPrivateLink   = true
  resource_group_name = "rg01"
}


