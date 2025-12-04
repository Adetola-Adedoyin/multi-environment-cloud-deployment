module "network" {
  source = "../../modules/network"
  
  environment         = var.environment
  external_network_id = var.external_network_id
}

module "security" {
  source = "../../modules/security"
  
  environment = var.environment
}

module "compute" {
  source = "../../modules/compute"
  
  environment             = var.environment
  public_key             = var.public_key
  management_vm_count    = var.management_vm_count
  k8s_master_count       = var.k8s_master_count
  k8s_worker_count       = var.k8s_worker_count
  management_network_id  = module.network.management_network_id
  staging_network_id     = module.network.staging_network_id
  production_network_id  = module.network.production_network_id
  management_sg_name     = module.security.management_sg_id
  k8s_master_sg_name     = module.security.k8s_master_sg_id
  k8s_worker_sg_name     = module.security.k8s_worker_sg_id
}