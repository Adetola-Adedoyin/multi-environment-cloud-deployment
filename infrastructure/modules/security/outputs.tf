output "management_sg_id" {
  value = openstack_compute_secgroup_v2.management.id
}

output "k8s_master_sg_id" {
  value = openstack_compute_secgroup_v2.k8s_master.id
}

output "k8s_worker_sg_id" {
  value = openstack_compute_secgroup_v2.k8s_worker.id
}