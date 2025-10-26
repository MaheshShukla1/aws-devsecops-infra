# AWS DevSecOps Infra Automation

## Description
This project demonstrates a hands-on AWS DevSecOps project using Terraform. It includes:
- Custom VPC with public subnet
- EC2 instance running Apache/Nginx
- IAM Role attached to EC2 for S3 read-only access
- S3 bucket for storage
- CloudWatch monitoring setup

## Architecture
![Architecture Diagram](architecture.png)

```mermaid
flowchart TD
    %% VPC & Subnets
    subgraph VPC["VPC: 10.0.0.0/16"]
        pub_subnet[Public Subnet: 10.0.1.0/24]
        priv_subnet[Private Subnet: 10.0.2.0/24]
    end

    %% Security Groups
    SGWeb["Security Group: SSH+HTTP"]
    SGApp["Security Group: App-only (optional)"]

    %% EC2 Instances
    EC2App["EC2: t2.micro \n Amazon Linux 2 \n User Data → Apache installed"]

    %% S3 Bucket
    S3["S3 Bucket: devsecops-storage-<id> \n Ownership: BucketOwnerPreferred"]

    %% Flow & Connections
    pub_subnet --> EC2App
    EC2App -->|Reads/Writes| S3
    SGWeb --> EC2App

    %% Optional Private Subnet Components (Advanced)
    priv_subnet -->|Optional: App/DB| SGApp
```

## How to Run
1. terraform init
2. terraform plan
3. terraform apply

## Outputs
- EC2 Public IP
- S3 Bucket Name
