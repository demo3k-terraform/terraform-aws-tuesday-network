# Terraform VPC Module

Creates a VPC or uses an existing one, with configurable subnets.

## Usage
```hcl
module "vpc" {
  source  = "app.terraform.io/tf-advanced-labs-demo3k/tuesday-network/aws"
  version = "<module version>"
  app_prefix     = "myapp"
  cidr_block     = "10.0.0.0/16" # Optional: Defaults to 10.0.0.0/16
  subnet_count   = 3             # Optional: Defaults to 2
  existing_vpc_id = ""           # Optional: Set to existing VPC ID to skip VPC creation
}
```

## Inputs
- `app_prefix`: (Required) Prefix for resource tags.
- `cidr_block`: (Optional) VPC CIDR block. Defaults to `10.0.0.0/16`.
- `subnet_count`: (Optional) Number of subnets. Defaults to 2. Must be 0-200.
- `existing_vpc_id`: (Optional) ID of existing VPC. If set, skips VPC creation.

## Outputs
- `vpc_id`: ID of the created or used VPC.
- `subnet_ids`: List of created subnet IDs.
- `cidr_block`: CIDR block of the VPC.
