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

[look in my script](monitoring.sh)

### ⏰ Crontab
---

## Configuring Crontab

Crontab is a background process manager that allows you to schedule tasks to be executed at specified times. To properly configure crontab, we need to edit the crontab file.

To do this, use the following command:

```bash
sudo crontab -u root -e
```
---

## Configuring Crontab

Crontab is a background process manager that allows you to schedule tasks to be executed at specified times. To properly configure crontab, we need to edit the crontab file.

To do this, use the following command:

```bash
crontab -e
```
In the file, we must add the following command for the script to execute every 10 minutes 
```
@reboot /bin/bash -c "while true; do /bin/bash /root/monitoring.sh; sleep 600; done"
```

---

### ✒️ Signature File

## Obtaining the Signature

To obtain the signature of your virtual machine, follow these steps:

1. **Shut down the virtual machine**: 
   Before obtaining the signature, ensure that the virtual machine is shut down. This is crucial because once the VM is turned on or any modifications are made, the signature will change.

2. **Locate the .vdi file**:
   After shutting down the VM, locate the **.vdi** (Virtual Disk Image) file of your virtual machine. This file is typically stored on your physical machine. Navigate to the path where the **.vdi** file is located.

---

## Obtaining the Signature (Continued)

3. **Generate the Signature**:
   Once the virtual machine is shut down, navigate to the path where the `.vdi` file is located. To generate the signature, use the following command:

   ```bash
   sha1sum machinename.vdi
   ```
The shasum command will generate a SHA-1 hash checksum, which serves as the signature for the file.

Save the Signature: The output of the shasum command is the signature you need. Copy this signature and paste it into the signature.txt file.

Important:

Do not reopen the virtual machine: Once the signature is generated, do not restart or modify the virtual machine, as it will change the signature.
For any corrections: If you need to make any changes to the VM, clone the machine. This allows you to start the virtual machine without altering the original signature.
This ensures the integrity of your file and avoids any issues with signature verification.

## 😊 BONUS Services

### 💡 Lighttpd

Lighttpd: is a web server designed to be fast, secure, flexible, and standards-compliant. It is optimized for environments where speed is a top priority because it consumes less CPU and RAM than other servers.

 1. **Installation of Lighttpd packages**
```bash
sudo apt install lighttpd
```

2. **We allow connections through port 80 with the command**
```bash
sudo ufw allow 80
```
3. **We check that we have actually allowed it. Port 80 and allow should appear**
```bash
sudo ufw status
```

### 📰 WordPress

# WordPress Installation

WordPress is a content management system focused on creating all types of websites. This guide explains how to install WordPress and configure it on your server.

## 1. Install Required Packages

Before installing WordPress, we need to install `wget` and `zip`. These tools will allow us to download and extract the WordPress package.

Run the following command to install `wget` and `zip`:

```bash
sudo apt install wget zip
```

## 2. Once we have installed the packages we must locate ourselves in the folder /var/www/ with the command cd we will access it
```bash
cd /var/www/
```

## 3.Once we are in the path /var/www/ we must download the latest version of WordPress. As my native language is Spanish I will select the latest version in Spanish. We will use the following command
```bash
sudo wget https://es.wordpress.org/latest-fr_FR.zip
```

## 4.Unzip the file you just downloaded with the command
```bash
sudo unzip latest-en_US.zip
```

## 5.We will rename the folder html and call it html_old:
```bash
sudo mv html/ html_old/
```

## 6.Now we will rename the wordpress folder and call it html
```bash
sudo mv wordpress/ html
```

## 7.Finally we will set these permissions on the html folder. We will use the command sudo chmod -R 755 html. The number 7 indicates that the owner has read, write and execute permissions. The number 5 indicates that the group and others only have read and execute permissions.
```bash
sudo chmod -R 755 html
```


### 🐬 MariaDB

# MariaDB Installation

MariaDB is an open-source relational database management system (RDBMS). It is commonly used for various purposes, including data warehousing, e-commerce, enterprise-level functions, and logging applications.

## 1. Install MariaDB

