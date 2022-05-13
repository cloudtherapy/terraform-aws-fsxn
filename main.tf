provider "aws" {
  profile = var.aws_profile
  region  = var.aws_region
}

data "aws_route_table" "this" {
  for_each = toset([
    var.aws_subnet_node1,
    var.aws_subnet_node2
  ])
  subnet_id = each.key
}

data "aws_security_groups" "this" {}

resource "aws_fsx_ontap_file_system" "this" {
  # AWS environment
  subnet_ids          = [var.aws_subnet_node1]
  preferred_subnet_id = var.aws_subnet_node1
  security_group_ids  = [data.aws_security_groups.this.ids[0]]

  # Amazon FSx ONTAP
  deployment_type     = var.fsx_deployment_type
  storage_capacity    = var.fsx_storage_capacity
  throughput_capacity = var.fsx_throughput
  fsx_admin_password  = var.cluster_password

  tags = {
    Name        = var.cluster_name
    contact     = "cmoreira"
    description = "AWS FSx ONTAP"
  }
}

resource "aws_fsx_ontap_storage_virtual_machine" "this" {
  file_system_id = aws_fsx_ontap_file_system.this.id
  name           = format("%s%s", "svm_", var.cluster_name)

  active_directory_configuration {
    netbios_name = var.cluster_name
    self_managed_active_directory_configuration {
      dns_ips     = var.svm_dns_ips
      domain_name = var.svm_domain_name
      password    = var.svm_admin_password
      username    = var.svm_admin_account
    }
  }
  tags = {
    Name        = format("%s%s", "svm_", var.cluster_name)
    contact     = "cmoreira"
    description = "NetApp AWS FSx POC"
  }
}