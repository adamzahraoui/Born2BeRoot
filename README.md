# 🛠️ Virtual Machine Setup and Configuration Guide

## Table of Contents

1. [Installing the Virtual Machine](#installing-the-virtual-machine)
   - [💿 Virtual Machine ISO](#virtual-machine-iso)
   - [🖥️ VirtualBox](#virtualbox)
   - [💿 Attaching ISO to VirtualBox](#attaching-iso-to-virtualbox)
2. [⚙️ Virtual Machine Setup](#virtual-machine-setup)
   - [⚙️ First Connection](#first-connection)
   - [👤 Installing Sudo & Configuring User and Groups](#installing-sudo--configuring-user-and-groups)
   - [📶 Installing & Configuring SSH](#installing--configuring-ssh)
   - [🔥 Installing & Configuring UFW 🔥🧱 Firewall](#installing--configuring-ufw-firewall)
   - [🔐 Sudo Policies](#sudo-policies)
   - [🔑 Password Policy](#password-policy)
3. [🧾 Scripts and Scheduling](#scripts-and-scheduling)
   - [🚨 Script](#script)
   - [⏰ Crontab](#crontab)
4. [✒️ Signature File](#signature-file)
   - [📄 signature.txt](#signaturetxt)
5. [😊 BONUS Services](#bonus-services)
   - [💡 Lighttpd](#lighttpd)
   - [📰 WordPress](#wordpress)
   - [🐬 MariaDB](#mariadb)
   - [🐘 PHP](#php)
   - [📰 WordPress Configuration](#wordpress-configuration)

---

## Installing the Virtual Machine

## 💿 Virtual Machine ISO

First, we need to download the Debian ISO from the official Debian website:  

[Debian -- Downloading Debian](https://www.debian.org/)  

### What is an ISO File?  
An **ISO file** is a type of disk image file used to replicate the content and structure of a physical disk, like a CD, DVD, or Blu-ray, in a single file. It’s commonly used for operating system installations.  

Follow the link above to download the ISO file suitable for your system.  


### 💿 Attaching ISO to VirtualBox
How to attach the Debian ISO to your VirtualBox instance.

[whatch this video](https://www.youtube.com/watch?v=OQEdjt38ZJA&t=12s) 

---

## ⚙️ Virtual Machine Setup

### ⚙️ First Connection
Instructions for your first login to the virtual machine.

### 👤 Installing Sudo & Configuring User and Groups

`sudo` is a program for Unix-like operating systems that enables users to run programs with the security privileges of another user, typically the superuser. Originally, it stood for **"superuser do"**, which reflects its primary purpose, but it is now referred to as **"su 'do'"** by the official project.

#### Steps to Install Sudo

1. **Switch to the Root User**  
   To start the installation, change to the root user by typing:  
   ```bash
   su -
   ```
   su - in the bash prompt and introduce the root password.
2. **Once we are done we write down the command**
   ```bash
   apt install sudo
   ```
   So the package manager install the required packages for sudo.
3. **We must reboot machine so the changes can be applied. For that porpouse we will use the commando**
   ```bash
   reboot
   ```
4. **Once the machine is rebooted we have to input the encryptation password and the login again. To check if sudo have been installed correctly we must switch to root user**
   ```bash
   su -
   ```
5. **and then use the command**
   ```bash
   sudo -V
   ```

### 👤 Creating an Additional User (If Not Set During Installation)

If you did not set up your user as required during the installation of the system, you can still create a new user.  

1. **Stay Logged in as Root**  
   Ensure you are still logged in as the root user.  

2. **Create a New User**  
   Use the following command to create a new user:  
   ```bash
   sudo adduser <login>
   ```
### 👥 Creating a Group

To organize users or grant specific permissions, you can create a new group. In this example, we will create a group called `user42`.

1. **Stay Logged in as Root**  
   Ensure you are logged in as the root user or a user with `sudo` privileges.  

2. **Create the Group**  
   Use the following command to create the group:  
   ```bash
   sudo addgroup user42
   ```
### 🧠 What is GID?  

**GID** stands for **Group Identifier**, which is a unique numeric ID assigned to each group in the system. It’s essentially the group’s version of a user ID (UID).  

---

### 🤔 Was the Group Created Successfully?  

Even if there are no visible issues, it’s a good practice to verify the group’s creation.  

1. **Check Group Information**  
   Use the following command to view details about the group:  
   ```bash
   getent group <groupname>
   ```
   
This provides clarity on GID and practical steps to verify group creation. 😊
### 🫂 Adding a User to a Group  

You can add a user to a group using the `adduser` command. Here's how to do it:

1. **Add a User to a Group**  
   Use the following command to include a user in a specific group:  
   ```bash
   sudo adduser <user> <groupname>
   ```

### 📶 Installing & Configuring SSH

## 📶 SSH: Secure Shell  

**SSH** stands for **"Secure Shell"** and is a protocol designed for secure remote communication. It serves as a secure alternative to older, unsecured remote shell protocols by utilizing a client-server model to establish a secure channel for communication.

---

## Updating the System  

Before setting up SSH, it’s a good practice to ensure the system is up to date. Run the following command:  
```bash
sudo apt update
```
---

## Installing OpenSSH  

To enable remote access using the SSH protocol, you need to install the OpenSSH server package. This is the main tool for setting up secure remote connections.

1. **Install OpenSSH**  
   Run the following command to install the `openssh-server` package:  
   ```bash
   sudo apt install openssh-server
   ```
---

## Verifying SSH Service Status  

To ensure the SSH installation has been completed without any issues, you can check the status of the SSH service using the following command:  

```bash
sudo service ssh status
```
## 📶 Configuring SSH  

After installing SSH, there are some files that need to be configured to fine-tune the SSH settings. For this, you can use a text editor like **Nano** or **VIM**. If **VIM** is not installed, you can install it using:  

```bash
sudo apt install vim
```
---

## Editing the SSH Configuration File (Continued)  

In the SSH configuration file (`/etc/ssh/sshd_config`), lines beginning with a `#` are commented out and not active. To modify settings, we need to uncomment (remove the `#` at the beginning of the line) and update the values as needed.

1. **Change the SSH Port**  
   Find the line:  
   ```bash
   #Port 22
   #PermitRootLogin prohibit-password -> PermitRootLogin no
   ```
---

## Restarting the SSH Service  

After making changes to the SSH configuration file, it's important to restart the SSH service so that the new settings can take effect.  

Use the following command to restart the SSH service:  
```bash
sudo service ssh restart
```
---

## Checking the SSH Service Status  

Once the SSH service has been restarted, it’s a good practice to check its status to ensure that it is running properly.  

You can check the status of the SSH service with the following command:  
```bash
sudo service ssh status
```
---

## Connecting via SSH to the Virtual Machine  

To connect from your local machine to the virtual machine via SSH, use the following command:  

```bash
ssh <user>@localhost -p 4242
```

This section guides users on how to initiate an SSH connection to their virtual machine, verify successful login, and troubleshoot if needed.

### 🔥 Installing & Configuring UFW 🔥🧱 Firewall
---

## Installing UFW (Uncomplicated Firewall)  

UFW is a firewall management tool that uses iptables to configure firewall rules through simple commands. Let's start by installing UFW on your system.  

To install UFW, use the following command:  
```bash
sudo apt install ufw
```
This provides the user with the first step to set up UFW on their system. 😊

---

## Enabling UFW (Uncomplicated Firewall)  

Once UFW is installed, the next step is to enable it to start using the firewall rules.  

To enable UFW, use the following command:  
```bash
sudo ufw enable
```
This helps users understand how to activate UFW and verify that it is working correctly. 😊

---

## Allowing Connections on Port 4242  

To ensure that your SSH connections on port 4242 can pass through the firewall, you need to allow this port.  

Use the following command to allow connections on port 4242:  
```bash
sudo ufw allow 4242
```
This will ensure that users can connect to the virtual machine via SSH without being blocked by the firewall. 😊

---

#### Checking the UFW Firewall Status  

Once you’ve configured the firewall and allowed port 4242, it’s a good idea to verify that everything is set up correctly.

To check the current status of the firewall and see the active rules, use the following command:  
```bash
sudo ufw status
```
This helps users ensure that their firewall is correctly configured and that the necessary ports are open. 😊

### 🔐 Sudo Policies
---

## Creating a Sudoers File  

To configure custom sudo policies, we need to open a file in the `visudo` . This file will store the sudo configuration for our system.

To open the file, use the following command:  
```bash
sudo visudo
```
---

## Creating a Directory for Logging Sudo Commands  

To ensure that all sudo commands (both input and output) are logged, we need to create a directory in `/var/log/`. This will be used to store the logs for all sudo activities.

To create the directory, use the following command:  
```bash
mkdir /var/log/sudo
```
---

## Configuring the Sudo Policy  

After creating the `sudo_config` file, we need to configure it with specific sudo policies. Open the file and add the following commands to set up the desired behavior for sudo:

```bash
Defaults  passwd_tries=3
Defaults  badpass_message="Mensaje de error personalizado"
Defaults  logfile="/var/log/sudo/sudo_config"
Defaults  requiretty
```
passwd_tries=3: Total tries for entering the sudo password.

badpass_message="message": The message that will show when the password failed.

logfile="/var/log/sudo/sudo_config": Path where will the sudo logs will be stored.

requiretty: TTY become required

### 🔑 Password Policy

---

## Editing the `login.defs` File

The first step in configuring login policies is to edit the `/etc/login.defs` file. To open it for editing, run the following command:

```bash
vim /etc/login.defs
```
---

## Configuring Password Policies in `login.defs`

After opening the `/etc/login.defs` file, we will set the following parameters for password management:

1. **PASS_MAX_DAYS**: Set the maximum number of days a password is valid before it must be changed. Change from `99999` to `30` and `0` to `2`.

   ```plaintext
   PASS_MAX_DAYS 30
   PASS_MIN_DAYS 2
   ```
PASS_MAX_DAYS: It's the max days till password expiration.

PASS_MIN_DAYS: It's the min days till password change.

PASS_WARN_AGE: It's the days till password warning.

---

## Installing Password Quality Packages

To enforce password quality, we need to install the necessary packages. Run the following command to install `libpam-pwquality`:

```bash
sudo apt install libpam-pwquality
```
---

## Editing the `common-password` File

Next, we need to edit the `common-password` file to configure password quality settings. Open the file using the following command:

```bash
sudo vim /etc/pam.d/common-password
```
---

## Configuring Password Quality Rules

Below the `retry=3` line in the `/etc/pam.d/common-password` file, add the following commands to enforce password complexity:

```bash
minlen=10 ucredit=-1 dcredit=-1 lcredit=-1 maxrepeat=3 reject_username enforce_for_root
in new line add
difok=7, because the rule does not apply to the root password
```
minlen=10: Minimum password length of 10 characters.
ucredit=-1: At least one uppercase letter required.
dcredit=-1: At least one digit required.
lcredit=-1: At least one lowercase letter required.
maxrepeat=3: Limits the number of repeated characters in the password.
reject_username: Prevents passwords that contain the username.
difok=7: Requires at least 7 characters to be different from the previous password.
enforce_for_root: Ensures that the root user must follow these password rules as well.

---

## 🧾 Scripts and Scheduling

### 🚨 Script

[look in my script]()

### ⏰ Crontab
Set up scheduled tasks using crontab.

---

## ✒️ Signature File

### 📄 signature.txt
Guide to verify or create a signature file.

---

## 😊 BONUS Services

### 💡 Lighttpd
Installing and configuring the Lighttpd web server.

### 📰 WordPress
Setting up WordPress.

### 🐬 MariaDB
Installing and configuring the MariaDB database.

### 🐘 PHP
Installing PHP for dynamic web applications.

### 📰 WordPress Configuration
Final steps to configure WordPress.

---

Enjoy setting up your virtual machine and services! 🎉
