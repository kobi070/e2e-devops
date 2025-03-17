## Pipeline Overview

This project consists of three main components:
- **/pipelines**: A Flask web application that give the user a look into currect ec2 instances, albs ant etc
    - **Jnekinsfile**: Holds the sg for the vpc
    - **azure-pipeline.yaml**: Holds all the varibales for the ec2 and tec


This is all the pipelines that we use in our project

## Prerequisites

- Jenkins
- Azure Devops

### Setup and Run

#### Jenkins

1. Get inside your Jenkins
2. Create a new Pipline
3. Refrence in that pipeline to this repo or the forked repo u use
4. run the pipline in you own Jenkins

### Azure
1. Connect your forked repo trough Pipeline in Azure DevOps
2. The pipeline will run on each push to dev branch in you git
3. Goto branch feature/jenkins-azure --> make a change (or directly to dev)
4. Merge the changes (or just push if on dev)
5. Azure will auto run


This will:
- Clone The Repo
- Run test (Lint, Security, etc) on you repo
- Create a docker image from the Dockerfile
- Build the docker image
- Deploy the Docker image into you own repository

### Prerequires - Jenkis
- Jenkins docker cred by your docker cred
- Github plugin
- Docker plugin

### Prerequires - Azure
- Azure DevOps account
- A organization
- A Project


## Project Structure

```
.
├── terraform/                               
│   ├── Jenkinsfile             
│   ├── azure-pipeline.yaml              
│   ├── README.md              
           
```
