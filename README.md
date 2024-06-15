# MultiCloudDevOpsProject.


<img src="https://github.com/Asem-Mohamed-321/MultiCloudDevOpsProject./assets/167926594/a3727300-7485-4f07-866a-3d40597fc724">

## Overview:
In this project, We deploy a simple web application and experience each step for the application to be ready for production and achive automation in the DevOps lifecycle.  

This project aims to give more experience in dealing with the DevOps pipeline tools used in the real work environment.

**tools**: [
Github
-Terraform
-AWS Cloud
-Ansible
-Jenkins
-SonarQube
-Docker
-Openshift
]

## Steps:
1. Creating Github repository.
2. Terraform provisioning.
3. Ansible Configuration and installation.
4. Containerization with Docker.
5. Continuous Integration with Jenkins.
6. Automated Deployment Pipeline.
7. Monitoring and Logging.

### 1. Creating Github repository:
o	Create a new GitHub repository named "MultiCloudDevOpsProject."

o	Initialize the repository with a README.
<img src="https://github.com/Asem-Mohamed-321/MultiCloudDevOpsProject./assets/167926594/72640e64-3413-47e4-a97c-0a6ab5bbc7fd">

o	Create main and dev branches.

o	All the code is to be pushed to the dev branch.

<img src="https://github.com/Asem-Mohamed-321/MultiCloudDevOpsProject./assets/167926594/94478601-f35c-438a-a4a4-90ee2e719f47">

o Merge the dev branch with the main branch using pull request.

<<<>>>>>

### 2. Terraform provisioning:
o Install AWS CLI:
If you haven't already installed the AWS CLI, you can download and install it from this link: https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html

o Configure your Aws account and region

<img src="https://github.com/Asem-Mohamed-321/MultiCloudDevOpsProject./assets/167926594/6debcce4-ed87-4616-8b78-aaa2160e17bb">


o Write Terraform scripts to provision the desired infrastructure using modules.

*see the full scripts in the Terraform directory*

<img src="https://github.com/Asem-Mohamed-321/MultiCloudDevOpsProject./assets/167926594/f81b8cdc-f4a0-49fc-9404-1ca3c6919a4a">

o Use the command " Terraform init " to initialize the providers' packages.

output will be like this:
```
asem@asem-virtual-machine:~/final-project/terraform$ terraform init

Initializing the backend...

Initializing provider plugins...
- Reusing previous version of hashicorp/aws from the dependency lock file
- Using previously-installed hashicorp/aws v5.51.1

Terraform has been successfully initialized!
.
.
commands will detect it and remind you to do so if necessary.
```

o Use the command " Terraform plan " to create an excution plan.

output will be like this:
```
erraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # module.ec2.aws_instance.ec2 will be created
  + resource "aws_instance" "ec2" {
      + ami                                  = "ami-04b70fa74e45c3917"
      + arn                                  = (known after apply)
.
.
...output ommited...
.
.
  # module.vpc.aws_vpc.vpc will be created
  + resource "aws_vpc" "vpc" {
      + arn                                  = (known after apply)
      + cidr_block                           = "10.0.0.0/16"
      + default_network_acl_id               = (known after apply)
      + default_route_table_id               = (known after apply)
      + default_security_group_id            = (known after apply)
      + dhcp_options_id                      = (known after apply)
      + enable_dns_hostnames                 = (known after apply)
      + enable_dns_support                   = true
      + enable_network_address_usage_metrics = (known after apply)
      + id                                   = (known after apply)
      + instance_tenancy                     = "default"
      + ipv6_association_id                  = (known after apply)
      + ipv6_cidr_block                      = (known after apply)
      + ipv6_cidr_block_network_border_group = (known after apply)
      + main_route_table_id                  = (known after apply)
      + owner_id                             = (known after apply)
      + tags_all                             = (known after apply)
    }

Plan: 10 to add, 0 to change, 0 to destroy.

```

o Use the command " Terraform apply " to apply the changes in the excution plan.

output will be like this:
```
asem@asem-virtual-machine:~/final-project/terraform$ terraform apply

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # module.ec2.aws_instance.ec2 will be created
  + resource "aws_instance" "ec2" {
      + ami                                  = "ami-04b70fa74e45c3917"
      + arn                                  = (known after apply)
      + associate_public_ip_address          = (known after apply)
.
.
...output ommited...
.
.
Plan: 10 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes
.
.
output omitted....
.
.
module.table_association.aws_route_table_association.association: Creation complete after 1s [id=rtbassoc-05a35493bbe97a799]
module.ec2.aws_instance.ec2: Still creating... [10s elapsed]
module.ec2.aws_instance.ec2: Still creating... [20s elapsed]
module.ec2.aws_instance.ec2: Still creating... [30s elapsed]
module.ec2.aws_instance.ec2: Creation complete after 34s [id=i-0c22d0424555f6e0d]

```

