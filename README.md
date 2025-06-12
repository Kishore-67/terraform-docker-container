# 🚀 Fullstack Dockerized API Project

A **Fullstack Web Application** demonstrating:

- ✅ **Node.js (Express)** API backend
- ✅ **React (Vite)** frontend
- ✅ **NGINX** reverse proxy to serve the frontend and proxy API requests
- ✅ **Docker & Terraform** for infrastructure provisioning and containerization

---

## 📂 Project Structure

terraform-docker-container/
├── backend/ # Node.js Express API
│ ├── Dockerfile
│ └── index.js
│
├── frontend/ # React frontend (Vite)
│ ├── public/
│ ├── src/
│ │ └── App.jsx
│ └── Dockerfile
│
├── nginx/
│ └── nginx.conf # NGINX reverse proxy configuration
│
├── main.tf # Terraform configuration for Docker containers & network
└── README.md # This file

yaml
Copy
Edit

---

## ⚙️ Features

- 📦 **Dockerized Fullstack Application**
- 🌐 **NGINX** reverse proxy serves:
  - React frontend
  - `/api/` requests to Node.js backend
- 🗂️ Simple **API Endpoint** at `/api/` returning JSON
- 🖥️ React UI to **fetch API response**
- ⚙️ **Terraform** manages all Docker resources
- 🐳 Multi-container Docker network

---

## 📌 Setup Instructions

### 🖥️ Prerequisites

- Docker
- Terraform
- Node.js & npm (for development)

---

### 📦 Clone the Repository

```bash
git clone https://github.com/your-username/fullstack-dockerized-api.git
cd fullstack-docker-container
⚙️ Build the React Frontend
bash
Copy
Edit
cd frontend
npm install
npm run build
This will generate a dist/ folder used by NGINX.

🐳 Build Docker Images (Manual)
bash
Copy
Edit
# From project root
docker build -t custom-node-backend ./backend
docker build -t custom-nginx ./nginx
🌍 Terraform: Provision Docker Resources
bash
Copy
Edit
terraform init
terraform apply
This will:

Create Docker network

Start Node.js backend container

Start NGINX container on http://localhost:8080

✅ Test the API
bash
Copy
Edit
curl http://localhost:8080/api/
🌐 Visit the Web UI
text
Copy
Edit
http://localhost:8080
Click "Fetch API Data" button to get JSON from the backend.
