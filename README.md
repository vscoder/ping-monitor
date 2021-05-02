# ping-monitor

Ping-monitor allows to periodically ping list of resources with prometheus blackbox exporter and display statistics with grafana dashboard.

## Infrastructure

Example infrastructure is described in `terraform/` directory (only one host)

All infrastracture-related documentation is presented in [terraform/README.md](terraform/README.md)

## Quickstart

Provide variables
```sh
cp terraform/yandex-cloud/terraform.tfvars.example terraform/yandex-cloud/terraform.tfvars
edit terraform/yandex-cloud/terraform.tfvars
```

Terraform init (if needed), plan and apply
```sh
cd terraform/yandex-cloud
terraform init
terraform plan
terraform apply
```

