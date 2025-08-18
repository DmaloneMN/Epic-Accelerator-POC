# Healthcare-Accelerator-POC
The accelerator is designed to provide a unified platform for ingesting and analyzing healthcare data



# 🚀 Epic 

This repository contains Terraform configuration files to deploy a Proof of Concept (POC) accelerator for healthcare customers using Epic data, DICOM imaging, medtech integration, Azure OpenAI, and Power BI visualization.

---

## 🧠 Architecture Overview

The accelerator is designed to provide a unified platform for ingesting and analyzing healthcare data using modern cloud services.

### 🔧 Components

- **Azure Resource Group**: Central container for all resources.
- **Azure Storage Account**: Stores DICOM imaging data.
- **Azure App Service**: Hosts Python-based integration with Azure OpenAI.
- **Azure Healthcare FHIR Service**: Ingests and manages Epic data using FHIR APIs.
- **Azure Power BI Embedded**: Visualizes insights and analytics for clinical and technical teams.

---

## 🛠️ Prerequisites

Before deploying the accelerator, ensure you have the following:

- Terraform >= 1.1.0
- Azure CLI authenticated to your subscription
- Azure subscription with permissions to deploy resources
- Azure OpenAI resource and API key
- Power BI Embedded capacity (SKU A1 or higher)

---

## ⚙️ Setup Instructions

### 1. Clone the Repository

```bash
git clone https://github.com/<your-org>/epic-accelerator-poc.git
cd epic-accelerator-poc

