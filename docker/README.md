## Docker Overview

This project consists of three main components:
- **/src**: A Flask web application that give the user a look into currect ec2 instances, albs ant etc
    - **app.py**: The python app
    - **requirements.txt**: The requirments file which you need to install to run the project
- **Dockerfile**: Run this Dockerfile to build all you need 

The application is containerized using Docker (with multi-stage Dockerfile)

## Prerequisites

- Docker

### Setup and Run

1. Clone this repository
2. Navigate to the /docker folder
3. Run Docker:

```bash
docker build -t <the-name-you-want>:<the-tag> .
```

This will:
- Build and start the app on port 5001 (can be accessed trough localhost:5001)

### Environment Variables

The Dockerfile uses the following environment variables:
- `AWS_ACCESS_KEY_ID`: AWS secret key id
- `AWS_SECRET_ACCESS_KEY`: AWS secret access key

### How to Run

use your own secret keys
```bash
docker run -itd -p 5001:5001 -e AWS_ACCESS_KEY_ID=<AWS_ACCESS_KEY_ID> -e AWS_SECRET_ACCESS_KEY=<AWS_SECRET_ACCESS_KEY>
```



## Project Structure

```
.
├── docker/                               
│   ├── Dockerfile              
│   └── src/                
|   |__├── requirements.txt

```
