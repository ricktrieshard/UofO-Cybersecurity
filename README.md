# UofO-Cybersecurity
## Automated ELK Stack Deployment

The files in this repository were tested and used to configure the network depicted below.


![image](https://user-images.githubusercontent.com/80989467/130373567-20b420c1-8c31-4a99-94c2-d259bc80ed7c.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the yml and config file may be used to install only certain pieces of it, such as Filebeat.

* [Ansible.cfg](https://github.com/ricktrieshard/UofO-Cybersecurity/blob/main/Ansible/ansible.cfg)
* [hosts file](https://github.com/ricktrieshard/UofO-Cybersecurity/blob/main/Ansible/hosts)
* [filebeat-config.yml](https://github.com/ricktrieshard/UofO-Cybersecurity/blob/main/Ansible/filebeat-config.yml)
* [filebeat-playbook.yml](https://github.com/ricktrieshard/UofO-Cybersecurity/blob/main/Ansible/filebeat-playbook.yml)
* [install-elk.yml](https://github.com/ricktrieshard/UofO-Cybersecurity/blob/main/Ansible/install-elk.yml)
* [metricbeat-config.yml](https://github.com/ricktrieshard/UofO-Cybersecurity/blob/main/Ansible/metricbeat-config.yml)
* [metricbeat-playbook.yml](https://github.com/ricktrieshard/UofO-Cybersecurity/blob/main/Ansible/metricbeat-playbook.yml)
* [my-playbook.yml](https://github.com/ricktrieshard/UofO-Cybersecurity/blob/main/Ansible/my-playbook.yml)
* [pentest.yml](https://github.com/ricktrieshard/UofO-Cybersecurity/blob/main/Ansible/pentest.yml)
* [python-pip.yml](https://github.com/ricktrieshard/UofO-Cybersecurity/blob/main/Ansible/python-pip.yml)



### This document contains the following details:

* Description of Topology
* Access Policies
* ELK Configuration
* Beats in Use
* Machines Being Monitored
* How to Use the Ansible Build

#### Description of Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application. By utilizing one virtual machine as the 'jumpbox,' the containers in other VMs can be easily modified if needed with having to login individually to a maching or container. It also restrict the exposing the backend server directly to the internet.

Load balancing ensures that the application will be highly available and efficient, in addition to restricting access to the network. By distributing all the traffic amongst the webservers, the network will not be overwhelmed by too many requests. This will also help in preventing a DoS attack.
    
Integrating an ELK server with DVWA and modules like Metricbeat and Filebeat, the webservers can be easily monitored which will be useful in mitigating or spotting an attack.

    Filebeat will monitor log files, collect those events and forward them to the ELK Elasticsearch or Logstach for indexing.
    
    Metricbeat periodically records metric data, including operating system metrics like CPU or memory data related to the services       running on the servers. Metricbeat takes the metrics and statistics that it collects and ships them to the output that you           specify, such as Elasticsearch or Logstash

The configuration details of each machine may be found below. Note: Use the Markdown Table Generator to add/remove values from the table.
| Name |	Function |	IP Address |	Operating System |
| -----| --------- | ----------- | ----------------- |
| Jump Box |	Gateway |	10.0.0.1 |	Linux Ubuntu 18.04|
| Web-1 | Docker-DVWA | 10.0.0.4 | Linux Ubuntu 18.04  |			
| Web-2 | Docker-DVWA | 10.0.0.5 | Linux Ubuntu 18.04 |
| Elk | ELK Stack | 20.185.232.115 110.0.0.4 | Linux Ubuntu 18.04 |			

#### Access Policies

The machines on the internal network are not exposed to the public Internet.

Only the Jump-Box machine can accept connections from the Internet. Access to this machine is only allowed from my personal public IP address, and only via ssh:

    * 76.104.139.184


A summary of the access policies in place can be found in the table below.
| Name |	Publicly Accessible |	Allowed IP Addresses |
| Jump Box | Yes | Admin's IP Address (76.104.139.184 |
| Web-1 | No | 10.0.0.4 |
| Web-2 | No | 10.0.0.5 |
| Elk Server | No | 10.0.0.1 |
		
#### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because there is less room for error and this same script can be re-used again and again with only some potential tweaking of the file to better suit the particular virtual machines or needs. 

The install-elk.yml playbook implements the following tasks:

    1. Installs docker.io - It references the IP address listed under the [elk] header in the ansible's hosts file to inatall docker on the target VM.
    2. Increase virtual memeory - A standard container does not have enough virtual memory to run and ELK container, so this part of the playbook increases that.
    3. Installs python3 - The Docker module uses python, so you have to make sure it is installed on the container machines.
    4. Installs docker module - This part of the file is what actually does the installation of docker.
    5. Downloades and launches a web container - Downloads and launches the ELK container, and lists the ports needed to access said container.
    

The following screenshot displays the result of running docker ps after successfully configuring the ELK instance.

Note: The following image link needs to be updated. Replace docker_ps_output.png with the name of your screenshot image file.

TODO: Update the path with the name of your screenshot of docker ps output
Target Machines & Beats

This ELK server is configured to monitor the following machines:

    TODO: List the IP addresses of the machines you are monitoring

We have installed the following Beats on these machines:

    TODO: Specify which Beats you successfully installed

These Beats allow us to collect the following information from each machine:

    TODO: In 1-2 sentences, explain what kind of data each beat collects, and provide 1 example of what you expect to see. E.g., Winlogbeat collects Windows logs, which we use to track user logon events, etc.

#### Using the Playbook

In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned:

SSH into the control node and follow the steps below:

    Copy the _____ file to _____.
    Update the _____ file to include...
    Run the playbook, and navigate to ____ to check that the installation worked as expected.

TODO: Answer the following questions to fill in the blanks:

    Which file is the playbook? Where do you copy it?
    Which file do you update to make Ansible run the playbook on a specific machine? How do I specify which machine to install the ELK server on versus which to install Filebeat on?
    _Which URL do you navigate to in order to check that the ELK server is running?

As a Bonus, provide the specific commands the user will need to run to download the playbook, update the files, etc.
