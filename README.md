# Calculator App using Python and Flask

## SetUp 

### 1- Clone Repository

```sh
https://github.com/hadeer-morsy/Test_calc
```

### 2- Create a Virtual Environment

```bash
 python3 -m venv venv
 source venv/bin/activate
 ```

### 3- Install Requirements

```bash
pip install -r requirements.txt
```

## Run App and Tests

### 1- Run App

```bash
python3 calculator.py
```

### 2- Tests

```bash
pytest              
```

----------------------------------------
# Dockerization 

## Docker 

Create Image and container
```bash
docker build -t test .
docker run -it -p5000:5000 test
``` 
## Pushing Image to DockerHub 

>Username on DockerHub: hadeer16

>Repo on DockerHub: test_calc

1. Login
```bash
docker login
```

2. Tag image
```bash
docker tag test hadeer16/test_calc:v1
```

3. Push image
```bash
docker push hadeer16/test_calc:v1
```

## Pull Image and run it from DockerHub 

1. Pull image 
```bash
docker pull hadeer16/test_calc:v1
docker run -p5000:5000 hadeer16/test_calc
```

----------------------------------------
## Docker Compose

```bash
docker-compose build && docker-compose up
``` 

----------------------------------------
## GitHub Actions

The pytest.yml file in .github/workflows will run on a push event to the main branch. It defines a workflow that performs two main tasks: testing and building a Docker image then pushing the image to DockerHub.

----------------------------------------
## Ansible

Ansible will run the playbook on localhost which is defined in the inventory file (hosts.ini).
It's task is pulling the image (hadeer16/test_calc) from DockerHub and starts the container (my_app_container) based on that image.
```bash
ansible-playbook site.yml -c ./.ansible.cfg -i ./hosts.ini 
``` 

---------------------------------------
## Terraform with Ansible

Terraform will create three EC2 instances on AWS in the us-east-1 region using Ubuntu 24.04 LTS image and outputs public IP addresses of the created EC2 instance.
```bash
terraform init
terraform validate
terraform fmt
terraform plan
terraform apply 
``` 
Then Ansible will run the playbook on these EC2 instances which is defined in the inventory file (hosts.ini) then pulls the image (hadeer16/test_calc) from DockerHub and starts the container (my_app_container) on port 5000.
```bash
ansible-playbook site.yml -c ./.ansible.cfg -i ./hosts.ini 
``` 
---------------------------------------
## Kubernetes

Kubernetes will create a service with three replicas of pods inside Namespace webapps in Minikube cluster and will use ingress as the entry point to this cluster.
Pulls the image (hadeer16/test_calc) from DockerHub and start container on each pod
```bash
kubectl apply -f namespace.yaml -f deployment.yaml -f service.yaml 
kubectl apply -f ingress.yaml
kubectl describe ingress app-ingress
```
