# 🧠 SmartMathApp

Mathematical Assistant — Fibonacci Curve Visualizer
Explore it ---"https://smartmathappbackend.onrender.com"

## 📘 Overview

**Project Name:** Mathematical Assistant (Fibonacci Visualizer)
**Version:** 1.0.0
**Tech Stack:** Java 17 · Spring Boot · JSP · Maven · Docker

This application performs advanced mathematical operations and visualizes the Fibonacci sequence and golden spiral in real-time. Users can generate up to 1000 terms, view animated spirals, and explore mathematical patterns through an interactive and responsive web interface.

---

## ✨ Features

* 🌀 Interactive Fibonacci generator
* 🎨 SVG-based visualization (scalable & precise)
* ⚡ RESTful backend for image generation
* 📱 Responsive web interface
* 🐳 Docker-ready for deployment
* 📦 Production-optimized with caching

---

## 🧰 Technology Stack

| Component   | Version     |
| ----------- | ----------- |
| Spring Boot | 3.2.3       |
| Java        | 17 LTS      |
| Build Tool  | Maven 3.9.8 |
| View Engine | JSP         |
| Container   | Docker      |

---

## ⚙️ Prerequisites

* Java 17+
* Maven 3.9+
* Docker (optional for deployment)

---

## 🚀 Setup & Run

### 🖥️ Local (Maven)

```bash
cd MathAssistant
mvn clean package
java -jar target/FibonacciCurveWeb.jar
```

Access: [http://localhost:8080](http://localhost:8080)

### 🐳 Docker

```bash
docker build -t mathematical-assistant .
docker run -p 8080:10000 mathematical-assistant
```

Access: [http://localhost:8080](http://localhost:8080)

### ☁️ Render Deployment

* Create new Render Web Service
* Select “Docker” and connect repo
* Set Dockerfile path → `./Dockerfile`

---

## 📡 API Endpoints

| Endpoint                     | Method | Description                  |
| ---------------------------- | ------ | ---------------------------- |
| `/`                          | GET    | Home Page                    |
| `/fibonacci`                 | GET    | Visualization Page           |
| `/calculator`                | GET    | Calculator Page              |
| `/fibonacci-image?terms=<n>` | GET    | Returns Fibonacci spiral PNG |

Example:

```bash
curl "http://localhost:8080/fibonacci-image?terms=15" > output.png
```

---

## 🗂️ Project Structure

```
src/main/java/com/fibonacci/web/
├── FibonacciWebApplication.java
├── FibonacciController.java
├── FibonacciCurve.java
└── WebConfig.java
src/main/webapp/WEB-INF/views/
├── home.jsp
├── index.jsp
└── fibonacci.jsp
```

---

## 🔧 Configuration

**Default Port:** 8080
**Change Port:**

```bash
java -Dserver.port=9090 -jar target/FibonacciCurveWeb.jar
```

**application.properties:**

```properties
server.port=8080
logging.level.com.fibonacci.web=DEBUG
```

---

## 🧪 Common Commands

```bash
mvn clean package -DskipTests
mvn spring-boot:run
docker build -t math-assistant .
docker run -p 8080:10000 math-assistant
```

---

## 🩺 Troubleshooting

* **Port in use:** change port → `-Dserver.port=8081`
* **Broken image:** test API via curl
* **Docker errors:** check Docker daemon or rebuild
* **JSP 404:** verify `/WEB-INF/views` folder

---

## 📊 Performance

* Build: ~40s
* Startup: ~3s
* Response: <100ms
* Memory: ~350MB

---

## 🔐 Security

* HTTPS-ready
* No auth (Spring Security optional)

---

## 🎓 Educational Value

Demonstrates:

* Spring Boot MVC
* JSP-based rendering
* REST API design
* Docker deployment
* Maven automation
* Cloud CI/CD (Render)

---

**Created:** 2025
**Last Updated:** Nov 2025
**Status:** 🟢 Active Development

---