o Check your AWS enviironment

<<<<<>>>>>>

<img src="https://github.com/Asem-Mohamed-321/MultiCloudDevOpsProject./assets/167926594/01f91d0e-a3b8-44c9-995e-25e75e35a1a9>"

<img src="https://github.com/Asem-Mohamed-321/MultiCloudDevOpsProject./assets/167926594/e626806d-e2ea-4fde-bf41-1e3eadca04e9">

<img src="https://github.com/Asem-Mohamed-321/MultiCloudDevOpsProject./assets/167926594/2cefe592-218d-4a64-bea7-be36ab0df5d7">



o Make sure to run " terraform destroy " command to terminate and delete the resources you provisioned to reduce the cost
the output should be like this:
```
asem@asem-virtual-machine:~/final-project/terraform$ terraform destroy
module.vpc.aws_vpc.vpc: Refreshing state... [id=vpc-036330b492bd8149f]
module.ec2.aws_security_group.fpsg: Refreshing state... [id=sg-0496fbac02e283eff]
module.subnet.aws_subnet.main-subnet: Refreshing state... [id=subnet-05e6d147455a8eff0]
.
.
output omitted ....
..
Plan: 0 to add, 0 to change, 10 to destroy.

Do you really want to destroy all resources?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

 Enter a value: yes
.
.
output omitted......
.
Destroy complete! Resources: 10 destroyed.
```

## 3. Ansible Configuration and installation:

o Configure inventory and ansible config files

<img src="https://github.com/Asem-Mohamed-321/MultiCloudDevOpsProject./assets/167926594/d86a3c5a-667d-45d1-839a-f189539e22d7">

<img src="https://github.com/Asem-Mohamed-321/MultiCloudDevOpsProject./assets/167926594/0a7a683d-9218-4ff0-a6ac-6156d0e43a9a">


o Write Ansible playbooks for EC2 instance configuration using ansible roles

*see the full ansible roles and files in the ansible directory*

use the "ansible-galaxy init" command to create any role directory
```
asem@asem-virtual-machine:~/final-project/ansible$ tree
.
├── ansible.cfg
├── asem-ssh.pem
├── docker_role
│   ├── defaults
│   │   └── main.yml
│   ├── files
│   ├── handlers
│   │   └── main.yml
│   ├── meta
│   │   └── main.yml
│   ├── README.md
│   ├── tasks
│   │   └── main.yml
│   ├── templates
│   ├── tests
│   │   ├── inventory
│   │   └── test.yml
│   └── vars
│       └── main.yml
├── git_role
│   ├── defaults
│   │   └── main.yml
│   ├── files
│   ├── handlers
│   │   └── main.yml
│   ├── meta
│   │   └── main.yml
│   ├── README.md
│   ├── tasks
│   │   └── main.yml
│   ├── templates
│   ├── tests
│   │   ├── inventory
│   │   └── test.yml
│   └── vars
│       └── main.yml
├── inventory
├── jenkins_role
│   ├── defaults
│   │   └── main.yml
│   ├── files
│   ├── handlers
│   │   └── main.yml
│   ├── meta
│   │   └── main.yml
│   ├── README.md
│   ├── tasks
│   │   └── main.yml
│   ├── templates
│   ├── tests
│   │   ├── inventory
│   │   └── test.yml
│   └── vars
│       └── main.yml
├── oc_role
│   ├── defaults
│   │   └── main.yml
│   ├── files
│   ├── handlers
│   │   └── main.yml
│   ├── meta
│   │   └── main.yml
│   ├── README.md
│   ├── tasks
│   │   └── main.yml
│   ├── templates
│   ├── tests
│   │   ├── inventory
│   │   └── test.yml
│   └── vars
│       └── main.yml
├── openjdk_role
│   ├── defaults
│   │   └── main.yml
│   ├── files
│   ├── handlers
│   │   └── main.yml
│   ├── meta
│   │   └── main.yml
│   ├── README.md
│   ├── tasks
│   │   └── main.yml
│   ├── templates
│   ├── tests
│   │   ├── inventory
│   │   └── test.yml
│   └── vars
│       └── main.yml
├── playbook.yml
└── sonarqube_role
    ├── defaults
    │   └── main.yml
    ├── files
    ├── handlers
    │   └── main.yml
    ├── meta
    │   └── main.yml
    ├── README.md
    ├── tasks
    │   └── main.yml
    ├── templates
    ├── tests
    │   ├── inventory
    │   └── test.yml
    └── vars
        └── main.yml

54 directories, 52 files

```

