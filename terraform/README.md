## Terraform Overview

This project consists of three main components:
- **/terraform**: A Flask web application that give the user a look into currect ec2 instances, albs ant etc
    - **security_grop.tf**: Holds the sg for the vpc
    - **varibales.tf**: Holds all the varibales for the ec2 and tec
    - **data.tf**: Get certain data from data resource 
    - **ec2.tf**: Holds all the configuration for our ec2 
    - **key.tf**: Creates and pushes a ssh key to our ec2 
    - **output.tf**: Outputs from our .tf files 
    - **prividers.tf**: All providers we need 

This is a IoC for creating a EC2 instance on aws using terraform

## Prerequisites

- Terraform

### Setup and Run

1. Clone this repository
2. Navigate to the /terraform folder
3. Run Terrafom command:

```bash
terraform init
terraform plan
terraform apply
```

This will:
- Build an EC2
- Allow you to ssh into the EC2 instance
- Output Security groupt id, EC2 ip and SSH key location

### Environment Variables

The Terraform uses the following environment variables:
- `AWS_ACCESS_KEY_ID`: AWS secret key id 
- `AWS_SECRET_ACCESS_KEY`: AWS secret access key




## Project Structure

```
.
├── terraform/                               
│   ├── security_grop.tf              
│   ├── varibales.tf              
│   ├── data.tf              
│   ├── ec2.tf              
│   ├── key.tf              
│   ├── output.tf              
│   ├── prividers.tf              


```
