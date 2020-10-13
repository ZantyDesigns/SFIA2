# **SFIA2 Individual Project - Flask Application**

### **_Resources_**
* Jira - 
* Presentation -

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


### **Docker**
Docker provides a solution to several virtual machine limitations and issues in regards to compatibility, resource usage and emulation. Docker uses containerization to deploy several contained images within a docker container that include project dependancies and variables. It uses remote registries such as Docker Hub to store these images so that the application can be more accessible. These containers allow for the application to be reproduced and built in differing environments.

### **Jenkins**


### **Ansible**


### **Terraform**
Although AWS includes its own GUI configuration interface when creating EC2 instances, it can sometimes become inconsitent over time and hard to maintain especially when you are using several different user groups and configuration settings for different instances. Terraform uses Infrastructure as Code which allows you to create individual, consistent configuration settings for each instance created in a time saving and efficient manner. This means that any instances can be created, managed and destroyed through the CLI using the configuration files created and the CLI. The Terraform CLI reads configuration files and provides an execution plan of changes, which can be reviewed for safety and then applied and provisioned.

### **Kubernetes**


## Issues


## Future Improvements


## Author
* Jordan Hamilton
* QA Cloud Native Consultant
* JHamilton@QA.com
