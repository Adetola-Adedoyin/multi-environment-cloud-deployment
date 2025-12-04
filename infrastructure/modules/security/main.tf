resource "openstack_compute_secgroup_v2" "management" {
  name        = "${var.environment}-management-sg"
  description = "Security group for management plane"

  rule {
    from_port   = 22
    to_port     = 22
    ip_protocol = "tcp"
    cidr        = "0.0.0.0/0"
  }

  rule {
    from_port   = 80
    to_port     = 80
    ip_protocol = "tcp"
    cidr        = "0.0.0.0/0"
  }

  rule {
    from_port   = 443
    to_port     = 443
    ip_protocol = "tcp"
    cidr        = "0.0.0.0/0"
  }

  rule {
    from_port   = 8200
    to_port     = 8200
    ip_protocol = "tcp"
    cidr        = "10.0.0.0/8"
  }
}

resource "openstack_compute_secgroup_v2" "k8s_master" {
  name        = "${var.environment}-k8s-master-sg"
  description = "Security group for Kubernetes masters"

  rule {
    from_port   = 22
    to_port     = 22
    ip_protocol = "tcp"
    cidr        = "10.0.0.0/8"
  }

  rule {
    from_port   = 6443
    to_port     = 6443
    ip_protocol = "tcp"
    cidr        = "10.0.0.0/8"
  }

  rule {
    from_port   = 2379
    to_port     = 2380
    ip_protocol = "tcp"
    cidr        = "10.0.3.0/24"
  }
}

resource "openstack_compute_secgroup_v2" "k8s_worker" {
  name        = "${var.environment}-k8s-worker-sg"
  description = "Security group for Kubernetes workers"

  rule {
    from_port   = 22
    to_port     = 22
    ip_protocol = "tcp"
    cidr        = "10.0.0.0/8"
  }

  rule {
    from_port   = 30000
    to_port     = 32767
    ip_protocol = "tcp"
    cidr        = "0.0.0.0/0"
  }

  rule {
    from_port   = 10250
    to_port     = 10250
    ip_protocol = "tcp"
    cidr        = "10.0.3.0/24"
  }
}