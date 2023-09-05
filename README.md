# ansible-monitoring-server
Ansible role to configure monitoring system based on Prometheus and Grafana

## Components

- Nginx as HTTPS edge server
- Prometheus
- Alertmanager with telegram notifications
- Grafana
- Loki (optional)

## Installation

Create requirements.yml file

```
# Include monitoring-server role
- src: https://github.com/FastMT/ansible-monitoring-server.git
  name: monitoring-server
  version: "v1.0.7"
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

      # Monitoring host URL name (default inventory_hostname) and bind IP (default 0.0.0.0)
      monitoring_server_host: "monitoring.company.com"
      monitoring_server_ip: "11.22.33.44"

      # Email for letsencrypt certificates
      letsencrypt_email: "user@server.com"

      # Deploy node_exporter and cadvisor containers (default true)
      node_exporter_enabled: true
      cadvisor_enabled: true

      # Optional mail server parameters
      monitoring_mail_server:       "smtp.server.com"
      monitoring_mail_server_port:  "25"
      monitoring_mail_user:         "user@server.com"
      monitoring_mail_password:     "pa$$word"

      # Optional Telegram bot parameters for alerts
      monitoring_telegram_token:    "***:***"
      monitoring_telegram_chat_id:  "123456"

      # Optional Slack bot parameters for alerts
      monitoring_slack_url: 'https://hooks.slack.com/services/**********'
      monitoring_slack_channel: '#prometheus-alerts'

      # Optional Prometheus retention parameters
      monitoring_prometheus_retention_size: "120GB"
      monitoring_prometheus_retention_time: "365d"

      # Optional parameter for Prometheus scrape interval
      monitoring_prometheus_refresh_interval: "10s"

      # Optional Prometheus scrape folders
      scrape_folders:
        - { path: "linux" }
        - { path: "windows", proxy_url="http://192.16.1.100:8080" }
        - { path: "envoy", metrics_path: "/stats/prometheus" }

      # Optional extra Prometheus jobs
      monitoring_extra_jobs:
        - job_name: 'extra_job'
          ...

```
