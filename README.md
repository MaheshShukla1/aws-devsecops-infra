# AWS DevSecOps Infrastructure Automation

## Overview
This project demonstrates a hands-on **AWS DevSecOps infrastructure** setup using Terraform. It highlights modern AWS best practices with modular, reusable code.

**Key Features:**
- Custom **VPC** with public and optional private subnets
- **EC2** instance running Apache/Nginx with automated User Data script
- **IAM Role** attached to EC2 for S3 read-only access
- **S3 bucket** with ownership controls (`BucketOwnerPreferred`)
- **CloudWatch** monitoring setup for EC2 metrics
- Modular Terraform code structure for reusability

---

## Architecture

Visual overview of the infrastructure:

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

    %% Connections
    pub_subnet --> EC2App
    EC2App -->|Reads/Writes| S3
    SGWeb --> EC2App
    priv_subnet -->|Optional: App/DB| SGApp
```