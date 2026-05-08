# Implement-abstract-class-Transport
Implement abstract class Transport
# 🚍 Transport Management System (JSP)

A **JSP-based web application** that demonstrates **Abstraction** and **Runtime Polymorphism** using an abstract class `Transport` and its derived classes `Bus` and `Truck`.

---

**Student:** Viraj Jain  
**USN:** 4AL23CS184

---

## 📌 Objective

To develop a Transport Management System as a web application using JSP that:

- Creates an **abstract class** `Transport` with common attributes (`vehicleNumber`, `capacity`) and abstract methods `displayDetails()` / `getDetailsHTML()`.
- Implements the abstract methods in **derived classes** `Bus` and `Truck`.
- Demonstrates **abstraction** (abstract class cannot be instantiated) and **runtime polymorphism** (method resolution at runtime based on actual object type).
- Provides a **web-based UI** to view the fleet and add new vehicles dynamically.

---

## 📂 Project Structure

```
Implement-abstract-class-Transport/
├── Transport.java                          # Original abstract class (console)
├── Bus.java                                # Original Bus class (console)
├── Truck.java                              # Original Truck class (console)
├── TransportManagementSystem.java          # Original main driver (console)
├── README.md                               # Project documentation
│
└── webapp/                                 # JSP Web Application
    ├── index.jsp                           # Dashboard — fleet table & stats
    ├── addBus.jsp                          # Form to add a new Bus
    ├── addTruck.jsp                        # Form to add a new Truck
    ├── processBus.jsp                      # Processes Bus form submission
    ├── processTruck.jsp                    # Processes Truck form submission
    │
    └── WEB-INF/
        ├── web.xml                         # Deployment descriptor
        └── classes/
            └── transport/
                ├── Transport.java          # Abstract base class (JSP-adapted)
                ├── Bus.java                # Derived Bus class
                ├── Truck.java              # Derived Truck class
                └── FleetManager.java       # Fleet manager (session-scoped)
```

---

## 🧱 Class Hierarchy

```
            ┌──────────────────────────┐
            │   Transport (abstract)    │
            │──────────────────────────│
            │ - vehicleNumber          │
            │ - capacity               │
            │──────────────────────────│
            │ + getType()              │  ← abstract
            │ + getDetailsHTML()       │  ← abstract (for JSP)
            │ + displayDetails()      │  ← abstract (console)
            └──────────┬───────────────┘
                       │
          ┌────────────┴────────────┐
          │                         │
 ┌────────┴─────────┐   ┌──────────┴────────┐
 │       Bus        │   │      Truck        │
 │──────────────────│   │───────────────────│
 │ - route          │   │ - cargoType       │
 │ - busType        │   │ - maxLoadTons     │
 │──────────────────│   │───────────────────│
 │ + getType()      │   │ + getType()       │
 │ + getDetailsHTML()│  │ + getDetailsHTML() │
 │ + displayDetails()│  │ + displayDetails() │
 └──────────────────┘   └───────────────────┘
```

---

## 🔑 OOP Concepts Demonstrated

### 1. Abstraction
- `Transport` is declared as an **abstract class** and cannot be instantiated directly.
- It defines the abstract methods `displayDetails()`, `getDetailsHTML()`, and `getType()` — every subclass must provide its own implementation.

### 2. Inheritance
- `Bus` and `Truck` **extend** `Transport`, inheriting the common attributes `vehicleNumber` and `capacity`.
- Each subclass adds its own specific attributes (e.g., `route` for Bus, `cargoType` for Truck).

### 3. Runtime Polymorphism (Dynamic Method Dispatch)
- In `index.jsp`, a `List<Transport>` holds references to both `Bus` and `Truck` objects.
- When `getDetailsHTML()` is called on each element, the **JVM resolves the correct method at runtime** based on the actual object type, not the reference type.

```java
// In index.jsp — Runtime Polymorphism
List<Transport> fleet = fm.getFleet();
for (Transport t : fleet) {
    out.println(t.getDetailsHTML());  // Resolved at runtime!
}
```

---

## 🌐 JSP Pages

| Page | Purpose |
|------|---------|
| `index.jsp` | Dashboard — shows fleet stats and a table of all vehicles using runtime polymorphism |
| `addBus.jsp` | Form to add a new Bus to the fleet |
| `addTruck.jsp` | Form to add a new Truck to the fleet |
| `processBus.jsp` | Processes the Bus form, creates a `Bus` object, adds to session |
| `processTruck.jsp` | Processes the Truck form, creates a `Truck` object, adds to session |

---

## ⚙️ Prerequisites

- **Java Development Kit (JDK)** 8 or higher
- **Apache Tomcat 9.x** (tested with 9.0.117)
- **Windows 10/11** with **PowerShell**

---

## 🛠️ Tomcat Installation (Windows)

