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

<img src="https://github.com/Asem-Mohamed-321/MultiCloudDevOpsProject./assets/167926594/9e1f57b8-9a14-4aa4-9d94-e02a068c28fa">

<<><>>>>


## 4. Containerization with Docker:

o Write a Dockerfile for building the application image.

<img src="https://github.com/Asem-Mohamed-321/MultiCloudDevOpsProject./assets/167926594/2b876fb1-0118-4d9a-a3f8-a87782c40223">

## 5.Automated Deployment Pipeline:
o set up your jenkins server 

- set Credintitals

<img src="https://github.com/Asem-Mohamed-321/MultiCloudDevOpsProject./assets/167926594/e7920555-9e58-4641-a069-ed6caef6a923">

- install the desired plugins (Git,Docker,Sonarqube,..etc)

<img src="https://github.com/Asem-Mohamed-321/MultiCloudDevOpsProject./assets/167926594/4b6047cf-298d-4826-a14c-bec5f8723a7b">

- Configure global shared library
*link for the shared library repo: https://github.com/Asem-Mohamed-321/shared-library/*

<img src="https://github.com/Asem-Mohamed-321/MultiCloudDevOpsProject./assets/167926594/83fad176-efe9-49b2-a8d8-174bbf04e73a">

<img src="https://github.com/Asem-Mohamed-321/MultiCloudDevOpsProject./assets/167926594/02f421db-eb57-42ce-ae46-bf4b0ece9e60>

<img src="https://github.com/Asem-Mohamed-321/MultiCloudDevOpsProject./assets/167926594/a6fd06ee-a27d-42ea-9398-db4c1cdcddfa">

o Integrate Sonarqube and Jenkins

- Configure the sonarqube server
<img src="https://github.com/Asem-Mohamed-321/MultiCloudDevOpsProject./assets/167926594/83eb7369-5b2a-4fba-a439-3e9ec1c81d83">

- Add the Sonarqube project configuration in the build file
<img src="https://github.com/Asem-Mohamed-321/MultiCloudDevOpsProject./assets/167926594/5dbf1d9a-c156-428d-a39e-8629dbf1e333">

-  *Remember to add a Sonarqube token as a secret text credintial in Jenkins*
<img src="https://github.com/Asem-Mohamed-321/MultiCloudDevOpsProject./assets/167926594/90f7d4e3-4a8f-4711-8436-f2fe95531c38">

o Configure your pipeline to use the repo with the jenkinsfile
<img src="https://github.com/Asem-Mohamed-321/MultiCloudDevOpsProject./assets/167926594/b39104cd-58ae-4d2e-955b-794796cb67cd">

<img src="https://github.com/Asem-Mohamed-321/MultiCloudDevOpsProject./assets/167926594/6ba995df-aaa7-46dd-889f-00713adf6c3e">

o Build the pipeline

<<>>

<img src="https://github.com/Asem-Mohamed-321/MultiCloudDevOpsProject./assets/167926594/b3aa44a0-157b-48dc-8d24-55c71f525b89">

<img src="https://github.com/Asem-Mohamed-321/MultiCloudDevOpsProject./assets/167926594/5088c567-e95b-4e42-87c1-f1ea1d7795e4">


<img src="https://github.com/Asem-Mohamed-321/MultiCloudDevOpsProject./assets/167926594/1c13a879-3a71-482b-bf3a-d5720d790d23">

<img src="https://github.com/Asem-Mohamed-321/MultiCloudDevOpsProject./assets/167926594/d130431f-62da-47c6-806a-d5adbd0afbc4">

<img src="https://github.com/Asem-Mohamed-321/MultiCloudDevOpsProject./assets/167926594/794c1f5f-0897-4f40-a3ed-fea41919dc89">

<img src="https://github.com/Asem-Mohamed-321/MultiCloudDevOpsProject./assets/167926594/9094a7bd-7ab5-4ab6-b5c3-9db11ac8dab7">




## 6. Continuous Integration with Jenkins.

o Trigger Builds on Code Commits

in the configuration of the pipeline select "GitHub hook trigger for GITScm polling"

<img src="https://github.com/Asem-Mohamed-321/MultiCloudDevOpsProject./assets/167926594/f7dfa151-75a4-495c-9621-5444ccbbf7c1">

in the github repo setting configure the webhook setting 

<img src="https://github.com/Asem-Mohamed-321/MultiCloudDevOpsProject./assets/167926594/8ddd93b9-5a9c-49de-922f-39db047a2c66">

## 6. Automated Deployment Pipeline:


