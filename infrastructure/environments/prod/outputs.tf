output "management_ips" {
  value = module.compute.management_ips
}

output "k8s_master_ips" {
  value = module.compute.k8s_master_ips
}

output "k8s_worker_ips" {
  value = module.compute.k8s_worker_ips
}

output "staging_ip" {
  value = module.compute.staging_ip
}