1. **Download Apache Tomcat 9:**
   - Go to [https://tomcat.apache.org/download-90.cgi](https://tomcat.apache.org/download-90.cgi)
   - Under **Binary Distributions → Core**, download the **64-bit Windows zip** (e.g., `apache-tomcat-9.0.117-windows-x64.zip`).

2. **Extract to `C:\`:**
   - Extract the zip to your C drive so the path becomes:
     ```
     C:\apache-tomcat-9.0.117\
     ```

3. **Verify the installation:**
   ```powershell
   ls C:\apache-tomcat-9.0.117\bin\startup.bat
   ```
   If the file exists, Tomcat is ready.

---

## 🔧 Environment Setup (PowerShell)

Before compiling or running, set the required environment variables in your PowerShell session:

```powershell
# Set JAVA_HOME to your JDK installation path
$env:JAVA_HOME = "C:\Program Files\Java\jdk-21"

# Set CATALINA_HOME to your Tomcat installation
$env:CATALINA_HOME = "C:\apache-tomcat-9.0.117"

# Add the Servlet API JAR to CLASSPATH (required for compiling JSP/Servlet classes)
$env:CLASSPATH = "$env:CATALINA_HOME\lib\servlet-api.jar"
```

> **Note:** Adjust `jdk-21` to match your installed JDK version (e.g., `jdk-17`, `jdk-1.8.0_XXX`).  
> These variables are **session-scoped** — you need to set them each time you open a new PowerShell window.

---

## 🚀 How to Run

### Step 1 — Compile the Java Classes

```powershell
cd webapp\WEB-INF\classes
javac transport\*.java
```

You should see no errors. This compiles `Transport.java`, `Bus.java`, `Truck.java`, and `FleetManager.java`.

### Step 2 — Deploy to Tomcat

Copy the entire `webapp` folder into Tomcat's `webapps` directory and rename it:

```powershell
Copy-Item -Recurse -Force .\webapp\ "$env:CATALINA_HOME\webapps\TransportSystem"
```

### Step 3 — Start Tomcat

```powershell
cd $env:CATALINA_HOME\bin
.\startup.bat
```

You should see a new console window with Tomcat startup logs. Wait for the message:
```
INFO [main] org.apache.catalina.startup.Catalina.start Server startup in [XXXX] milliseconds
```

### Step 4 — Open in Browser

Navigate to:
```
http://localhost:8080/TransportSystem/
```

This opens the **Fleet Dashboard**. From here you can:
- View all vehicles in the fleet
- Click **Add Bus** or **Add Truck** to add new vehicles

### Step 5 — Stop Tomcat

```powershell
cd $env:CATALINA_HOME\bin
.\shutdown.bat
```

---

## 🔄 Quick Run (All-in-One)

Run these commands in sequence from the **project root** to compile, deploy, and start:

```powershell
# 1. Set environment variables
$env:JAVA_HOME = "C:\Program Files\Java\jdk-21"
$env:CATALINA_HOME = "C:\apache-tomcat-9.0.117"
$env:CLASSPATH = "$env:CATALINA_HOME\lib\servlet-api.jar"

# 2. Compile
cd webapp\WEB-INF\classes
javac transport\*.java

# 3. Deploy (go back to project root first)
cd ..\..\..
Copy-Item -Recurse -Force .\webapp\ "$env:CATALINA_HOME\webapps\TransportSystem"

# 4. Start Tomcat
& "$env:CATALINA_HOME\bin\startup.bat"
```

Then open **http://localhost:8080/TransportSystem/** in your browser.

---

### Option 2 — Using an IDE (Eclipse / IntelliJ)

1. Import the project as a **Dynamic Web Project**.
2. Set the `webapp` folder as the web content root.
3. Add Tomcat as the target runtime.
4. Right-click → **Run on Server**.

---

## 📤 Features

- ✅ **Dashboard** — View all vehicles with live stats (total, buses, trucks)
- ✅ **Add Bus** — Form to dynamically add a new bus to the fleet
- ✅ **Add Truck** — Form to dynamically add a new truck to the fleet
- ✅ **Session-based storage** — Fleet data persists across page navigations
- ✅ **Pre-loaded sample data** — 2 buses and 2 trucks loaded by default
- ✅ **Modern dark-themed UI** — Premium design with gradients and animations
- ✅ **Responsive design** — Works on desktop and mobile
- ✅ **Runtime Polymorphism** — Demonstrated in the fleet table rendering

---

## 📝 Summary

| Class | Type | Key Attributes | Role |
|-------|------|----------------|------|
| `Transport` | Abstract | `vehicleNumber`, `capacity` | Defines the contract via abstract methods |
| `Bus` | Concrete | `route`, `busType` | Implements bus-specific details |
| `Truck` | Concrete | `cargoType`, `maxLoadTons` | Implements truck-specific details |
| `FleetManager` | Utility | `List<Transport>` | Manages fleet, demonstrates polymorphism |

---