To install MariaDB, run the following command:

```bash
sudo apt install mariadb-server
```

## 2. Secure MariaDB Installation

By default, MariaDB is not fully secure. To enhance security, we will use the `mysql_secure_installation` script provided by the MariaDB server package. This script helps restrict access to the server and removes unused accounts.

Run the following command to start the script:

```bash
sudo mysql_secure_installation
```

It will ask if we want to switch to Unix socket authentication. Since we already have a protected root account we will type N.

Switch to unix_socket autentication? → N 
Change the root password? → N
Remove anonymous users? → Y 
Disallow root login remotely? → Y 
Remove test database and access to it? → Y 
Reload privilege tables now? → Y

Switch to unix_socket authentication? We choose N because we don't want it to switch to Unix socket authentication because we already have a protected root account.

Change the root password? We choose N. We do not want to change the root password. By default we have no password but in mariadb he is not really root as we must give him administrator permissions.

Remove anonymous users? We choose Y. By default when you install mariadb it has an anonymous user, which allows anyone to log into mariadb without having to create their own user account. This is designed for testing purposes and to make the installation smoother. When we leave the development environment and want to move to a production environment we must remove the anonymous users.

Disallow root login remotely? Choose Y. Disabling root login remotely will prevent anyone from guessing the root password. We will only be able to connect to root from localhost.

Remove test database and access to it? Choose Y. This will remove the test database and any users who have access to it.

Reaload privilege tables now? Choose Y. This will reload the MySQL permission tables so that the changes to the security settings will take effect immediately.

## 3. Create Database and User for WordPress

After installing MariaDB, we need to create a database and a user for WordPress.

1. First, access the MariaDB prompt by running the following command:

    ```bash
    mariadb
    ```

2. Once you're in the MariaDB shell, create a new database for WordPress with the following command:

    ```sql
    CREATE DATABASE wordpress_db;
    ```

3. Next, create a user and grant it permissions to the database. Replace `wp_user` and `wp_password` with your desired username and password:

    ```sql
    CREATE USER 'wp_user'@'localhost' IDENTIFIED BY 'wp_password';
    ```

4. Grant the user all privileges on the WordPress database:

    ```sql
    GRANT ALL PRIVILEGES ON wordpress_db.* TO 'wp_user'@'localhost';
    ```

5. Finally, flush privileges to apply the changes:

    ```sql
    FLUSH PRIVILEGES;
    ```

6. Exit the MariaDB shell:

    ```sql
    EXIT;
    ```

Now your database and user are ready to be used with WordPress.

### 🐘 PHP

## 4. Install PHP for WordPress

PHP is a programming language used to develop dynamic web applications. It is required for running WordPress, which is written in PHP, and to connect to the MariaDB database.

To install the necessary PHP packages for running web applications like WordPress, run the following command:

```bash
sudo apt install php-cgi php-mysql
```

### 📰 WordPress Configuration

## 5. WordPress Configuration

Once you have installed WordPress, you need to configure it to connect to your MariaDB database. 

1. Access the `/var/www/html` directory:
```bash
cd /var/www/html
```

2. Copy the file wp-config-sample.php and rename it wp-config.php:
```bash
cp wp-config-sample.php wp-config.php
```
3. Once we have renamed it we will edit the file wp-config.php:
```bash
vim wp-config.php
```

3. modify the following values:

define('DB_NAME', 'wordpress_db');
define('DB_USER', 'wordpress_user');
define('DB_PASSWORD', 'your_password');

4. To improve the performance and speed of web applications on the server, enable the `fastcgi` module in Lighttpd:
```bash
sudo lighty-enable-mod fastcgi
```

5. We enabled the fastcgi-php module in Lighttpd to improve the performance and speed of PHP-based web applications on the server:
```bash
sudo lighty-enable-mod fastcgi-php
```

6. We update and apply the changes in the configuration with the command:
```bash
sudo service lighttpd force-reload
```

7. Once we have completed the previous steps we can go back to our browser and type IP adresse
---

Enjoy setting up your virtual machine and services! 🎉
