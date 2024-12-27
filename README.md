# 🛠️ Virtual Machine Setup and Configuration Guide

## Table of Contents

1. [Installing the Virtual Machine](#installing-the-virtual-machine)
   - [💿 Virtual Machine ISO](#virtual-machine-iso)
   - [🖥️ VirtualBox](#virtualbox)
   - [💿 Attaching ISO to VirtualBox](#attaching-iso-to-virtualbox)
2. [🌀 Installing Debian](#installing-debian)
   - [🌍 Configure Locals](#configure-locals)
   - [📶 Configure the Network](#configure-the-network)
   - [🔐 Set Up Users and Passwords](#set-up-users-and-passwords)
   - [🕚 Configure the Clock](#configure-the-clock)
   - [💾 Partition Disks](#partition-disks)
     - **non-BONUS:** Basic Partitioning
     - **BONUS:** Advanced Partitioning
   - [📦 Configure the Package Manager](#configure-the-package-manager)
   - [🖥️ Install the GRUB Boot Loader](#install-the-grub-boot-loader)
   - [🎉 Finish Installation](#finish-installation)
3. [⚙️ Virtual Machine Setup](#virtual-machine-setup)
   - [⚙️ First Connection](#first-connection)
   - [👤 Installing Sudo & Configuring User and Groups](#installing-sudo--configuring-user-and-groups)
   - [📶 Installing & Configuring SSH](#installing--configuring-ssh)
   - [🔥 Installing & Configuring UFW 🔥🧱 Firewall](#installing--configuring-ufw-firewall)
   - [🔐 Sudo Policies](#sudo-policies)
   - [🔑 Password Policy](#password-policy)
4. [🧾 Scripts and Scheduling](#scripts-and-scheduling)
   - [🚨 Script](#script)
   - [⏰ Crontab](#crontab)
5. [✒️ Signature File](#signature-file)
   - [📄 signature.txt](#signaturetxt)
6. [😊 BONUS Services](#bonus-services)
   - [💡 Lighttpd](#lighttpd)
   - [📰 WordPress](#wordpress)
   - [🐬 MariaDB](#mariadb)
   - [🐘 PHP](#php)
   - [📰 WordPress Configuration](#wordpress-configuration)

---

## Installing the Virtual Machine

### 💿 Virtual Machine ISO
Instructions for downloading the Debian ISO image.

### 🖥️ VirtualBox
Steps to install VirtualBox on your system.

### 💿 Attaching ISO to VirtualBox
How to attach the Debian ISO to your VirtualBox instance.

---

## 🌀 Installing Debian

### 🌍 Configure Locals
Set up your locale settings during installation.

### 📶 Configure the Network
Guide to configure network settings.

### 🔐 Set Up Users and Passwords
Instructions for creating users and setting passwords.

### 🕚 Configure the Clock
How to correctly configure the system clock.

### 💾 Partition Disks
- **non-BONUS**: Standard partitioning for simplicity.
- **BONUS**: Advanced partitioning options.

### 📦 Configure the Package Manager
Set up your package manager for future software installations.

### 🖥️ Install the GRUB Boot Loader
Steps to install the GRUB boot loader.

### 🎉 Finish Installation
Complete the Debian installation process.

---

## ⚙️ Virtual Machine Setup

### ⚙️ First Connection
Instructions for your first login to the virtual machine.

### 👤 Installing Sudo & Configuring User and Groups
Set up `sudo` and configure user permissions.

### 📶 Installing & Configuring SSH
How to install and configure SSH for remote access.

### 🔥 Installing & Configuring UFW 🔥🧱 Firewall
Set up the UFW firewall for better security.

### 🔐 Sudo Policies
Customize `sudo` policies for better control.

### 🔑 Password Policy
Set up a secure password policy.

---

## 🧾 Scripts and Scheduling

### 🚨 Script
Details about automation scripts.

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
