module "platform" {

  source = "../platform"

  region       = var.region
  environment  = var.environment
  project_name = var.project_name

}