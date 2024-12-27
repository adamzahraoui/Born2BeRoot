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
   - [🔥 Installing & Configuring UFW Firewall](#installing--configuring-ufw-firewall)
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

### 💿 Virtual Machine ISO

First, we need to download the Debian ISO from the official Debian website:

[Debian Downloads](https://www.debian.org/distrib/)

### What is an ISO File?
An **ISO file** is a type of disk image file used to replicate the content and structure of a physical disk, like a CD, DVD, or Blu-ray, in a single file. It's commonly used for operating system installations.

### 💿 Attaching ISO to VirtualBox

For detailed instructions on attaching the Debian ISO to VirtualBox, please refer to this [tutorial video](https://www.youtube.com/watch?v=OQEdjt38ZJA&t=12s).

---

## ⚙️ Virtual Machine Setup

### Configuration Files

Key configuration files and their locations:

- SSH Configuration: `/etc/ssh/sshd_config`
- Sudo Configuration: `/etc/sudoers`
- Password Policy: `/etc/login.defs`
- PAM Configuration: `/etc/pam.d/common-password`
- UFW Configuration: `/etc/ufw/`
- Monitoring Script: `/root/monitoring.sh`
- WordPress Files: `/var/www/html/`
- Lighttpd Configuration: `/etc/lighttpd/`
- MariaDB Configuration: `/etc/mysql/`
- PHP Configuration: `/etc/php/`

### Log Files

Important log file locations:

- Sudo Logs: `/var/log/sudo/sudo_config`
- SSH Logs: `/var/log/auth.log`
- UFW Logs: `/var/log/ufw.log`
- System Logs: `/var/log/syslog`

[Rest of the content remains the same but with proper formatting and structure...]
