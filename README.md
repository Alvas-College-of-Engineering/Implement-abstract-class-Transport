# 🚍 Transport Management System

A Java-based console application that demonstrates **Abstraction** and **Runtime Polymorphism** using an abstract class `Transport` and its derived classes `Bus` and `Truck`.

---

**Student:** Viraj Jain  
**USN:** 4AL23CS184

---

## 📌 Objective

To develop a Transport Management System that:

- Creates an **abstract class** `Transport` with common attributes (`vehicleNumber`, `capacity`) and an abstract method `displayDetails()`.
- Implements the abstract method in **derived classes** `Bus` and `Truck`.
- Demonstrates **abstraction** (abstract class cannot be instantiated) and **runtime polymorphism** (method resolution at runtime based on actual object type).

---

## 📂 Project Structure

```
Java assignment/
├── Transport.java                 # Abstract base class
├── Bus.java                       # Derived class for Bus
├── Truck.java                     # Derived class for Truck
├── TransportManagementSystem.java # Main driver class
└── README.md                      # Project documentation
```

---

## 🧱 Class Hierarchy

```
            ┌──────────────────────┐
            │   Transport (abstract)│
            │──────────────────────│
            │ - vehicleNumber      │
            │ - capacity           │
            │──────────────────────│
            │ + displayDetails()   │  ← abstract method
            └──────────┬───────────┘
                       │
          ┌────────────┴────────────┐
          │                         │
 ┌────────┴─────────┐   ┌──────────┴────────┐
 │       Bus        │   │      Truck        │
 │──────────────────│   │───────────────────│
 │ - route          │   │ - cargoType       │
 │ - busType        │   │ - maxLoadTons     │
 │──────────────────│   │───────────────────│
 │ + displayDetails()│  │ + displayDetails() │
 └──────────────────┘   └───────────────────┘
```

---

## 🔑 OOP Concepts Demonstrated

### 1. Abstraction
- `Transport` is declared as an **abstract class** and cannot be instantiated directly.
- It defines the abstract method `displayDetails()`, which acts as a **contract** — every subclass must provide its own implementation.

### 2. Inheritance
- `Bus` and `Truck` **extend** `Transport`, inheriting the common attributes `vehicleNumber` and `capacity`.
- Each subclass adds its own specific attributes (e.g., `route` for Bus, `cargoType` for Truck).

### 3. Runtime Polymorphism (Dynamic Method Dispatch)
- In the `main` method, a `Transport[]` array holds references to both `Bus` and `Truck` objects.
- When `displayDetails()` is called on each element, the **JVM resolves the correct method at runtime** based on the actual object type, not the reference type.

```java
Transport[] fleet = { bus1, truck1, bus2, truck2 };

for (Transport transport : fleet) {
    transport.displayDetails();  // resolved at runtime
}
```

---

## ⚙️ Prerequisites

- **Java Development Kit (JDK)** 8 or higher

Verify installation:
```bash
javac -version
java -version
```

---

## 🚀 How to Run

### Step 1 — Compile all Java files
```bash
javac Transport.java Bus.java Truck.java TransportManagementSystem.java
```

### Step 2 — Run the program
```bash
java TransportManagementSystem
```

---

## 📤 Sample Output

```
********************************************
*    TRANSPORT MANAGEMENT SYSTEM           *
*    Student: Viraj Jain                   *
*    USN: 4AL23CS184                       *
********************************************

--- Fleet Details (via Runtime Polymorphism) ---

========== BUS DETAILS ==========
Vehicle Number : KA-01-AB-1234
Capacity       : 50 passengers
Route          : Bangalore - Mysore
Bus Type       : AC
=================================

========= TRUCK DETAILS =========
Vehicle Number : TN-07-EF-9012
Capacity       : 20 pallets
Cargo Type     : Refrigerated
Max Load       : 15.5 tons
=================================

========== BUS DETAILS ==========
Vehicle Number : MH-12-CD-5678
Capacity       : 40 passengers
Route          : Mumbai - Pune
Bus Type       : Non-AC
=================================

========= TRUCK DETAILS =========
Vehicle Number : DL-03-GH-3456
Capacity       : 30 pallets
Cargo Type     : Flatbed
Max Load       : 25.0 tons
=================================

********************************************
*         END OF SYSTEM REPORT             *
********************************************
```

---

## 📝 Summary

| Class | Type | Key Attributes | Role |
|-------|------|----------------|------|
| `Transport` | Abstract | `vehicleNumber`, `capacity` | Defines the contract via `displayDetails()` |
| `Bus` | Concrete | `route`, `busType` | Implements bus-specific details |
| `Truck` | Concrete | `cargoType`, `maxLoadTons` | Implements truck-specific details |
| `TransportManagementSystem` | Driver | — | Creates objects and demonstrates polymorphism |

---