o run the ansible-playbook command to apply the tasks to the managed node

<img src="https://github.com/Asem-Mohamed-321/MultiCloudDevOpsProject./assets/167926594/67023302-16e2-4f2a-94d3-2ed294af6084">

<img src="https://github.com/Asem-Mohamed-321/MultiCloudDevOpsProject./assets/167926594/53a4763a-65d0-45fd-b08f-83f1db57805e">

<img src="https://github.com/Asem-Mohamed-321/MultiCloudDevOpsProject./assets/167926594/13450891-5736-42ec-b1bb-4c8f9ec10751">

o check the jenkins and sonarqube access

<img src="https://github.com/Asem-Mohamed-321/MultiCloudDevOpsProject./assets/167926594/491b5d28-a710-423a-b4ca-e27477f085fc">

<img src="https://github.com/Asem-Mohamed-321/MultiCloudDevOpsProject./assets/167926594/55299ee4-6910-43da-a0de-9b8d63c6fd36">


## 4. Containerization with Docker:

o Write a Dockerfile for building the application image.

<img src="https://github.com/Asem-Mohamed-321/MultiCloudDevOpsProject./assets/167926594/2b876fb1-0118-4d9a-a3f8-a87782c40223">

## 5.Automated Deployment Pipeline:
o set up your jenkins server 

- set username and password

<img src="https://github.com/Asem-Mohamed-321/MultiCloudDevOpsProject./assets/167926594/1343ba8f-de15-4ccf-aafc-7b9a9671dc43">

<img src="https://github.com/Asem-Mohamed-321/MultiCloudDevOpsProject./assets/167926594/75c6b39c-1023-4ce7-a4ab-312b372ef49d">

- set Credintitals

<img src="https://github.com/Asem-Mohamed-321/MultiCloudDevOpsProject./assets/167926594/3c6780af-018f-4996-928b-b6a24761d65f">

- install the desired plugins (Git,Docker,Sonarqube,..etc)

<img src="https://github.com/Asem-Mohamed-321/MultiCloudDevOpsProject./assets/167926594/4b6047cf-298d-4826-a14c-bec5f8723a7b">

- Configure global shared library
*link for the shared library repo: https://github.com/Asem-Mohamed-321/shared-library/*

<img src="https://github.com/Asem-Mohamed-321/MultiCloudDevOpsProject./assets/167926594/83fad176-efe9-49b2-a8d8-174bbf04e73a">

<img src="https://github.com/Asem-Mohamed-321/MultiCloudDevOpsProject./assets/167926594/02f421db-eb57-42ce-ae46-bf4b0ece9e60>

<img src="https://github.com/Asem-Mohamed-321/MultiCloudDevOpsProject./assets/167926594/a6fd06ee-a27d-42ea-9398-db4c1cdcddfa">

o Integrate Sonarqube and Jenkins

- Configure the sonarqube server

<img src="https://github.com/Asem-Mohamed-321/MultiCloudDevOpsProject./assets/167926594/98613584-f41e-4b2a-bcdf-31f3a04ab6a8">

- Add the Sonarqube project configuration in the build file
<img src="https://github.com/Asem-Mohamed-321/MultiCloudDevOpsProject./assets/167926594/36aa15cf-1b3f-466c-a293-db70db5544b3">

-  *Remember to add a Sonarqube token as a secret text credintial in Jenkins*
<img src="https://github.com/Asem-Mohamed-321/MultiCloudDevOpsProject./assets/167926594/90f7d4e3-4a8f-4711-8436-f2fe95531c38">

o Configure your pipeline to use the repo with the jenkinsfile
<img src="https://github.com/Asem-Mohamed-321/MultiCloudDevOpsProject./assets/167926594/b39104cd-58ae-4d2e-955b-794796cb67cd">

<img src="https://github.com/Asem-Mohamed-321/MultiCloudDevOpsProject./assets/167926594/6ba995df-aaa7-46dd-889f-00713adf6c3e">

o Build the pipeline



<img src="https://github.com/Asem-Mohamed-321/MultiCloudDevOpsProject./assets/167926594/b3aa44a0-157b-48dc-8d24-55c71f525b89">

<img src="https://github.com/Asem-Mohamed-321/MultiCloudDevOpsProject./assets/167926594/5088c567-e95b-4e42-87c1-f1ea1d7795e4">


