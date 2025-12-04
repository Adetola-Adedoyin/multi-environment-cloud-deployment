data "openstack_images_image_v2" "ubuntu" {
  name        = "Ubuntu 22.04"
  most_recent = true
}

resource "openstack_compute_keypair_v2" "keypair" {
  name       = "${var.environment}-keypair"
  public_key = var.public_key
}

resource "openstack_compute_instance_v2" "management" {
  count           = var.management_vm_count
  name            = "${var.environment}-management-${count.index + 1}"
  image_id        = data.openstack_images_image_v2.ubuntu.id
  flavor_name     = var.management_flavor
  key_pair        = openstack_compute_keypair_v2.keypair.name
  security_groups = [var.management_sg_name]

  network {
    uuid = var.management_network_id
  }

  user_data = templatefile("${path.module}/cloud-init-management.yaml", {
    hostname = "${var.environment}-management-${count.index + 1}"
  })
}

resource "openstack_compute_instance_v2" "k8s_master" {
  count           = var.k8s_master_count
  name            = "${var.environment}-k8s-master-${count.index + 1}"
  image_id        = data.openstack_images_image_v2.ubuntu.id
  flavor_name     = var.k8s_master_flavor
  key_pair        = openstack_compute_keypair_v2.keypair.name
  security_groups = [var.k8s_master_sg_name]

  network {
    uuid = var.production_network_id
  }

  user_data = templatefile("${path.module}/cloud-init-k8s.yaml", {
    hostname = "${var.environment}-k8s-master-${count.index + 1}"
    role     = "master"
  })
}

resource "openstack_compute_instance_v2" "k8s_worker" {
  count           = var.k8s_worker_count
  name            = "${var.environment}-k8s-worker-${count.index + 1}"
  image_id        = data.openstack_images_image_v2.ubuntu.id
  flavor_name     = var.k8s_worker_flavor
  key_pair        = openstack_compute_keypair_v2.keypair.name
  security_groups = [var.k8s_worker_sg_name]

  network {
    uuid = var.production_network_id
  }

  user_data = templatefile("${path.module}/cloud-init-k8s.yaml", {
    hostname = "${var.environment}-k8s-worker-${count.index + 1}"
    role     = "worker"
  })
}

resource "openstack_compute_instance_v2" "staging" {
  name            = "${var.environment}-staging"
  image_id        = data.openstack_images_image_v2.ubuntu.id
  flavor_name     = var.staging_flavor
  key_pair        = openstack_compute_keypair_v2.keypair.name
  security_groups = [var.management_sg_name]

  network {
    uuid = var.staging_network_id
  }

  user_data = templatefile("${path.module}/cloud-init-staging.yaml", {
    hostname = "${var.environment}-staging"
  })
}