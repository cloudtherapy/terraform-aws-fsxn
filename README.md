# terraform-aws-fsxn

# AWS Network Infrastructure
aws_profile      = "<aws_profile>"
aws_region       = "<aws_region>"
aws_vpc          = "<aws_vpc>"
aws_subnet_node1 = "<aws_subnet_node1>"
aws_subnet_node2 = "<aws_subnet_node2>"

# NetApp Connector (Cloud Manager)
connector_refresh_token = "<refresh_token_id_from_cloud_connector>"
connector_client_id     = "<client_id_from_cloud_connector>"
connector_workspace_id  = "<workspace_id_from_cloud_conector>"
connector_tenant_id     = "<account_tenant_id_from_cloud_connector>"

# Amazon FSx ONTAP
cluster_name         = "<cluster_name>"
cluster_password     = "<cluster_password>"
fsx_deployment_type  = "SINGLE_AZ_1"
fsx_storage_capacity = "1024"
fsx_throughput       = "128"

# SVM configuration
svm_dns_ips        = ["<IP_of_AD_DNS_Server>"]
svm_domain_name    = "<ad_fqdn_domain_name>"
svm_admin_account  = "<ad_administrator_account>"
svm_admin_password = "<ad_administrator_password>"
