resource "openstack_blockstorage_volume_v3" "management_volumes" {
  count = var.management_vm_count
  name  = "${var.environment}-management-vol-${count.index + 1}"
  size  = var.management_volume_size
}

resource "openstack_compute_volume_attach_v2" "management_attachments" {
  count       = var.management_vm_count
  instance_id = var.management_instance_ids[count.index]
  volume_id   = openstack_blockstorage_volume_v3.management_volumes[count.index].id
}

resource "openstack_blockstorage_volume_v3" "k8s_master_volumes" {
  count = var.k8s_master_count
  name  = "${var.environment}-k8s-master-vol-${count.index + 1}"
  size  = var.k8s_volume_size
}

resource "openstack_compute_volume_attach_v2" "k8s_master_attachments" {
  count       = var.k8s_master_count
  instance_id = var.k8s_master_instance_ids[count.index]
  volume_id   = openstack_blockstorage_volume_v3.k8s_master_volumes[count.index].id
}

resource "openstack_blockstorage_volume_v3" "k8s_worker_volumes" {
  count = var.k8s_worker_count
  name  = "${var.environment}-k8s-worker-vol-${count.index + 1}"
  size  = var.k8s_volume_size
}

resource "openstack_compute_volume_attach_v2" "k8s_worker_attachments" {
  count       = var.k8s_worker_count
  instance_id = var.k8s_worker_instance_ids[count.index]
  volume_id   = openstack_blockstorage_volume_v3.k8s_worker_volumes[count.index].id
}