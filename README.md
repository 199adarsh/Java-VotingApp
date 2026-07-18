<div align="center">

# 🗳️ Java VotingApp — Next-Gen E-Voting 

*A cloud-native, secure, high-performance Online Voting & Election Management System built with Java EE, Servlets, JSP, MySQL, and Docker.*

[![Java](https://img.shields.io/badge/Java-17+-ED8B00?style=for-the-badge&logo=openjdk&logoColor=white)](https://www.oracle.com/java/)
[![Jakarta Servlets](https://img.shields.io/badge/Servlet-API_4.0-007396?style=for-the-badge&logo=java&logoColor=white)](https://jakarta.ee/)
[![MySQL](https://img.shields.io/badge/MySQL-Cloud_Aiven-4479A1?style=for-the-badge&logo=mysql&logoColor=white)](https://aiven.io/)
[![Docker](https://img.shields.io/badge/Docker-Ready-2496ED?style=for-the-badge&logo=docker&logoColor=white)](https://www.docker.com/)
[![Deployed on Render](https://img.shields.io/badge/Render-Deployed-46E3B7?style=for-the-badge&logo=render&logoColor=black)](https://render.com)

</div>

---

## ⚡ Overview

**Java VotingApp** is an enterprise-grade digital voting solution designed to facilitate tamper-resistant, real-time elections with minimal latency. Built using standard MVC (Model-View-Controller) architecture, it offers seamless voter authentication, candidate management, and real-time ballot tallying.

```
       ┌───────────────────┐        ┌─────────────────────┐        ┌───────────────────┐
       │   JSP / Frontend  │ ────►  │ Servlets Controller │ ────►  │   DAO / Model     │
       └───────────────────┘        └─────────────────────┘        └───────────────────┘
                 ▲                             │                             │
                 │                             ▼                             ▼
       ┌───────────────────┐        ┌─────────────────────┐        ┌───────────────────┐
       │ HTTP / Web Client │        │  Apache Tomcat 9.x  │ ◄────► │ Aiven MySQL Cloud │
       └───────────────────┘        └─────────────────────┘        └───────────────────┘
```

---

## 🌟 Key Features

| Feature | Description |
|---|---|
| 🔐 **Secure Authentication** | Session-controlled authentication flow for voters and administrators. |
| 🗳️ **One-Voter-One-Vote** | Real-time status validation ensuring registered voters cast exactly one ballot. |
| 📊 **Live Results Dashboard** | Dynamic calculation and display of total vote counts per candidate. |
| 👑 **Admin Console** | Complete candidate lifecycle management (Add, Remove, Monitor). |
| ☁️ **Cloud Native** | Built with Docker containerization and fully configured for Render & Aiven MySQL. |

---

## 🛠️ Technology Stack

* **Language**: Java 17 (Eclipse Temurin)
* **Web Framework**: Java EE / Servlets 4.0 & JSP
* **App Server**: Apache Tomcat 9.0
* **Build System**: Apache Maven
* **Database**: Cloud MySQL 8 (Aiven Cloud Services)
* **Containerization**: Multi-stage Docker Container
* **Deployment**: Render Cloud Web Service

---

## ⚙️ Environment Variables Setup

Configure these environment variables in your `.env` file for local development or directly in your cloud hosting provider dashboard:

```env
DB_URL=jdbc:mysql://<HOST>:<PORT>/<DB_NAME>?sslMode=REQUIRED&serverTimezone=UTC
DB_USER=<YOUR_DB_USER>
DB_PASSWORD=<YOUR_DB_PASSWORD>
```

---

## 🚀 Local Quickstart

### Prerequisites
* JDK 17+
* Apache Maven 3.9+
* Docker Desktop (Optional for local container run)

### Running via Maven & Tomcat

1. **Clone the repository**:
   ```bash
   git clone https://github.com/199adarsh/Java-VotingApp.git
   cd Java-VotingApp
   ```

2. **Set up Environment Variables**:
   Copy `.env.example` to `.env` and fill in your MySQL connection details:
   ```bash
   cp .env.example .env
   ```

3. **Build the WAR package**:
   ```bash
   mvn clean package
   ```

4. **Deploy using Docker**:
   ```bash
   docker build -t java-voting-app .
   docker run -p 8080:8080 --env-file .env java-voting-app
   ```
   Access your app at: `http://localhost:8080/`

---

## 🌐 Deploying to Render & Aiven

This repository includes a `render.yaml` blueprint and multi-stage `Dockerfile` for 1-click cloud deployments:

1. **Database Setup (Aiven)**:
   - Provision a MySQL service on [Aiven](https://aiven.io/).
   - Execute the table schemas (`users`, `candidates`).

2. **Application Deployment (Render)**:
   - Connect your GitHub repo to [Render](https://dashboard.render.com).
   - Select **Web Service** or **Blueprint** (uses `render.yaml`).
   - Add environment variables: `DB_URL`, `DB_USER`, `DB_PASSWORD`.
   - Render automatically builds the Docker image and launches Tomcat!

---

## 📜 License

Distributed under the MIT License. See `LICENSE` for more information.

---

<div align="center">
  <sub>Crafted with ❤️ for modern cloud architectures</sub>
</div>
