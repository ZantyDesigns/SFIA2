# **SFIA2 Individual Project - Flask Application**

### **_Resources_**
* Jira - https://jnah.atlassian.net/secure/RapidBoard.jspa?rapidView=2&projectKey=SFIA2&selectedIssue=SFIA2-14
* Presentation - https://docs.google.com/presentation/d/1bLm8JP-N2AEOxREivX_tC338M_pduU0nlrTgE1auUk8/edit?usp=sharing

## Contents
* [Project Brief](#project-brief)
* [Project Objectives](#project-objectives)
* [Project Outcome](#project-outcome)
* [Project Management](#project-management)
* [Deployment](#deployment)
* [Issues](#issues)
* [Future Improvements](#future-improvements)

## Project Brief
The purpose of the project is to create a fully functional CI pipeline that utilises supported tools to deploy a simple python application. The application will be tested and hosted on the cloud using AWS. 

## Project Objectives
* Create multiple VMs using Terraform to both test and deploy the application through AWS
* Use Ansible to install Jenkins onto a designated VM
* Run tests in testing VM using pytest before deploying application
* Implement containeriztion using Docker so the application can be deployed regardless of system configuration
* Use Docker Compose to deploy multiple containers into a bridge network
* Store pre-populated database in an RDS instance using AWS

## Project Outcome
* VMs are created with correct security group measures and variables using Terraform ready to be used to test and deploy.
* Ansible is able to install and configure a Jenkins user on the Jenkins VM to run a pipeline job.
* Tests are ran on the testing VM before the application is deployed through Kubernetes.
* Application is successfully hosted and user can view the database entires for users.


## Project Management

## Jira & Sprints
A kanban board was created using Jira to plan user stories and tasks in advance to track project development progress and stages. User stories were used to create outcomes of expected actions e.g. User can see entries for users. Technical implementation tasks were then generated for each user story to breakdown how these technologies were going to be used. The tasks and user stories were collectively added to a sprint which gave time contraints to each technical implementation. This allowed for efficient time management and the ability to visualize the level of importance for each task.
![jira](https://i.imgur.com/Ei03VVN.png)

## Risk Assessment
|                              Risk                             |                                                                                                                       Analysis of Risk                                                                                                                      | Probability | Severity |                                                                                                       Action                                                                                                       |
|:-------------------------------------------------------------:|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------:|:-----------:|:--------:|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------:|
| Database password is stored in a  file on a public repository | Anyone with access to the local project repository may be able to locate the database login information and therefore gain access to potentially valuable information aswell as having full control of the functionality of the database.                   | Likely      | Severe   | Store the database login information as secret credentials on Jenkins  and pass the variables through the script.                                                                                                  |
| AWS Server unexpectedly goes offline                          | AWS as like any other online platform can always have the potential risk of  a temporary server outage causing any related resources such as EC2 instances and RDS database instances to be taken offline.                                                  | Not Likely  | Low      | AWS has a track record of minimal server outages and can guarantee 99.99% reliability for all of its systems and resources. The performance of EC2 instances can be monitored from the control panel at all times. |
| Jenkins user information leaked                               | Each time a new instance is created through terraform, Jenkins needs to be installed and configured using Ansible. This configuiration includes user settings such as login data.                                                                           | Not Likely  | Low      | The password for the Jenkins user can be stored as a local variable                                                                                                                                                |
| Terraform RDS variables stored in public repository           | When creating Terraform the username and passwords need to be passed through in order to create an RDS instanc as the administrator. These variables need to be made in a local terraform variable file which would  then be stored on a remote repository. | Likely      | Severe   | Add Terraform variables file to .gitignore                                                                                                                                                                         |

## CI Pipeline
![ci](https://i.imgur.com/xCFf1bO.png)

## Deployment
### **Amazon Web Services(AWS)**
AWS was used as the main hosting provider for our EC2 and RDS instances. AWS offers an affordable but reliable solution to hosting both deployment and testing environments on the cloud. For this project in particular, it enabled the use of several network configuration options using security groups and VPC (virtual private cloud) to create networks of EC2 instances for better communication and security. AWS was also used as the database server host to store our MySQL databases and tables.

### **Docker**
Docker provides a solution to several virtual machine limitations and issues in regards to compatibility, resource usage and emulation. Docker uses containerization to deploy several contained images within a docker container that include project dependancies and variables. It uses remote registries such as Docker Hub to store these images so that the application can be more accessible. These containers allow for the application to be reproduced and built in differing environments.

### **Jenkins**
Jenkins is a CI server that offers a simple solution to automating continuous integration and delivery using various programming source code. By creating a job and a Jenkinsfile we were able to implement stages of development that included testing and building the application to a testing environment. Jenkins also allowed for the use of secret variable and credential storage so we could pass in sensitive information through variables in the Jenkinsfile. Plugins could also be installed 

### **Ansible**
Ansible is an open source software that is used for configuration and software deployment. It uses .yaml files to configure deployment settings and hosts.
Ansible is a powerful piece of software that uses ssh access to connect to hosts and deploy configuration instructions. It uses an inventory file to store host addresses and variables to use when connecting via SSH to allow for successful authentication. For example, this project uses the playbook to ssh into the testing VM and install the docker and docker-compose dependancies and then shh into the Jenkins VM and configure the Jenkins user.

### **Terraform**
Although AWS includes its own GUI configuration interface when creating EC2 instances, it can sometimes become inconsitent over time and hard to maintain especially when you are using several different user groups and configuration settings for different instances. Terraform uses Infrastructure as Code which allows you to create individual, consistent configuration settings for each instance created in a time saving and efficient manner. This means that any instances can be created, managed and destroyed through the CLI using the configuration files created previosuly. The Terraform CLI allows the user to read configuration files and provide an execution plan of changes, which can be reviewed for safety and then applied and provisioned.

### **Kubernetes**
Kubernetes is a portable, open-source platform that is used to manage containerized services for automation. As we are using docker containers for our project deployment solution, we are able to use Kubernetes to deploy these containers into a cluster. A cluster contains a group of hosts that are then stored in pods which store our docker containers and images. This cluster can then configure these different hosts to deploy to a single address in order for the user to access the application that has been built.

## Issues
* Changes to the frontend do not update through the Jenkins build but instead can be applied by manually pushing the docker images to dockerhub and rebuilding the Kubernetes pods within the Cluster.
* Pytest returns a failed test result. Have yet to find solution as to why the tests are failing.

## Future Improvements
* Implement Kubernetes deployment through Jenkins to add functionality for better automation
* Terraform can configure the Kubernetes Cluster

## Author
* Jordan Hamilton
* QA Cloud Native Consultant
* JHamilton@QA.com
