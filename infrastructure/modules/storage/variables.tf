variable "environment" {
  description = "Environment name"
  type        = string
}

variable "management_vm_count" {
  description = "Number of management VMs"
  type        = number
}

variable "k8s_master_count" {
  description = "Number of K8s master nodes"
  type        = number
}

variable "k8s_worker_count" {
  description = "Number of K8s worker nodes"
  type        = number
}

variable "management_volume_size" {
  description = "Size of management volumes in GB"
  type        = number
  default     = 100
}

variable "k8s_volume_size" {
  description = "Size of K8s volumes in GB"
  type        = number
  default     = 200
}

variable "management_instance_ids" {
  description = "List of management instance IDs"
  type        = list(string)
}

variable "k8s_master_instance_ids" {
  description = "List of K8s master instance IDs"
  type        = list(string)
}

variable "k8s_worker_instance_ids" {
  description = "List of K8s worker instance IDs"
  type        = list(string)
}