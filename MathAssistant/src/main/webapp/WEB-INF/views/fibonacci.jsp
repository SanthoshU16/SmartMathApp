<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>🌀 Fibonacci Curve — Smart Math App</title>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@400;600;700&family=Inter:wght@400;500&display=swap" rel="stylesheet" />

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
      justify-content: center;
      overflow-x: hidden;
    }

    @keyframes gradientShift {
      0% { background-position: 0% 50%; }
      50% { background-position: 100% 50%; }
      100% { background-position: 0% 50%; }
    }

    
    .wrap {
      text-align: center;
      background: rgba(255, 255, 255, 0.9);
      backdrop-filter: blur(22px);
      border-radius: 25px;
      padding: 40px 60px;
      max-width: 1400px;
      width: 92%;
      box-shadow: 0 28px 70px rgba(37, 99, 235, 0.12),
                  inset 0 0 15px rgba(255, 255, 255, 0.4);
      animation: fadeIn 1s ease;
    }

    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(30px); }
      to { opacity: 1; transform: translateY(0); }
    }

    
    h2 {
      font-size: 2rem;
      color: #1d4ed8;
      text-shadow: 0 0 10px rgba(37, 99, 235, 0.25);
      font-weight: 700;
      margin-bottom: 25px;
    }

    
    .fib-img {
      width: 100%;
      max-width: 1200px;
      border-radius: 18px;
      background: #ffffff;
      padding: 10px;
      box-shadow: 0 12px 45px rgba(37, 99, 235, 0.2);
      max-height: 60vh;
      height: auto;
      transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    .fib-img:hover {
      transform: scale(1.03);
      box-shadow: 0 18px 45px rgba(37, 99, 235, 0.3);
    }

    
    .back-btn {
      display: inline-block;
      margin-top: 30px;
      text-decoration: none;
      background: linear-gradient(90deg, #3b82f6, #2563eb);
      color: white;
      padding: 12px 28px;
      border-radius: 12px;
      font-size: 1rem;
      font-weight: 600;
      box-shadow: 0 8px 25px rgba(37,99,235,0.35);
      transition: all 0.3s ease;
    }

    .back-btn:hover {
      transform: translateY(-2px);
      box-shadow: 0 12px 35px rgba(37,99,235,0.45);
    }

    
    @media (max-width: 640px) {
      .wrap {
        padding: 25px 20px;
      }
      h2 {
        font-size: 1.6rem;
      }
      .fib-img {
        max-width: 95%;
        max-height: 40vh;
      }
    }

@media (min-width: 900px) and (max-width: 1300px) {
  .wrap { max-width: 1000px; padding: 30px; }
  .fib-img { max-width: 900px; max-height: 70vh; }
}

    footer {
      margin-top: 40px;
      text-align: center;
      color: #64748b;
      font-size: 0.9rem;
      font-family: "Inter", sans-serif;
    }

    footer span {
      color: #2563eb;
      font-weight: 600;
    }
  </style>
</head>

<body>
  <div class="wrap">
    <h2>Generated Fibonacci Curve</h2>
    <img src="data:image/png;base64,${curve}" alt="Fibonacci Curve" class="fib-img" />
    <br>
    <a href="/" class="back-btn">⬅ Back to Home</a>
  </div>
</body>
</html>