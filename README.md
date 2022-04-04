## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

https://github.com/gtncruzado/Kibana-GC-/blob/main/diagrams/Diagram_1.drawio.png

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the _____ file may be used to install only certain pieces of it, such as Filebeat.

  - https://github.com/gtncruzado/Kibana-GC-/blob/main/ansible/my%20filebeat%20and%20metricbeat%20playbook/metricbeatANDfilebeat-playbook.yml

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting access to the network.
- Load Balancers protect against denial-of-service (DOS) attacks. It distributes traffic evenly among the servers that are connected to it. It is also common for load balancers to have a health probe that periodically checks that a machine is working properly before sending traffic. This prevents overloading one server.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the logs and system traffic.
- Filebeat watches for changes to the files and keeps a record of those changes and when they occurred in log files
- Metricbeat records metrics from the Operating system and services running on the server. By using Elasticsearch or Logstash, you can visualize the metrics and statistics that Metricbeat generates from the OS and running services.

The configuration details of each machine may be found below.
_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

| Name                  | Function                    | IP Address | Operating System |
|-----------------------|-----------------------------|------------|------------------|
| newJumpBoxProvisioner | Gateway                     | 10.0.0.5   | Linux            |
| Web-1                 | Application Server for DVWA | 10.0.0.6   | Linux            |
| Web-2                 | Application Server for DVWA | 10.0.0.7   | Linux            |
| Web-3                 | Web Server to run DVWA      | 10.0.0.4   | Linux            |
| ELK Server            | ELK Container and Kibana    | 10.0.0.4   | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the ELK Server machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- _TODO: Add whitelisted IP addresses_

Machines within the network can only be accessed by "newJumpBoxPrivisioner".
- Only the "newJumpBoxPrivioner" could access the ELK-VM

A summary of the access policies in place can be found in the table below.

| Name                  | Publicly Accessible | Allowed IP Addresses |
|-----------------------|---------------------|----------------------|
| newJumpBoxProvisioner | Yes                 |    52.165.158.214    |
|   Web-1               |     No              |   10.0.0.4           |
|  Web-2                |            No       |     10.0.0.4         |
|  Web-3                |                No   |       10.0.0.4       |
| ELK Server            | Yes (via port 5601  |     52.165.158.214   |
|   Load Balancer       |  Yes (via port 80)  | 52.165.158.214       |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- Automating the configuration of Ansible adds the advantage of saving the time of punching code in that is repeatable anyway

The playbook implements the following tasks:
- _TODO: In 3-5 bullets, explain the steps of the ELK installation play. E.g., install Docker; download image; etc._
- ...
- ...

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

https://github.com/gtncruzado/Kibana-GC-/blob/main/Images/of_docker_containers.PNG

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- Web-1 10.0.0.6, Web-2 10.0.0.7, Web-3 10.0.0.4

We have installed the following Beats on these machines:
- filebeat and metricbeat

These Beats allow us to collect the following information from each machine:
- Metricbeat collects statistics for every process running on your system including memory, CPU usage, file system, Network IO and disk IO statics.
- Filebeat collects log information about the file system and specifies which files have been changed and when a file was changed to either Elasticsearch or Logstash. To see the output from Filebeat, one would connect to Kibana and check the logs for any changes that have been made to the file system over a specific or more general time interval.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the filebeat-config.yml file to /etc/ansible/files/filebeat-config.yml
- Update the filebeat-config.yml file to include host "10.1.0.4:9200" with username "elastic" and password "changeme" and setup.Kibana host to "10.1.0.4:5601".
- Run the playbook, and navigate to Kibana (Elk GUI interface) and click "Check Data" to check that the installation worked as expected.
https://github.com/gtncruzado/Kibana-GC-/blob/main/Images/metric%20docker%20logs.PNG
https://github.com/gtncruzado/Kibana-GC-/blob/main/Images/systems%20logs.PNG

- _Which file is the playbook?_ filebeat-playbook.yml _Where do you copy it?_ /etc/ansible/roles/filebeat.playbook.yml
- _Which file do you update to make Ansible run the playbook on a specific machine?_ filebeat-config.yml _How do I specify which machine to install the ELK server on versus which to install Filebeat on?_ First, all private IP addresses that need to be accessed need to be added to the hosts file in order to allow connection. For the purposes of this project, we added 3 IP addresses to this file: 2 were web servers (10.0.0.5 & 10.0.0.6) and an elk server was added with IP 10.1.0.4. From there, in the playbook file, navigate to "hosts" at the top of the file to specify whether you want the playbook installed on Elk or the Web servers. In addition to this, we also have to specify the host to the ELK server for Filebeat so IP "10.1.0.4" is added to the config file to specify the location for installation.
https://github.com/gtncruzado/Kibana-GC-/blob/main/ansible/my%20filebeat%20and%20metricbeat%20playbook/filebeat-config.yml
https://github.com/gtncruzado/Kibana-GC-/blob/main/ansible/hosts

- _Which URL do you navigate to in order to check that the ELK server is running?_  http://20.211.121.143:5601/app/kibana

Before running the playbook, edit the config file host to make sure your IP is added so it runs by nanoing into the file.
To run the playbook: Ansible-playbook playbookname.yml
