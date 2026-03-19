# TRON Private Node Infrastructure Setup

This repository contains the automated deployment script to spin up a fully functioning TRON private blockchain network. It exposes the standard TRON RPC API to facilitate smart contract deployments and blockchain querying.

## Infrastructure Architecture

* **Cloud Provider:** AWS EC2 (Free-Tier)
* **OS:** Ubuntu 22.04 LTS
* **Node Implementation:** Official `trontools/quickstart` Docker image
* **Port Configuration:** Port `9090` exposed for public RPC access

### Handling Hardware Constraints
Java-based TRON nodes require significant memory overhead. Deploying on a 1GB RAM free-tier cloud instance normally results in an `OutOfMemory` crash. To ensure maximum stability without increasing infrastructure costs, the `setup.sh` script automatically provisions a **4GB swap file** prior to spinning up the Dockerized network.

### API Endpoint Verification
The node exposes the combined TRON HTTP API (FullNode and SolidityNode) on port 9090.

Public RPC URL: http://3.144.20.119:9090

You can verify the node is actively producing blocks by querying the latest block data:

Bash
curl -X POST [http://3.144.20.119:9090/wallet/getnowblock](http://3.144.20.119:9090/wallet/getnowblock)

<img width="1470" height="587" alt="2026-03-19_19-18-43" src="https://github.com/user-attachments/assets/e898ccdb-5436-4332-b903-83973779fc51" />

<img width="1468" height="299" alt="2026-03-19_19-21-24" src="https://github.com/user-attachments/assets/c6917800-341b-4002-8fa3-b7ac97207ed7" />
