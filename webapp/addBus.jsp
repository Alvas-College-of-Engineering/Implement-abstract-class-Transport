<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Add a new Bus to the Transport Management System">
    <title>Add Bus | Transport Management System</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

        :root {
            --bg-primary: #0f0f1a;
            --bg-secondary: #1a1a2e;
            --bg-card: #16213e;
            --bg-card-hover: #1a2745;
            --accent-blue: #4fc3f7;
            --accent-purple: #ab47bc;
            --accent-green: #66bb6a;
            --text-primary: #e8eaf6;
            --text-secondary: #9fa8da;
            --text-muted: #5c6bc0;
            --border-color: rgba(79, 195, 247, 0.15);
            --shadow-glow: 0 0 40px rgba(79, 195, 247, 0.08);
            --gradient-main: linear-gradient(135deg, #4fc3f7 0%, #ab47bc 100%);
            --gradient-bus: linear-gradient(135deg, #4fc3f7 0%, #29b6f6 100%);
        }

        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
            background: var(--bg-primary);
            color: var(--text-primary);
            min-height: 100vh;
            line-height: 1.6;
        }

        body::before {
            content: '';
            position: fixed;
            top: 0; left: 0; width: 100%; height: 100%;
            background:
                radial-gradient(ellipse at 20% 50%, rgba(79, 195, 247, 0.06) 0%, transparent 50%),
                radial-gradient(ellipse at 80% 20%, rgba(171, 71, 188, 0.06) 0%, transparent 50%);
            z-index: 0;
            pointer-events: none;
        }

        .header {
            position: relative; z-index: 1;
            padding: 2rem 0;
            text-align: center;
            border-bottom: 1px solid var(--border-color);
            background: rgba(22, 33, 62, 0.6);
            backdrop-filter: blur(20px);
        }

        .header-inner { max-width: 1200px; margin: 0 auto; padding: 0 2rem; }

        .header h1 {
            font-size: 2.2rem; font-weight: 800;
            background: var(--gradient-main);
            -webkit-background-clip: text; -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .header h1 .emoji { -webkit-text-fill-color: initial; margin-right: 0.5rem; }
        .header .subtitle { color: var(--text-secondary); font-size: 0.95rem; }
        .header .student-info { margin-top: 0.75rem; display: flex; justify-content: center; gap: 2rem; font-size: 0.85rem; }
        .header .student-info span { color: var(--text-muted); }
        .header .student-info strong { color: var(--accent-blue); font-weight: 600; }

        .nav {
            position: relative; z-index: 1;
            background: rgba(26, 26, 46, 0.8);
            backdrop-filter: blur(12px);
            border-bottom: 1px solid var(--border-color);
            padding: 0.75rem 0;
        }

        .nav-inner { max-width: 1200px; margin: 0 auto; padding: 0 2rem; display: flex; gap: 0.5rem; }

        .nav a {
            color: var(--text-secondary); text-decoration: none;
            padding: 0.6rem 1.2rem; border-radius: 8px;
            font-size: 0.9rem; font-weight: 500;
            transition: all 0.3s ease;
        }

        .nav a:hover { color: var(--text-primary); background: rgba(79, 195, 247, 0.1); }
        .nav a.active { color: var(--accent-blue); background: rgba(79, 195, 247, 0.12); }

        .main {
            position: relative; z-index: 1;
            max-width: 650px; margin: 0 auto; padding: 2rem;
        }

        /* ===== Form Card ===== */
        .form-card {
            background: var(--bg-card);
            border: 1px solid var(--border-color);
            border-radius: 20px;
            overflow: hidden;
            box-shadow: var(--shadow-glow);
        }

        .form-card-header {
            padding: 1.5rem 2rem;
            border-bottom: 1px solid var(--border-color);
            background: rgba(15, 15, 26, 0.4);
        }

        .form-card-header h2 {
            font-size: 1.2rem; font-weight: 700;
            display: flex; align-items: center; gap: 0.5rem;
        }

        .form-card-body { padding: 2rem; }

        .form-group { margin-bottom: 1.5rem; }

        .form-group label {
            display: block;
            font-size: 0.82rem;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
            color: var(--text-muted);
            margin-bottom: 0.5rem;
        }

        .form-group input, .form-group select {
            width: 100%;
            padding: 0.85rem 1rem;
            background: rgba(15, 15, 26, 0.6);
            border: 1px solid var(--border-color);
            border-radius: 10px;
            color: var(--text-primary);
            font-family: 'Inter', sans-serif;
            font-size: 0.95rem;
            transition: all 0.3s ease;
            outline: none;
        }

        .form-group input:focus, .form-group select:focus {
            border-color: var(--accent-blue);
            box-shadow: 0 0 0 3px rgba(79, 195, 247, 0.15);
        }

        .form-group input::placeholder { color: var(--text-muted); opacity: 0.6; }

        .form-group select option {
            background: var(--bg-card);
            color: var(--text-primary);
        }

        .btn-submit {
            width: 100%;
            padding: 1rem;
            background: var(--gradient-bus);
            color: #fff;
            border: none;
            border-radius: 12px;
            font-family: 'Inter', sans-serif;
            font-size: 1rem;
            font-weight: 700;
            cursor: pointer;
            transition: all 0.3s ease;
            letter-spacing: 0.5px;
        }

        .btn-submit:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(79, 195, 247, 0.3);
        }

        .btn-submit:active { transform: translateY(0); }

        .footer {
            position: relative; z-index: 1;
            text-align: center; padding: 2rem;
            color: var(--text-muted); font-size: 0.8rem;
            border-top: 1px solid var(--border-color); margin-top: 3rem;
        }

        @media (max-width: 768px) {
            .header h1 { font-size: 1.6rem; }
            .header .student-info { flex-direction: column; gap: 0.5rem; }
            .nav-inner { flex-wrap: wrap; }
            .form-card-body { padding: 1.5rem; }
        }
    </style>
</head>
<body>

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

    <nav class="nav">
        <div class="nav-inner">
            <a href="index.jsp" id="nav-dashboard">📊 Dashboard</a>
            <a href="addBus.jsp" class="active" id="nav-add-bus">🚌 Add Bus</a>
            <a href="addTruck.jsp" id="nav-add-truck">🚛 Add Truck</a>
        </div>
    </nav>

    <main class="main">
        <div class="form-card">
            <div class="form-card-header">
                <h2>🚌 Add New Bus</h2>
            </div>
            <div class="form-card-body">
                <form action="processBus.jsp" method="post" id="add-bus-form">
                    <div class="form-group">
                        <label for="vehicleNumber">Vehicle Number</label>
                        <input type="text" id="vehicleNumber" name="vehicleNumber"
                               placeholder="e.g. KA-01-AB-1234" required>
                    </div>
                    <div class="form-group">
                        <label for="capacity">Seating Capacity</label>
                        <input type="number" id="capacity" name="capacity"
                               placeholder="e.g. 50" min="1" required>
                    </div>
                    <div class="form-group">
                        <label for="route">Route</label>
                        <input type="text" id="route" name="route"
                               placeholder="e.g. Bangalore - Mysore" required>
                    </div>
                    <div class="form-group">
                        <label for="busType">Bus Type</label>
                        <select id="busType" name="busType" required>
                            <option value="" disabled selected>Select bus type</option>
                            <option value="AC">AC</option>
                            <option value="Non-AC">Non-AC</option>
                            <option value="Sleeper">Sleeper</option>
                            <option value="Semi-Sleeper">Semi-Sleeper</option>
                            <option value="Volvo">Volvo</option>
                        </select>
                    </div>
                    <button type="submit" class="btn-submit" id="btn-add-bus">
                        ✦ Add Bus to Fleet
                    </button>
                </form>
            </div>
        </div>
    </main>

    <footer class="footer">
        <p>Transport Management System &mdash; JSP Implementation &mdash; Viraj Jain (4AL23CS184)</p>
    </footer>

</body>
</html>
