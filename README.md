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

[Description of topology](#description-of-topology)

[Access Policies](#access-policies)

[Elk Configuration](#elk-configuration)

[Target Machines & Beats](#target-machines-and-beats)

[Using the Playbook](#using-the-playbook)



#### Description of Topology <a name="description-of-topology"></a>

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application. By utilizing one virtual machine as the 'jumpbox,' the containers in other VMs can be easily modified if needed without having to login individually to a machine or container. It also restricts the exposure of the backend servers directly to the internet.

Load balancing ensures that the application will be highly available and efficient, in addition to restricting access to the network. By distributing all the traffic amongst the webservers, the network will not be overwhelmed by too many requests. This will also help in preventing a DoS attack.
    
Integrating an ELK server with DVWA and modules like Metricbeat and Filebeat, the webservers can be easily monitored which will be useful in mitigating or spotting an attack.

The configuration details of each machine may be found below. 
| Name |	Function |	IP Address |	Operating System |
| -----| --------- | ----------- | ----------------- |
| Jump Box |	Gateway |	10.0.0.4 |	Linux Ubuntu 18.04|
| Web-1 | Docker-DVWA | 10.0.0.5 | Linux Ubuntu 18.04  |			
| Web-2 | Docker-DVWA | 10.0.0.6 | Linux Ubuntu 18.04 |
| Elk | ELK Stack | 20.185.232.115 110.0.0.4 | Linux Ubuntu 18.04 |

#### Access Policies <a name="access-policies"></a>

The machines on the internal network are not exposed to the public Internet.

Only the Jump-Box machine can accept connections from the Internet. Access to this machine is only allowed via ssh from the following IP address:76.104.139.184

Machines within the network can only be accessed by the jumpbox. The ELK server is on it's own virtual netork, but by using peering, it can be accessed via the jumpbox.

  
A summary of the access policies in place can be found in the table below.
| Name | Publicly Accessible | Allowed IP Addresses |
| ---- | ------------------- | -------------------- |
| Jump Box | Yes | Admin's IP Address (76.104.139.184) |
| Web-1 | No | 10.0.0.4 | 
| Web-2 | No | 10.0.0.4 |
| Elk Server | No | 10.0.0.4 |
		
#### Elk Configuration <a name="elk-configuration"></a>

Adnsible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because there is less room for error and this same script can be re-used again and again with only some potential tweaking of the file to better suit the particular virtual machines or needs. The following installation information may need to be adjusted to fit a specific situation. For example, the command curl in the file filebeat-playbook.yml may need to be changed from to wget.

The install-elk.yml playbook implements the following tasks:

    1. Installs docker.io - It references the IP address listed under the [elk] header in the ansible's hosts file to inatall docker on the target VM.
    2. Increase virtual memeory - A standard container does not have enough virtual memory to run and ELK container, so this part of the 	        playbook increases that.
    3. Installs python3 - The Docker module uses python, so you have to make sure it is installed on the container machines.
    4. Installs docker module - This part of the file is what actually does the installation of docker.
    5. Downloades and launches a web container - Downloads and launches the ELK container, and lists the ports needed to access said container.
    

The following screenshot displays the result of running docker ps after successfully configuring the ELK instance.

![image](https://user-images.githubusercontent.com/80989467/130657782-d8a0fff4-5ce2-4724-8634-73ac95bdec6a.png)


#### Target Machines & Beats <a name="target-machines-and-beats"></a>

This ELK server is configured to monitor the following machines:

   * Web-1 (10.0.0.5)
   * Web-2 (10.0.0.6)

We have installed the following Beats on these machines:
* Filebeat
* Metricbeat

These Beats allow us to collect the following information from each
* Filebeat monitors the log files or locations that you specify, collects log events, and forwards them either to Elasticsearch or Logstash for indexing. It's primarily a Log Management system.
* Metricbeat takes the metrics and statistics that it collects and ships them to the output that you specify such as Elasticsearch or Logstash. It's primarily a Monitoring tool. It collects metrics.


#### Using the Playbook <a name="using-the-playbook"></a>

In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned:

SSH into the control node and follow the steps below:

	* Copy the Install-elk.yml file to /etc/ansible.
	* Update the hosts file to include the ELK Server and it's IP adress.
	* Run the playbook, and navigate to Elk Server's public IP adress, http://(elk ip address):5601, to check that the installation worked as expected.

 
Here are the specific commands you need to run to download the playbook, update the files, etc.

* ansible playbook /etc/ansible/install-elk.yml
* ssh azadmin@JumpBox(PrivateIP)
* sudo docker container list -a
* sudo docker start container (container name)
* sudo docker attach container (container name)
* cd/etc/ansible/
* ansible-playbook install-elk.yml
* cd /etc/ansible/roles/
* ansible-playbook filebeat-playbook.yml
* http://20.185.232.115:5601/
