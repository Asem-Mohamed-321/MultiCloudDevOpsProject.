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


   