<img src="https://github.com/Asem-Mohamed-321/MultiCloudDevOpsProject./assets/167926594/1c13a879-3a71-482b-bf3a-d5720d790d23">

<img src="https://github.com/Asem-Mohamed-321/MultiCloudDevOpsProject./assets/167926594/d130431f-62da-47c6-806a-d5adbd0afbc4">

<img src="https://github.com/Asem-Mohamed-321/MultiCloudDevOpsProject./assets/167926594/794c1f5f-0897-4f40-a3ed-fea41919dc89">

<img src="https://github.com/Asem-Mohamed-321/MultiCloudDevOpsProject./assets/167926594/63df2a5f-23cb-4b54-a62d-5574ef74becf">




## 6. Continuous Integration with Jenkins.

o Trigger Builds on Code Commits

in the configuration of the pipeline select "GitHub hook trigger for GITScm polling"

<img src="https://github.com/Asem-Mohamed-321/MultiCloudDevOpsProject./assets/167926594/f7dfa151-75a4-495c-9621-5444ccbbf7c1">

in the github repo setting configure the webhook setting 

<img src="https://github.com/Asem-Mohamed-321/MultiCloudDevOpsProject./assets/167926594/8ddd93b9-5a9c-49de-922f-39db047a2c66">

## 7. Monitoring and Logging

We can use ELK (elasticsearch,logstach and kibana ) as a monitoring operator in the cluster 
What is operators ? 
A Kubernetes Operator is a software extension that makes use of custom resources to manage applications and their components more easily and swiftly. Operators are designed to automate the management of complex stateful applications on top of Kubernetes.
ELASTICSEARCH: Whether you're looking for actions from a specific IP address or analyzing a spike in transaction requests Elasticsearch lets you store, search, and analyze with speed at scale.
LOGSTECH: dynamically ingests, transforms, and ships your data regardless of format or complexity.
KIBANA: gives shape and visualisation to your data and is the extensible interface.

1- Deploy ElsaticSearch using the next two commands:
```
kubectl create -f https://download.elastic.co/downloads/eck/2.13.0/crds.yaml
kubectl apply -f https://download.elastic.co/downloads/eck/2.13.0/operator.yaml
```
<img src="https://github.com/Asem-Mohamed-321/MultiCloudDevOpsProject./assets/167926594/36e1b005-af13-4946-bd11-abbb77f51b09">

2- Deploy Logstach 

<img src="https://github.com/Asem-Mohamed-321/MultiCloudDevOpsProject./assets/167926594/1060ecc4-6691-4896-8b1a-0437f841a5a8">

```
kubectl apply -f logstach
```

3- Deploy kibana 

<img src="https://github.com/Asem-Mohamed-321/MultiCloudDevOpsProject./assets/167926594/7096f561-5602-4602-826d-f59e094c357a">

```
kubectl apply -f kibana.yml
```

find the Kibana route 
```
oc get route kibana -n elastic-system

```
Open the URL found in the route in your web browser.

Log in using your OpenShift credentials.

<img src="https://github.com/Asem-Mohamed-321/MultiCloudDevOpsProject./assets/167926594/f2d49d11-e96a-4bc3-b7f1-bb5073d02ca4">


### 8- AWS Integration:

#### remote backend state:
Remote backends provide a centralized storage location for Terraform state files and enable collaboration among team members working on Terraform projects.

if you want to add the remote back end to your project :

Create the next resource blocks :

<img src="https://github.com/Asem-Mohamed-321/MultiCloudDevOpsProject./assets/167926594/0a5534a5-ef86-430c-9e79-7624d26c285d">

Then run " terraform apply " 

Then add this terraform block to your file

<img src="https://github.com/Asem-Mohamed-321/MultiCloudDevOpsProject./assets/167926594/62acb71c-0b72-4cad-b6f1-7b68074a6bbc">

*Notes :*
1- The last terraform block should be hard coded and can't be variables.
2- You must run " terraform init " after you add the terraform block.
3- If you want to run "terraform destroy" you must delete the bucket content manually.


#### Cloudwatch integeration for monitoring

if you want to provision a cloudwatch alarm to monitor the ec2 usage you can write the next terraform file 

<img src="https://github.com/Asem-Mohamed-321/MultiCloudDevOpsProject./assets/167926594/8e16cd27-7b80-48d4-9bc0-6333cd7f82eb">

this file provision an sns topic and sns subscribtion to send notification vviz email when the ec2 usage exceeds a certain threshold.

