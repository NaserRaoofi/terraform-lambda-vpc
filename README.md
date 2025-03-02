# AWS Lambda VPC Deployment with Terraform
![ff](https://github.com/user-attachments/assets/e6bee37f-48e8-403e-9ec6-20ab02736008)

This repository provides an **Infrastructure as Code (IaC)** solution using **Terraform** to deploy an **AWS Lambda function within a Virtual Private Cloud (VPC)**. The infrastructure includes **networking components** such as **subnets, security groups, NAT gateway, and IAM roles** to ensure that the Lambda function can securely access **AWS resources and the internet**.

## 📌 Table of Contents
- [Overview](#overview)
- [Architecture](#architecture)
- [Project Structure](#project-structure)
- [Prerequisites](#prerequisites)
- [Deployment Guide](#deployment-guide)
- [Testing](#testing)
- [Troubleshooting](#troubleshooting)
- [Cleanup](#cleanup)
- [Contributing](#contributing)
- [License](#license)

---

## 📖 **Overview**
This Terraform project automates the deployment of an **AWS Lambda function** that operates inside a **VPC**. The function has restricted access and communicates with the internet through a **NAT Gateway**. 

### **Key Features**
✅ **Deploy an AWS Lambda function in a VPC**  
✅ **Configure networking (subnets, internet gateway, NAT, and security groups)**  
✅ **Manage permissions using IAM roles and policies**  
✅ **Automate infrastructure provisioning with Terraform**  
✅ **Test Lambda connectivity to external resources**  

---

## 🏗️ **Architecture**
The infrastructure consists of the following components:

| **Component**           | **Description** |
|------------------------|---------------|
| **AWS Lambda Function** | Runs serverless code inside a private subnet |
| **VPC**                | Provides an isolated networking environment |
| **Public Subnet**      | Hosts the NAT Gateway for internet access |
| **Private Subnet**     | Hosts the Lambda function |
| **Internet Gateway**   | Allows public subnets to connect to the internet |
| **NAT Gateway**        | Enables private subnets to reach the internet |
| **Security Groups**    | Controls inbound and outbound network traffic |
| **IAM Roles & Policies** | Grants necessary permissions to Lambda |

### **🔹 Network Flow**
1. The Lambda function resides in the **private subnet**.
2. Outgoing internet traffic is **routed through the NAT Gateway** in the **public subnet**.
3. The NAT Gateway accesses the internet **via the Internet Gateway**.
4. Security groups restrict inbound and outbound access **for better security**.

---

## 📂 **Project Structure**
The repository follows a **modular Terraform structure** for better organization:
