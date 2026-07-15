# IntelliJ Tomcat Run Configuration Guide

## 1. Run Configuration

Go to:

```text
Run → Edit Configurations
```

Create a new configuration:

```text
+ → Tomcat Server → Local
```

This tells IntelliJ to start a local Tomcat server.

---

## 2. Application Server

Select your installed Tomcat folder.

Example:

```text
C:\apache-tomcat-9.0.119
```

You usually configure this once and reuse it for all projects.

---

## 3. Deployment

Click:

```text
+ → Artifact
```

Select:

```text
Login:war exploded
```

For another project, it will be:

```text
StudentApp:war exploded
```

or

```text
Library:war exploded
```

The pattern is always:

```text
<ProjectName>:war exploded
```

This is the artifact that Tomcat deploys.

---

## 4. Application Context

The **Application Context** determines the URL path of your application.

### Examples

| Project | Context | URL |
|---------|---------|-----|
| Login | `/Login` | `http://localhost:8080/Login/` |
| StudentApp | `/StudentApp` | `http://localhost:8080/StudentApp/` |
| Library | `/Library` | `http://localhost:8080/Library/` |

You can customize the context if desired.

For example:

```text
Application Context:
/app
```

Then your application will be available at:

```text
http://localhost:8080/app/
```

---

# Summary (Use for Every Project)

```text
Run
└── Edit Configurations
    └── + Tomcat Server → Local
        ├── Application Server
        │     └── C:\apache-tomcat-9.x
        │
        ├── Deployment
        │     └── <ProjectName>:war exploded
        │
        └── Application Context
              └── /<ProjectName>
```

---

# What Happens When You Click **Run**

IntelliJ will:

1. Build the project.
2. Deploy the `war exploded` artifact to Tomcat.
3. Start the Tomcat server.
4. Launch your application at:

```text
http://localhost:8080/<ProjectName>/
```

For example:

```text
http://localhost:8080/Login/
```