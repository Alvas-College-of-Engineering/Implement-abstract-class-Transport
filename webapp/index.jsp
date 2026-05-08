<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="transport.*, java.util.*" %>
<%
    // Initialize FleetManager in session if not already present
    FleetManager fm = (FleetManager) session.getAttribute("fleetManager");
    if (fm == null) {
        fm = new FleetManager();
        session.setAttribute("fleetManager", fm);
    }

    // Check for success message
    String successMsg = (String) request.getAttribute("successMsg");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Transport Management System - Demonstrates Abstraction and Runtime Polymorphism using JSP">
    <title>Transport Management System | Viraj Jain</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        /* ===== CSS Reset & Base ===== */
        *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

        :root {
            --bg-primary: #0f0f1a;
            --bg-secondary: #1a1a2e;
            --bg-card: #16213e;
            --bg-card-hover: #1a2745;
            --accent-blue: #4fc3f7;
            --accent-purple: #ab47bc;
            --accent-green: #66bb6a;
            --accent-orange: #ffa726;
            --accent-pink: #ec407a;
            --text-primary: #e8eaf6;
            --text-secondary: #9fa8da;
            --text-muted: #5c6bc0;
            --border-color: rgba(79, 195, 247, 0.15);
            --shadow-glow: 0 0 40px rgba(79, 195, 247, 0.08);
            --gradient-main: linear-gradient(135deg, #4fc3f7 0%, #ab47bc 100%);
            --gradient-bus: linear-gradient(135deg, #4fc3f7 0%, #29b6f6 100%);
            --gradient-truck: linear-gradient(135deg, #ffa726 0%, #ff7043 100%);
        }

        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
            background: var(--bg-primary);
            color: var(--text-primary);
            min-height: 100vh;
            line-height: 1.6;
        }

        /* ===== Animated Background ===== */
        body::before {
            content: '';
            position: fixed;
            top: 0; left: 0;
            width: 100%; height: 100%;
            background:
                radial-gradient(ellipse at 20% 50%, rgba(79, 195, 247, 0.06) 0%, transparent 50%),
                radial-gradient(ellipse at 80% 20%, rgba(171, 71, 188, 0.06) 0%, transparent 50%),
                radial-gradient(ellipse at 60% 80%, rgba(102, 187, 106, 0.04) 0%, transparent 50%);
            z-index: 0;
            pointer-events: none;
        }

        /* ===== Header ===== */
        .header {
            position: relative;
            z-index: 1;
            padding: 2rem 0;
            text-align: center;
            border-bottom: 1px solid var(--border-color);
            background: rgba(22, 33, 62, 0.6);
            backdrop-filter: blur(20px);
        }

        .header-inner {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 2rem;
        }

        .header h1 {
            font-size: 2.2rem;
            font-weight: 800;
            background: var(--gradient-main);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            letter-spacing: -0.5px;
            margin-bottom: 0.5rem;
        }

        .header h1 .emoji { 
            -webkit-text-fill-color: initial; 
            margin-right: 0.5rem;
        }

        .header .subtitle {
            color: var(--text-secondary);
            font-size: 0.95rem;
            font-weight: 400;
        }

        .header .student-info {
            margin-top: 0.75rem;
            display: flex;
            justify-content: center;
            gap: 2rem;
            font-size: 0.85rem;
        }

        .header .student-info span {
            color: var(--text-muted);
        }

        .header .student-info strong {
            color: var(--accent-blue);
            font-weight: 600;
        }

        /* ===== Navigation ===== */
        .nav {
            position: relative;
            z-index: 1;
            background: rgba(26, 26, 46, 0.8);
            backdrop-filter: blur(12px);
            border-bottom: 1px solid var(--border-color);
            padding: 0.75rem 0;
        }

        .nav-inner {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 2rem;
            display: flex;
            gap: 0.5rem;
        }

        .nav a {
            color: var(--text-secondary);
            text-decoration: none;
            padding: 0.6rem 1.2rem;
            border-radius: 8px;
            font-size: 0.9rem;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .nav a:hover {
            color: var(--text-primary);
            background: rgba(79, 195, 247, 0.1);
        }

        .nav a.active {
            color: var(--accent-blue);
            background: rgba(79, 195, 247, 0.12);
        }

        /* ===== Main Content ===== */
        .main {
            position: relative;
            z-index: 1;
            max-width: 1200px;
            margin: 0 auto;
            padding: 2rem;
        }

        /* ===== Stats Cards ===== */
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 1.25rem;
            margin-bottom: 2rem;
        }

        .stat-card {
            background: var(--bg-card);
            border: 1px solid var(--border-color);
            border-radius: 16px;
            padding: 1.5rem;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .stat-card::before {
            content: '';
            position: absolute;
            top: 0; left: 0; right: 0;
            height: 3px;
            border-radius: 16px 16px 0 0;
        }

        .stat-card:nth-child(1)::before { background: var(--gradient-main); }
        .stat-card:nth-child(2)::before { background: var(--gradient-bus); }
        .stat-card:nth-child(3)::before { background: var(--gradient-truck); }

        .stat-card:hover {
            transform: translateY(-3px);
            background: var(--bg-card-hover);
            box-shadow: var(--shadow-glow);
        }

        .stat-card .stat-label {
            font-size: 0.8rem;
            color: var(--text-muted);
            text-transform: uppercase;
            letter-spacing: 1px;
            font-weight: 600;
            margin-bottom: 0.5rem;
        }

        .stat-card .stat-value {
            font-size: 2.5rem;
            font-weight: 800;
            background: var(--gradient-main);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .stat-card:nth-child(2) .stat-value {
            background: var(--gradient-bus);
            -webkit-background-clip: text;
            background-clip: text;
        }

        .stat-card:nth-child(3) .stat-value {
            background: var(--gradient-truck);
            -webkit-background-clip: text;
            background-clip: text;
        }

        /* ===== Section Titles ===== */
        .section-title {
            font-size: 1.3rem;
            font-weight: 700;
            margin-bottom: 1rem;
            color: var(--text-primary);
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .section-title .dot {
            width: 8px;
            height: 8px;
            border-radius: 50%;
            background: var(--accent-blue);
            animation: pulse 2s infinite;
        }

        @keyframes pulse {
            0%, 100% { opacity: 1; transform: scale(1); }
            50% { opacity: 0.5; transform: scale(0.8); }
        }

        /* ===== Fleet Table ===== */
        .table-container {
            background: var(--bg-card);
            border: 1px solid var(--border-color);
            border-radius: 16px;
            overflow: hidden;
            box-shadow: var(--shadow-glow);
        }

        .table-header {
            padding: 1.25rem 1.5rem;
            border-bottom: 1px solid var(--border-color);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .table-header h2 {
            font-size: 1.1rem;
            font-weight: 700;
        }

        .table-header .polymorphism-badge {
            font-size: 0.75rem;
            padding: 0.35rem 0.75rem;
            border-radius: 20px;
            background: rgba(171, 71, 188, 0.15);
            color: var(--accent-purple);
            font-weight: 600;
            border: 1px solid rgba(171, 71, 188, 0.3);
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        table thead th {
            padding: 1rem 1.5rem;
            text-align: left;
            font-size: 0.78rem;
            text-transform: uppercase;
            letter-spacing: 1px;
            color: var(--text-muted);
            font-weight: 600;
            border-bottom: 1px solid var(--border-color);
            background: rgba(15, 15, 26, 0.4);
        }

        table tbody tr {
            transition: background 0.2s ease;
        }

        table tbody tr:hover {
            background: rgba(79, 195, 247, 0.04);
        }

        table tbody td {
            padding: 1rem 1.5rem;
            font-size: 0.9rem;
            color: var(--text-secondary);
            border-bottom: 1px solid rgba(79, 195, 247, 0.06);
        }

        table tbody tr:last-child td {
            border-bottom: none;
        }

        /* ===== Badges ===== */
        .badge {
            display: inline-block;
            padding: 0.3rem 0.75rem;
            border-radius: 20px;
            font-size: 0.78rem;
            font-weight: 600;
            letter-spacing: 0.5px;
        }

        .badge-bus {
            background: rgba(79, 195, 247, 0.15);
            color: var(--accent-blue);
            border: 1px solid rgba(79, 195, 247, 0.3);
        }

        .badge-truck {
            background: rgba(255, 167, 38, 0.15);
            color: var(--accent-orange);
            border: 1px solid rgba(255, 167, 38, 0.3);
        }

        /* ===== OOP Concepts Section ===== */
        .concepts-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 1.25rem;
            margin-top: 2rem;
        }

        .concept-card {
            background: var(--bg-card);
            border: 1px solid var(--border-color);
            border-radius: 16px;
            padding: 1.5rem;
            transition: all 0.3s ease;
        }

        .concept-card:hover {
            transform: translateY(-2px);
            box-shadow: var(--shadow-glow);
        }

        .concept-card h3 {
            font-size: 1rem;
            font-weight: 700;
            margin-bottom: 0.75rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .concept-card p {
            font-size: 0.88rem;
            color: var(--text-secondary);
            line-height: 1.7;
        }

        .concept-card code {
            background: rgba(79, 195, 247, 0.1);
            color: var(--accent-blue);
            padding: 0.15rem 0.4rem;
            border-radius: 4px;
            font-size: 0.82rem;
            font-family: 'Courier New', monospace;
        }

        /* ===== Success Alert ===== */
        .alert-success {
            background: rgba(102, 187, 106, 0.12);
            border: 1px solid rgba(102, 187, 106, 0.3);
            color: var(--accent-green);
            padding: 1rem 1.5rem;
            border-radius: 12px;
            margin-bottom: 1.5rem;
            font-size: 0.9rem;
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            animation: slideDown 0.4s ease;
        }

        @keyframes slideDown {
            from { opacity: 0; transform: translateY(-10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* ===== Footer ===== */
        .footer {
            position: relative;
            z-index: 1;
            text-align: center;
            padding: 2rem;
            color: var(--text-muted);
            font-size: 0.8rem;
            border-top: 1px solid var(--border-color);
            margin-top: 3rem;
        }

        /* ===== Responsive ===== */
        @media (max-width: 768px) {
            .header h1 { font-size: 1.6rem; }
            .header .student-info { flex-direction: column; gap: 0.5rem; }
            .stats-grid { grid-template-columns: 1fr; }
            .nav-inner { flex-wrap: wrap; }
            table { font-size: 0.85rem; }
            table thead th, table tbody td { padding: 0.75rem 1rem; }
            .concepts-grid { grid-template-columns: 1fr; }
        }
    </style>
</head>
<body>

    <!-- ===== Header ===== -->
    <header class="header">
        <div class="header-inner">
            <h1><span class="emoji">🚍</span> Transport Management System</h1>
            <p class="subtitle">Demonstrating Abstraction &amp; Runtime Polymorphism using JSP</p>
            <div class="student-info">
                <div><span>Student:</span> <strong>Viraj Jain</strong></div>
                <div><span>USN:</span> <strong>4AL23CS184</strong></div>
            </div>
        </div>
    </header>

    <!-- ===== Navigation ===== -->
    <nav class="nav">
        <div class="nav-inner">
            <a href="index.jsp" class="active" id="nav-dashboard">📊 Dashboard</a>
            <a href="addBus.jsp" id="nav-add-bus">🚌 Add Bus</a>
            <a href="addTruck.jsp" id="nav-add-truck">🚛 Add Truck</a>
        </div>
    </nav>

    <!-- ===== Main Content ===== -->
    <main class="main">

        <% if (successMsg != null) { %>
            <div class="alert-success" id="alert-success">
                ✅ <%= successMsg %>
            </div>
        <% } %>

        <!-- Stats -->
        <div class="stats-grid">
            <div class="stat-card" id="stat-total">
                <div class="stat-label">Total Fleet</div>
                <div class="stat-value"><%= fm.getTotalCount() %></div>
            </div>
            <div class="stat-card" id="stat-buses">
                <div class="stat-label">Buses</div>
                <div class="stat-value"><%= fm.getBusCount() %></div>
            </div>
            <div class="stat-card" id="stat-trucks">
                <div class="stat-label">Trucks</div>
                <div class="stat-value"><%= fm.getTruckCount() %></div>
            </div>
        </div>

        <!-- Fleet Table — Runtime Polymorphism Demo -->
        <div class="table-container" id="fleet-table">
            <div class="table-header">
                <h2>🚐 Fleet Details</h2>
                <span class="polymorphism-badge">⚡ Runtime Polymorphism</span>
            </div>
            <table>
                <thead>
                    <tr>
                        <th>Vehicle Number</th>
                        <th>Type</th>
                        <th>Capacity</th>
                        <th>Detail 1</th>
                        <th>Detail 2</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        // *** RUNTIME POLYMORPHISM ***
                        // The List<Transport> holds both Bus and Truck objects.
                        // Calling getDetailsHTML() resolves to the correct subclass method at runtime.
                        List<Transport> fleet = fm.getFleet();
                        for (Transport t : fleet) {
                            out.println(t.getDetailsHTML()); // Dynamic dispatch!
                        }
                    %>
                </tbody>
            </table>
        </div>

        <!-- OOP Concepts Explained -->
        <div class="concepts-grid">
            <div class="concept-card" id="concept-abstraction">
                <h3>🔒 Abstraction</h3>
                <p>
                    <code>Transport</code> is an <strong>abstract class</strong> that defines
                    the contract via <code>displayDetails()</code> and <code>getDetailsHTML()</code>.
                    It cannot be instantiated directly — only its concrete subclasses
                    <code>Bus</code> and <code>Truck</code> can be created.
                </p>
            </div>
            <div class="concept-card" id="concept-inheritance">
                <h3>🧬 Inheritance</h3>
                <p>
                    <code>Bus</code> and <code>Truck</code> <strong>extend</strong>
                    <code>Transport</code>, inheriting <code>vehicleNumber</code> and
                    <code>capacity</code>. Each adds its own attributes
                    (e.g., <code>route</code> for Bus, <code>cargoType</code> for Truck).
                </p>
            </div>
            <div class="concept-card" id="concept-polymorphism">
                <h3>⚡ Runtime Polymorphism</h3>
                <p>
                    The fleet table above uses a <code>List&lt;Transport&gt;</code> that holds
                    both <code>Bus</code> and <code>Truck</code> objects. When
                    <code>getDetailsHTML()</code> is called, the <strong>JVM resolves
                    the correct method at runtime</strong> based on the actual object type.
                </p>
            </div>
        </div>

    </main>

    <!-- ===== Footer ===== -->
    <footer class="footer">
        <p>Transport Management System &mdash; JSP Implementation &mdash; Viraj Jain (4AL23CS184)</p>
        <p style="margin-top: 0.3rem;">Demonstrates Abstract Class, Inheritance &amp; Runtime Polymorphism</p>
    </footer>

</body>
</html>
