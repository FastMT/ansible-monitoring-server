# ansible-ubuntu-common
Ansible role to configure basic parameters on linux (Ubuntu) server

## Installation

Create requirements.yml file

```
# Include ubuntu-common role
- src: git@github.com:FastMT/ansible-monitoring-server.git
  name: monitoring-server
  version: "v1.0.0"
```

Install external module into ~/.ansible/roles folder

```
ansible-galaxy install -r requirements.yml
```

## Usage

playbook.yml:

```
# Configure Ubuntu common parameters
- role: monitoring-server"
    vars:
      # Optional parameter - not ask password on sudo (default: yes)
      sudo_nopasswd: yes

      # Optional parameter - sysctl config
      linux_sysctl:
        - { name: "systctl.config.parameter",     value: 1 }      
```   
