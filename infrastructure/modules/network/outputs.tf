output "management_network_id" {
  value = openstack_networking_network_v2.management.id
}

output "staging_network_id" {
  value = openstack_networking_network_v2.staging.id
}

output "production_network_id" {
  value = openstack_networking_network_v2.production.id
}

output "management_subnet_id" {
  value = openstack_networking_subnet_v2.management.id
}

output "staging_subnet_id" {
  value = openstack_networking_subnet_v2.staging.id
}

output "production_subnet_id" {
  value = openstack_networking_subnet_v2.production.id
}