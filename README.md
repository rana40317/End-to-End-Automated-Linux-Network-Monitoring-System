# End-to-End Automated Linux Network Monitoring System

A production-inspired Linux Network Monitoring System built using Bash scripting, Docker, and GitHub Actions. 
The project continuously monitors multiple network endpoints by checking host availability, port accessibility, response time, and packet loss while automating execution using Cron.

## Project Overview

This project was developed to simulate real-world DevOps and Linux administration tasks. It automates network monitoring for multiple hosts and demonstrates Linux scripting, networking fundamentals, containerization, and CI.

The monitoring script performs the following tasks:

- Checks whether a host is reachable
- Verifies whether a TCP port is open
- Measures average network latency
- Calculates packet loss
- Logs monitoring results
- Runs automatically using Cron/Anacron
- Runs inside a Docker container
- Validates every code change using GitHub Actions
  
# Features

- Host Availability Monitoring
- TCP Port Monitoring
- Multiple Website Monitoring
- Response Time Monitoring
- Packet Loss Monitoring
- Log File Generation
- Cron Automation
- Docker Containerization
- GitHub Actions Continuous Integration

# Prerequisites

- Ubuntu Linux
- Git
- Bash
- Docker
- Ping Utility
- Netcat

# Installation

Clone the repository

git clone https://github.com/rana40317/End-to-End-Automated-Linux-Network-Monitoring-System.git

cd End-to-End-Automated-Linux-Network-Monitoring-System

Install dependencies

sudo apt update

sudo apt install -y \
bash \
iputils-ping \
netcat-openbsd \
gawk \
grep


# Running the Project

chmod +x network_monitor.sh

./network_monitor.sh

# Docker

### Build Docker Image


docker build -t linux-network-monitor .


### Run Docker Container

docker run --rm linux-network-monitor


# Cron Automation

Open Cron
crontab -e


Example

*/10 * * * * /home/ubuntu/End-to-End-Automated-Linux-Network-Monitoring-System/network_monitor.sh


# GitHub Actions CI

The pipeline automatically performs:

- Bash Syntax Validation
- ShellCheck Analysis
- Docker Image Build
- Docker Container Execution

Workflow Location

.github/workflows/ci.yml


# Sample Output

Add your terminal screenshot here.

***** Network Check *****

www.google.com:443 is OPEN | Response Time: 18 ms | Packet Loss: 0%

www.github.com:443 is OPEN | Response Time: 24 ms | Packet Loss: 0%

www.youtube.com:443 is OPEN | Response Time: 22 ms | Packet Loss: 0%

www.gmail.com:443 is OPEN | Response Time: 20 ms | Packet Loss: 0%

www.lpu.in is DOWN

# Future Enhancements

- HTML Dashboard
- Email Notifications
- Slack Integration
- Prometheus Metrics
- Grafana Dashboard
- Kubernetes Deployment
- Helm Charts

# Author

Mr. Sayantan Kar.

GitHub: https://github.com/rana40317

LinkedIn: https://www.linkedin.com/in/sayantankar/

# License

This project is licensed under the MIT License.
