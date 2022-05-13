# AWS Network Infrastructure
variable "aws_profile" {
  description = "AWS profile for cluster eployment"
  type        = string
}
variable "aws_region" {
  description = "AWS region for cluster deployment"
  type        = string
}
variable "aws_vpc" {
  description = "AWS VPC"
  type        = string
}
variable "aws_subnet_node1" {
  description = "Amazon FSx ONTAP AWS Subnet ID for node 1"
  type        = string
}
variable "aws_subnet_node2" {
  description = "Amazon FSx ONTAP AWS Subnet ID for node 2"
  type        = string
}

# AWS Compute Infrastructure

variable "fsx_deployment_type" {
  description = "Amazon FSx ONTAP throughput for cluster"
  type        = string
}
variable "fsx_storage_capacity" {
  description = "Amazon FSx ONTAP throughput for cluster"
  type        = string
}
variable "fsx_throughput" {
  description = "Amazon FSx ONTAP throughput for cluster"
  type        = string
}
variable "aws_tags" {
  description = "Amazon FSx ONTAP tags to be applied"
  type        = map(any)
  default     = {}
}

# SVM DNS and Domain Settings
variable "svm_dns_ips" {
  description = "DNS IP addresses of Active Directory"
  type        = list(any)
}
variable "svm_domain_name" {
  description = "Domain name of Active Directory"
  type        = string
}
variable "svm_admin_account" {
  description = "Active Directory user with privileges to add computer to domain"
  type        = string
}
variable "svm_admin_password" {
  description = "Active Directory user password"
  sensitive   = true
}


# NetApp Connector (Cloud Manager)
variable "connector_client_id" {
  description = "Client ID of deployed Cloud Manager"
  type        = string
  sensitive   = true
}
variable "connector_tenant_id" {
  description = "Account/Tenant ID of deployed Cloud Manager"
  type        = string
}
variable "connector_workspace_id" {
  description = "Workspace ID of deployed Cloud Manager"
  type        = string
}
variable "connector_fsxn_role" {
  description = "Credential role assigned in Cloud Manager"
  type        = string
}
variable "connector_refresh_token" {
  description = "Refresh token for NetApp Cloud Connector user"
  type        = string
  default     = ""
  sensitive   = true
}
variable "connector_sa_client_id" {
  description = "Client ID for NetApp Cloud Connector service account"
  type        = string
  default     = ""
  sensitive   = true
}
variable "connector_sa_secret_key" {
  description = "Secret key for NetApp Cloud Connector service account"
  type        = string
  default     = ""
  sensitive   = true
}

# NetApp Cluster (Amazon FSx ONTAP)
variable "cluster_name" {
  description = "Amazon FSx ONTAP cluster name"
  type        = string
}
variable "cluster_password" {
  description = "Amazon FSx ONTAP password for admin user"
  type        = string
  sensitive   = true
}
