# ansible-ubuntu-common
Ansible role to configure basic parameters on linux (Ubuntu) server

## Installation

Create requirements.yml file

```
# Include monitoring-server role
- src: https://github.com/FastMT/ansible-monitoring-server.git
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
      # Email for letsencrypt certificates
      letsencrypt_email: "user@server.com"

      # Optional mail server parameters
      monitoring_mail_server:       "smtp.server.com"
      monitoring_mail_user:         "user@server.com"
      monitoring_mail_password:     "pa$$word"

      # Optional Telegram bot parameters for alerts
      monitoring_telegram_token:    "***:***"
      monitoring_telegram_chat_id:  "123456"

      # Optional Slack bot parameters for alerts
      prometheus_slack_url: 'https://hooks.slack.com/services/**********'
      prometheus_slack_channel: '#prometheus-alerts'

      # Optional Prometheus retention parameters
      monitoring_prometheus_retention_size: "120GB"
      monitoring_prometheus_retention_time: "365d"

      # Optional parameter for Prometheus scrape interval
      monitoring_prometheus_refresh_interval: "10s"

```   
