Ansible is a tool that helps you automate tasks on remote servers.

You can use it to do things like:

Install software (e.g., Apache, MySQL)

Create users

Deploy applications

Copy configuration files

Restart services

And you don’t need to install anything on the remote servers. Ansible connects using SSH (like when you ssh into a server).

A Simple Ansible Playbook Example

- name: Install Apache
  hosts: webservers
  become: yes
  tasks:
    - name: Install Apache2
      apt:
        name: apache2
        state: present

ansible-playbook -i inventory.ini apache_setup.yml


Explanation of the used terminology in the playbook - 

1. - name: Install Apache
✅ What is this?

This is the name of the play.

It’s just a human-readable title for what the play is doing.

Think of it like a chapter title:
📘 “This part installs Apache”.

2. hosts: webservers
✅ What is this?

This tells Ansible which servers to run this play on.

webservers must match a group or host in your inventory file.

🔸 Example inventory.ini:

[webservers]
192.168.1.10 ansible_user=ubuntu

3. become: yes
✅ What is this?

This tells Ansible to run the commands as root, using sudo.

Because things like installing packages or changing configs need admin rights.

Without this, you'd get permission errors.

4. tasks:
✅ What is this?

A list of actions Ansible will perform on the target machine(s).

Each task does one thing: install a package, copy a file, restart a service, etc.

Think of it like a to-do list for Ansible.

5. - name: Install Apache2
✅ What is this?

A label for the task.

Helps you understand what’s happening when you run the playbook (in the output/log).

6. apt:
✅ What is this?

This is a module.

Modules are like tools that Ansible uses to perform tasks.

📦 apt is the module to install packages on Debian/Ubuntu.

Other common modules:

yum → for RHEL/CentOS

copy → to copy files

file → to create/delete files or directories

service → to start/stop services

7. name: apache2
✅ What is this?

An argument for the apt module.

It tells Ansible which package to install.

In this case: apache2.

8. state: present
✅ What is this?

Also an argument.

It means: “Make sure this package is installed.”

Other possible values:

absent → uninstall the package

latest → install the latest version