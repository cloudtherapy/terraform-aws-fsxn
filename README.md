# terraform-aws-fsxn

Terraform module for deploying Amazon FSx for NetApp ONTAP in AWS.

## Features

- Creates Amazon FSx for NetApp ONTAP clusters
- Configures NetApp Cloud Manager connector
- Sets up Active Directory integration
- Configures Storage Virtual Machines (SVMs)

## Prerequisites

- Terraform installed (version specified in `versions.tf`)
- AWS CLI installed and configured
- AWS account with appropriate permissions
- NetApp Cloud Manager credentials
- Active Directory environment for SVM configuration

## Configuration

### AWS Infrastructure
```hcl
aws_profile      = "<aws_profile>"
aws_region       = "<aws_region>"
aws_vpc          = "<aws_vpc>"
aws_subnet_node1 = "<aws_subnet_node1>"
aws_subnet_node2 = "<aws_subnet_node2>"
```

### NetApp Connector
```hcl
connector_refresh_token = "<refresh_token_id_from_cloud_connector>"
connector_client_id     = "<client_id_from_cloud_connector>"
connector_workspace_id  = "<workspace_id_from_cloud_conector>"
connector_tenant_id     = "<account_tenant_id_from_cloud_connector>"
```

### Amazon FSx ONTAP
```hcl
cluster_name         = "<cluster_name>"
cluster_password     = "<cluster_password>"
fsx_deployment_type  = "SINGLE_AZ_1"
fsx_storage_capacity = "1024"
fsx_throughput       = "128"
```

### SVM Configuration
```hcl
svm_dns_ips        = ["<IP_of_AD_DNS_Server>"]
svm_domain_name    = "<ad_fqdn_domain_name>"
svm_admin_account  = "<ad_administrator_account>"
svm_admin_password = "<ad_administrator_password>"
```

## Usage

1. Clone this repository
2. Create a `terraform.tfvars` file with your configuration
3. Initialize Terraform:
   ```bash
   terraform init
   ```
4. Review the plan:
   ```bash
   terraform plan
   ```
5. Apply the configuration:
   ```bash
   terraform apply
   ```

## Security

- All sensitive values should be stored in a secure location
- Use AWS Secrets Manager or similar service for sensitive credentials
- Follow the principle of least privilege for AWS permissions

## License

This project is licensed under the terms of the LICENSE file.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.
