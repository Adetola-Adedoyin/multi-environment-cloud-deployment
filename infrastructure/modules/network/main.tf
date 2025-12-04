resource "openstack_networking_network_v2" "management" {
  name           = "${var.environment}-management"
  admin_state_up = "true"
}

resource "openstack_networking_network_v2" "staging" {
  name           = "${var.environment}-staging"
  admin_state_up = "true"
}

resource "openstack_networking_network_v2" "production" {
  name           = "${var.environment}-production"
  admin_state_up = "true"
}

resource "openstack_networking_subnet_v2" "management" {
  name       = "${var.environment}-management-subnet"
  network_id = openstack_networking_network_v2.management.id
  cidr       = "10.0.1.0/24"
  ip_version = 4
}

resource "openstack_networking_subnet_v2" "staging" {
  name       = "${var.environment}-staging-subnet"
  network_id = openstack_networking_network_v2.staging.id
  cidr       = "10.0.2.0/24"
  ip_version = 4
}

resource "openstack_networking_subnet_v2" "production" {
  name       = "${var.environment}-production-subnet"
  network_id = openstack_networking_network_v2.production.id
  cidr       = "10.0.3.0/24"
  ip_version = 4
}

resource "openstack_networking_router_v2" "router" {
  name                = "${var.environment}-router"
  admin_state_up      = true
  external_network_id = var.external_network_id
}

resource "openstack_networking_router_interface_v2" "management" {
  router_id = openstack_networking_router_v2.router.id
  subnet_id = openstack_networking_subnet_v2.management.id
}

resource "openstack_networking_router_interface_v2" "staging" {
  router_id = openstack_networking_router_v2.router.id
  subnet_id = openstack_networking_subnet_v2.staging.id
}

resource "openstack_networking_router_interface_v2" "production" {
  router_id = openstack_networking_router_v2.router.id
  subnet_id = openstack_networking_subnet_v2.production.id
}