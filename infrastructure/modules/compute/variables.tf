variable "environment" {
  description = "Environment name"
  type        = string
}

variable "public_key" {
  description = "SSH public key"
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

variable "management_flavor" {
  description = "Flavor for management VMs"
  type        = string
  default     = "m1.large"
}

variable "k8s_master_flavor" {
  description = "Flavor for K8s master nodes"
  type        = string
  default     = "m1.large"
}

variable "k8s_worker_flavor" {
  description = "Flavor for K8s worker nodes"
  type        = string
  default     = "m1.xlarge"
}

variable "staging_flavor" {
  description = "Flavor for staging VM"
  type        = string
  default     = "m1.medium"
}

variable "management_network_id" {
  description = "Management network ID"
  type        = string
}

variable "staging_network_id" {
  description = "Staging network ID"
  type        = string
}

variable "production_network_id" {
  description = "Production network ID"
  type        = string
}

variable "management_sg_name" {
  description = "Management security group name"
  type        = string
}

variable "k8s_master_sg_name" {
  description = "K8s master security group name"
  type        = string
}

variable "k8s_worker_sg_name" {
  description = "K8s worker security group name"
  type        = string
}