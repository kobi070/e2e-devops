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


This will:
- Clone The Repo
- Run test (Lint, Security, etc) on you repo
- Create a docker image from the Dockerfile
- Build the docker image
- Deploy the Docker image into you own repository

### Prerequires
- Jenkins docker cred by your docker cred
- Github plugin
- Docker plugin




## Project Structure

```
.
├── terraform/                               
│   ├── Jenkinsfile             
│   ├── azure-pipeline.yaml              
           
```
