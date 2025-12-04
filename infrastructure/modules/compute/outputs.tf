output "management_instance_ids" {
  value = openstack_compute_instance_v2.management[*].id
}

output "k8s_master_instance_ids" {
  value = openstack_compute_instance_v2.k8s_master[*].id
}

output "k8s_worker_instance_ids" {
  value = openstack_compute_instance_v2.k8s_worker[*].id
}

output "management_ips" {
  value = openstack_compute_instance_v2.management[*].access_ip_v4
}

output "k8s_master_ips" {
  value = openstack_compute_instance_v2.k8s_master[*].access_ip_v4
}

output "k8s_worker_ips" {
  value = openstack_compute_instance_v2.k8s_worker[*].access_ip_v4
}

output "staging_ip" {
  value = openstack_compute_instance_v2.staging.access_ip_v4
}