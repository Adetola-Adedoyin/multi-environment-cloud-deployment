variable "openstack_user_name" {
  description = "OpenStack username"
  type        = string
}

variable "openstack_tenant_name" {
  description = "OpenStack tenant name"
  type        = string
}

variable "openstack_password" {
  description = "OpenStack password"
  type        = string
  sensitive   = true
}

variable "openstack_auth_url" {
  description = "OpenStack authentication URL"
  type        = string
}

variable "openstack_region" {
  description = "OpenStack region"
  type        = string
  default     = "RegionOne"
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
  default     = ["nova"]
}

variable "management_vm_count" {
  description = "Number of management VMs"
  type        = number
  default     = 3
}

variable "k8s_master_count" {
  description = "Number of Kubernetes master nodes"
  type        = number
  default     = 3
}

variable "k8s_worker_count" {
  description = "Number of Kubernetes worker nodes"
  type        = number
  default     = 5
}