variable "environment" {
  description = "Environment name"
  type        = string
  default     = "prod"
}

variable "external_network_id" {
  description = "External network ID"
  type        = string
}

variable "public_key" {
  description = "SSH public key"
  type        = string
}

variable "management_vm_count" {
  description = "Number of management VMs"
  type        = number
  default     = 3
}

variable "k8s_master_count" {
  description = "Number of K8s master nodes"
  type        = number
  default     = 3
}

variable "k8s_worker_count" {
  description = "Number of K8s worker nodes"
  type        = number
  default     = 5
}