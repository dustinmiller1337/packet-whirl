# terraform-metal-whirl

[![Build Status](https://cloud.drone.io/api/badges/dustinmiller1337/terraform-metal-whirl/status.svg)](https://cloud.drone.io/dustinmiller1337/terraform-metal-whirl)

## Overview

This git repository contains a Terraform script that spin up a c3.small instance with Equinix Metal. 
At the end of a successful provision we apply a local Ansible Playbook against that instance. 
This playbook configures and secures the server. 
It installs and configures Docker for use by a user account. 
It creates four containers: traefik, whoami, linx, and nginx. 
Traefik provides certificates via LetsEncrypt. 
We create a `docker-compose.yml` file in the user's home directory. 
After successful application of the playbook, we update the domain records with Cloudflare for IPv4 and IPv6.

## Requirements

- Git
- Ansible
- Ansible Galaxy
- Terraform

## Getting started

- Update `terraform.tfvars` with your information
- Update the four required variables in `playbook.yml`
- Install the Ansible Galaxy roles
  - ```ansible-galaxy install -r requirements.yml```
- `terraform init`
- `terraform plan`
- `terraform apply`
