# AWS Infrastructure Automation using Terraform

## 🧠 Project Goal & Key Features

Hands-on project demonstrating **3-tier AWS infrastructure automation** using Terraform.

**Key Features:**

- **Modular VPC Setup** – Custom CIDR, public & private subnets, security groups
    
- **EC2 App Server** – Automated setup with User Data, public IP, IAM role
    
- **S3 Bucket** – Secure storage with `BucketOwnerPreferred` ownership
    
- **Optional RDS** – Ready for future expansion
    
- **Security & Monitoring** – Restricted SSH access, CloudWatch alerts for CPU utilization
    
- **Reusable Terraform Code** – Easy to deploy in multiple AWS regions
    

> The infrastructure is fully modular, reusable, and deployable across different AWS regions.

---

## 🧰 Tools & Accounts

|Tool|Purpose|
|---|---|
|**AWS Free Tier Account**|Deploy and test cloud resources|
|**Terraform (latest)**|Infrastructure as Code|
|**VS Code / IDE**|Code authoring and testing|
|**GitHub**|Version control|
|**AWS CLI (optional)**|Verify and manage resources from terminal|

## 🌐 Architecture Overview

### Textual Flow

```mermaid
flowchart TD
    %% VPC & Subnets
    subgraph VPC["VPC: 10.0.0.0/16"]
        pub_subnet[Public Subnet: 10.0.1.0/24 \n map_public_ip_on_launch: true]
        priv_subnet[Private Subnet: 10.0.2.0/24]
    end

    %% Security Groups
    SGWeb["Security Group: SSH+HTTP \n Ingress from My IP"]
    SGApp["Security Group: App-only (optional)"]

    %% EC2 Instances
    EC2App["EC2: t3.micro \n Ubuntu 22.04 LTS \n User Data → Apache installed \n IAM Role: S3 ReadOnly \n Environment: DevSecOps"]

    %% S3 Bucket
    S3["S3 Bucket: devsecops-storage-<id> \n Ownership: BucketOwnerPreferred"]

    %% Connections
    pub_subnet --> EC2App
    EC2App -->|Reads/Writes| S3
    SGWeb --> EC2App
    priv_subnet -->|Optional: App/DB| SGApp
```

### Diagram Highlights

- **Public Subnet**: EC2 receives a public IP automatically
    
- **Security Group**: SSH restricted to your IP, HTTP open to all
    
- **IAM Role**: EC2 can read S3 securely without exposing credentials
    
- **CloudWatch**: Alerts if CPU > 70%
    

> This architecture ensures **best practices** for networking, security, and monitoring.

## ⚡ Step-by-Step Deployment

1. **Terraform Initialization**

```bash
terraform init
```

2. **Plan Infrastructure**

```bash
terraform plan
```

3. **Apply Infrastructure**

```bash
terraform apply
```

4. **Verify**

- EC2 is running with public IP
    
- Security group applied correctly
    
- S3 bucket created with ownership preference
    
- CloudWatch alarms active

## 📤 Outputs

- **EC2 Public IP** – for SSH and browser access
    
- **S3 Bucket Name** – validate ownership & read permissions
    
- **VPC ID** – for network reference
    
- **Public Subnet ID** – for EC2 placement
    
- **Security Group ID** – validate ingress/egress rules



command for graph
terraform graph | dot -Tpng > graph.png

