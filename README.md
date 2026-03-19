# TRON Private Node Infrastructure Setup

This repository contains the automated deployment script to spin up a fully functioning TRON private blockchain network. It exposes the standard TRON RPC API to facilitate smart contract deployments and blockchain querying.

## Infrastructure Architecture

* **Cloud Provider:** AWS EC2 (Free-Tier)
* **OS:** Ubuntu 22.04 LTS
* **Node Implementation:** Official `trontools/quickstart` Docker image
* **Port Configuration:** Port `9090` exposed for public RPC access

### Handling Hardware Constraints
Java-based TRON nodes require significant memory overhead. Deploying on a 1GB RAM free-tier cloud instance normally results in an `OutOfMemory` crash. To ensure maximum stability without increasing infrastructure costs, the `setup.sh` script automatically provisions a **4GB swap file** prior to spinning up the Dockerized network.

