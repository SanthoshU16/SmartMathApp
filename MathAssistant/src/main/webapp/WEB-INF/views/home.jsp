<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>🧠 Smart Math App — Professional Edition</title>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@400;600;700&family=Inter:wght@400;500&display=swap" rel="stylesheet">

  <style>
    * {
      box-sizing: border-box;
      transition: all 0.3s ease;
    }

   
    body {
      margin: 0;
      font-family: "Outfit", sans-serif;
      background: linear-gradient(120deg, #e0f2fe, #f8fafc, #dbeafe);
      background-size: 300% 300%;
      animation: gradientShift 14s ease infinite;
      color: #1e293b;
      min-height: 100vh;
      display: flex;
      flex-direction: column;
      align-items: center;
      overflow-x: hidden;
    }

    @keyframes gradientShift {
      0% { background-position: 0% 50%; }
      50% { background-position: 100% 50%; }
      100% { background-position: 0% 50%; }
    }

    
    header {
      width: 100%;
      text-align: center;
      padding: 20px 0;
      background: rgba(255, 255, 255, 0.6);
      backdrop-filter: blur(20px);
      box-shadow: 0 6px 25px rgba(37, 99, 235, 0.15);
      border-bottom: 1px solid rgba(209, 213, 219, 0.4);
      position: fixed;
      top: 0;
      z-index: 10;
    }

    header h1 {
      font-size: 2rem;
      color: #1d4ed8;
      font-weight: 700;
      text-shadow: 0 0 10px rgba(37, 99, 235, 0.2);
      margin: 0;
    }

    
    main {
      text-align: center;
      margin-top: 120px;
      padding: 20px;
    }

    .home-title {
      font-size: 2.3rem;
      font-weight: 700;
      color: #1e3a8a;
      text-shadow: 0 0 10px rgba(37, 99, 235, 0.25);
      margin-bottom: 12px;
    }

    .home-sub {
      font-size: 1.1rem;
      color: #475569;
      margin-bottom: 50px;
      font-family: "Inter", sans-serif;
    }

    
    .features {
      display: flex;
      flex-wrap: wrap;
      justify-content: center;
      gap: 40px;
    }

    .card {
      text-decoration: none;
      color: #1e3a8a;
      width: 340px;
      height: 250px;
      background: rgba(255,255,255,0.85);
      border-radius: 22px;
      padding: 40px;
      box-shadow: 0 15px 35px rgba(37,99,235,0.15),
                  inset 0 0 15px rgba(255,255,255,0.4);
      backdrop-filter: blur(20px);
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      position: relative;
      transition: transform 0.4s ease, box-shadow 0.4s ease;
    }

    .card:hover {
      transform: translateY(-10px) scale(1.03);
      box-shadow: 0 20px 45px rgba(37,99,235,0.25);
    }

    .card::before {
      content: "";
      position: absolute;
      inset: 0;
      border-radius: 22px;
      background: linear-gradient(135deg, rgba(37,99,235,0.15), rgba(16,185,129,0.12));
      opacity: 0;
      transition: opacity 0.4s ease;
    }

    .card:hover::before {
      opacity: 1;
    }

    .icon {
      width: 55px;
      height: 55px;
      border-radius: 50%;
      background: radial-gradient(circle, rgba(37,99,235,0.12), rgba(37,99,235,0));
      box-shadow: 0 0 25px rgba(37,99,235,0.25);
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 1.8rem;
      color: #1d4ed8;
      margin-bottom: 15px;
    }

    .card h3 {
      font-size: 1.6rem;
      font-weight: 600;
      margin-bottom: 10px;
      color: #1e40af;
      text-shadow: 0 0 6px rgba(59,130,246,0.15);
    }

    .card p {
      font-size: 1rem;
      color: #475569;
      font-family: "Inter", sans-serif;
      line-height: 1.5;
      max-width: 230px;
      text-align: center;
    }

    
    @keyframes float {
      0%, 100% { transform: translateY(0); }
      50% { transform: translateY(-8px); }
    }

    .card {
      animation: float 6s ease-in-out infinite;
    }

    
    @media (max-width: 640px) {
      .features {
        gap: 25px;
      }
      .card {
        width: 95%;
        height: auto;
        min-height: 280px;
        padding: 35px;
      }
      .home-title {
        font-size: 1.9rem;
      }
    }

    
    footer {
      margin-top: 80px;
      text-align: center;
      color: #64748b;
      font-size: 0.95rem;
      font-family: "Inter", sans-serif;
      padding-bottom: 20px;
    }

    footer span {
      color: #2563eb;
      font-weight: 600;
    }
  </style>
</head>

<body>
  <header>
    <h1>Smart Math App</h1>
  </header>

  <main>
    <h2 class="home-title">Welcome to Smart Math App</h2>
    <p class="home-sub">Select a mode to get started</p>

    <div class="features">
      <a href="/calculator" class="card">
        <div class="icon">🧮</div>
        <h3>Calculator</h3>
        <p>Perform quick arithmetic and scientific operations instantly.</p>
      </a>

      <a href="/fibonacci" class="card">
        <div class="icon">🌀</div>
        <h3>Fibonacci Curve</h3>
        <p>Generate and visualize elegant Fibonacci spirals and patterns.</p>
      </a>
    </div>
  </main>

  <footer>
    💪🏼 Build by <span>Santhosh</span> 
  </footer>
</body>
</html>