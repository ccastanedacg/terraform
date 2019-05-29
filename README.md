# terraform
Create a 3-tier infrastructure in AWS using Terraform scripts. The infrastructure must have the following structure:
    • DB Server tier
    • App Server tier
    • Web Server tier
This structure must have the following requirements:
    • Custom VPC for the entire infrastructure.
    • Custom public and private subnets.
    • Custom gateway.
    • Custom route.
    • Load balancer attached to web server tier.
    • Auto scaling group for web server tier.
    • EC2 Instances for app server tier.
    • RDS instances for db server tier.
    • Web Security group with ports 8080 and 22 allowed.
    • App Security group with ports 9043 and 22 allowed.
    • DB Security group with port 9043 allowed.
Code must have at least the following features:
    • Use Terraform in either HCL or JSON format.
    • Define variables for ALL resources used.
    • If possible, reach resource created must have at least one distinctive tag.
    • Backends and remote states.
