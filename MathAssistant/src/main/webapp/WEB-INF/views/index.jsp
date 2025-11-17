<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>🧠 Smart Math App — Ultra Edition</title>
<meta name="viewport" content="width=device-width,initial-scale=1" />
<link href="https://fonts.googleapis.com/css2?family=Outfit:wght@400;500;600;700&family=Inter:wght@400;600&display=swap" rel="stylesheet">

<style>
* {
  box-sizing: border-box;
  transition: all 0.25s ease;
}


body {
  margin: 0;
  font-family: 'Outfit', sans-serif;
  background: linear-gradient(120deg, #e0f2fe, #fdfdfd, #dbeafe);
  background-size: 300% 300%;
  animation: gradientShift 15s ease infinite;
  color: #1e293b;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  min-height: 100vh;
  overflow-x: hidden;
}

@keyframes gradientShift {
  0% { background-position: 0% 50%; }
  50% { background-position: 100% 50%; }
  100% { background-position: 0% 50%; }
}


.header {
  width: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  background: rgba(255,255,255,0.75);
  padding: 20px 0;
  box-shadow: 0 6px 25px rgba(37,99,235,0.15);
  border-bottom: 1px solid rgba(209,213,219,0.4);
  backdrop-filter: blur(20px);
  overflow: visible;
  z-index: 1000;
}
.title {
  font-size: 2rem;
  color: #1e40af;
  font-weight: 700;
  text-shadow: 0 0 12px rgba(37,99,235,0.3);
  text-align: center;
  flex-grow: 1;
  letter-spacing: 0.3px;
}
.back-btn {
  position: absolute;
  left: 25px;
  color: #2563eb;
  text-decoration: none;
  font-weight: 600;
  padding: 8px 16px;
  border-radius: 12px;
  background: linear-gradient(90deg,#e0f2fe,#bfdbfe);
  box-shadow: 0 6px 15px rgba(37,99,235,0.25);
}
.back-btn:hover {
  background: linear-gradient(90deg,#dbeafe,#bfdbfe);
  transform: translateY(-2px);
}

.mode-select {
  position: absolute;
  right: 25px;
  top: 50%;
  transform: translateY(-50%);
}
.mode-button {
  background: linear-gradient(90deg, #2563eb, #3b82f6);
  color: white;
  border: none;
  border-radius: 12px;
  padding: 9px 20px;
  cursor: pointer;
  font-weight: 600;
  box-shadow: 0 6px 18px rgba(37,99,235,0.35);
}
.dropdown {
  display: none;
  position: absolute;
  top: 45px;
  right: 0;
  background: rgba(255,255,255,0.98);
  box-shadow: 0 10px 25px rgba(37,99,235,0.15);
  border-radius: 12px;
  padding: 8px 0;
  min-width: 180px;
  text-align: center;
  z-index: 9999;
}
.dropdown a {
  display: block;
  color: #1e293b;
  padding: 10px;
  text-decoration: none;
  font-weight: 500;
  border-bottom: 1px solid rgba(229,231,235,0.5);
}
.dropdown a:hover {
  background: #e0f2fe;
  color: #2563eb;
}
.dropdown.show { display: block; }


.container {
  width: 100%;
  max-width: 1600px;
  flex-grow: 1;
  display: flex;
  align-items: center;
  justify-content: center;
  margin-top: 80px;
  padding-bottom: 60px;
}


.grid {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 20px;
  background: rgba(255,255,255,0.85);
  padding: 56px;
  border-radius: 22px;
  box-shadow: 0 15px 35px rgba(37,99,235,0.15), inset 0 0 15px rgba(255,255,255,0.4);
  backdrop-filter: blur(20px);
  width: 560px;
  justify-items: center;
  border: 1px solid rgba(209,213,219,0.4);
  position: relative;
  transition: transform 0.35s ease, box-shadow 0.35s ease;
}

.grid::before {
  content: "";
  position: absolute;
  inset: 0;
  border-radius: 22px;
  background: linear-gradient(135deg, rgba(37,99,235,0.15), rgba(16,185,129,0.12));
  opacity: 0;
  transition: opacity 0.35s ease;
  pointer-events: none;
}
.grid:hover {
  transform: translateY(-10px) scale(1.02);
  box-shadow: 0 20px 45px rgba(37,99,235,0.25);
}
.grid:hover::before { opacity: 1; }
.display input {
  width: 100%;
  font-size: 2rem;
  text-align: right;
  padding: 15px;
  border-radius: 14px;
  border: none;
  background: rgba(240,249,255,0.8);
  color: #1e3a8a;
  font-family: "JetBrains Mono", monospace;
  box-shadow: inset 0 0 10px rgba(37,99,235,0.15);
}
.btn-card {
  background: linear-gradient(145deg,#f0f9ff,#dbeafe);
  border-radius: 16px;
  box-shadow: 0 6px 18px rgba(37,99,235,0.25);
  font-size: 1.5rem;
  display: flex;
  align-items: center;
  justify-content: center;
  cursor: pointer;
  font-weight: 600;
  color: #1e3a8a;
  user-select: none;
  height: 76px;
  width: 76px;
}
.btn-card:hover {
  transform: translateY(-3px);
  box-shadow: 0 12px 25px rgba(37,99,235,0.3);
  background: linear-gradient(145deg,#eff6ff,#dbeafe);
}


.fib-area {
  width: 100%;
  max-width: 1400px;
  background: rgba(255,255,255,0.85);
  border-radius: 22px;
  padding: 40px 60px;
  box-shadow: 0 15px 35px rgba(37,99,235,0.15), inset 0 0 15px rgba(255,255,255,0.4);
  backdrop-filter: blur(20px);
  border: 1px solid rgba(209,213,219,0.35);
  text-align: center;
  animation: fadeIn 1.2s ease;
  position: relative;
  transition: transform 0.35s ease, box-shadow 0.35s ease;
}

.fib-area::before {
  content: "";
  position: absolute;
  inset: 0;
  border-radius: 22px;
  background: linear-gradient(135deg, rgba(37,99,235,0.15), rgba(16,185,129,0.12));
  opacity: 0;
  transition: opacity 0.35s ease;
  pointer-events: none;
}
.fib-area:hover {
  transform: translateY(-10px) scale(1.02);
  box-shadow: 0 20px 45px rgba(37,99,235,0.25);
}
.fib-area:hover::before { opacity: 1; }

@keyframes fadeIn {
  from { opacity: 0; transform: translateY(20px); }
  to { opacity: 1; transform: translateY(0); }
}

.fib-controls {
  display: flex;
  align-items: center;
  gap: 15px;
  justify-content: center;
  flex-wrap: wrap;
  margin-bottom: 20px;
  position: relative;
  z-index: 10;
}
.fib-controls label {
  font-weight: 600;
  color: #1e40af;
}
.fib-controls input {
  padding: 12px 18px;
  border-radius: 14px;
  border: 1px solid #cbd5e1;
  background: #f8fafc;
  color: #1e3a8a;
  font-weight: 600;
  font-size: 1rem;
  min-width: 90px;
  text-align: center;
  box-shadow: inset 0 0 8px rgba(37,99,235,0.08);
}
.fib-controls input:focus {
  border-color: #2563eb;
  box-shadow: 0 0 8px rgba(37,99,235,0.3);
  outline: none;
}
.fib-controls button {
  background: linear-gradient(90deg, #3b82f6, #2563eb);
  color: #fff;
  border: none;
  border-radius: 12px;
  padding: 10px 24px;
  cursor: pointer;
  box-shadow: 0 8px 22px rgba(37,99,235,0.35);
  font-weight: 600;
}
.fib-controls button:hover {
  transform: translateY(-2px);
  box-shadow: 0 12px 30px rgba(37,99,235,0.45);
}
.fib-canvas {
  margin-top: 25px;
  display: flex;
  justify-content: center;
}
  .fib-img {
  width: 100%;
  max-width: 1200px;
  height: auto;
  max-height: 60vh;
  border-radius: 20px;
  box-shadow: 0 12px 45px rgba(37,99,235,0.22);
  background: #ffffff;
  padding: 10px;
  object-fit: contain;
  transition: transform 0.3s ease;
 }
.fib-img:hover {
  transform: scale(1.02);
  box-shadow: 0 18px 45px rgba(37,99,235,0.3);
}
.fib-placeholder {
  margin-top: 40px;
  font-size: 1.1rem;
  color: #1e3a8a;
  text-shadow: 0 0 8px rgba(59,130,246,0.25);
}

@media (max-width: 600px) {
  .grid {
    gap: 10px;
    width: 320px;
  }
  .btn-card {
    font-size: 1.1rem;
    height: 55px;
    width: 55px;
  }
}

@media (min-width: 900px) and (max-width: 1300px) {
  .container { max-width: 1200px; margin-top: 60px; }
  .fib-area { padding: 30px; }
  .fib-img { max-width: 900px; max-height: 50vh; }
}

@media (max-width: 899px) {
  .fib-area { width: 95%; padding: 20px; }
  .fib-img { max-width: 100%; max-height: 45vh; }
}
</style>

<script>
document.addEventListener('DOMContentLoaded', function(){
  const btn = document.getElementById('modeBtn');
  const dd = document.getElementById('modeDropdown');
  btn.addEventListener('click', ()=> dd.classList.toggle('show'));
  document.addEventListener('click', (e)=>{
    if(!btn.contains(e.target) && !dd.contains(e.target))
      dd.classList.remove('show');
  });

  document.getElementById('modeCalc').addEventListener('click', ()=> showMode('calc'));
  document.getElementById('modeFib').addEventListener('click', ()=> showMode('fib'));

  function showMode(m){
    document.getElementById('calculator').style.display = (m==='calc')? 'grid' : 'none';
    document.getElementById('fibonacci').style.display = (m==='fib')? 'block' : 'none';
    dd.classList.remove('show');
  }

  const params = new URLSearchParams(window.location.search);
  const modeParam = params.get('mode');
  const path = window.location.pathname || '';
  if (path.endsWith('/calculator') || modeParam === 'calc') showMode('calc');
  else showMode('fib');

  
  const img = document.getElementById('fibImg');
  const placeholder = document.getElementById('fibPlaceholder');
  img.style.display = 'none';
  placeholder.style.display = 'block';

  document.getElementById('drawBtn').addEventListener('click', function(e){
    e.preventDefault();
    const termsRaw = document.getElementById('terms').value || '1';
    const terms = parseInt(termsRaw, 10) || 1;
    if (terms > 45) {
      alert("Maximum 45 terms allowed!");
      return;
    }
    img.src = '/fibonacci-image?terms=' + encodeURIComponent(terms) + '&_=' + Date.now();
    img.style.display = 'block';
    placeholder.style.display = 'none';
  });

 
  const display = document.getElementById('calcDisplay');
  document.querySelectorAll('.calc-btn').forEach(b=>{
    b.addEventListener('click', ()=>{
      const v=b.dataset.value;
      if(v==='C') display.value='';
      else if(v==='='){
        try{ display.value = eval(display.value||'0'); }
        catch(e){ display.value='ERR' }
      }
      else if(v==='BACK'){ display.value = display.value.slice(0,-1); }
      else display.value += v;
    })
  });
});
</script>
</head>
<body>

<div class="header">
  <a href="/" class="back-btn">← Back</a>
  <div class="mode-select">
    <button id="modeBtn" class="mode-button">Mode</button>
    <div id="modeDropdown" class="dropdown" role="menu">
      <a href="#" id="modeCalc">Calculator</a>
      <a href="#" id="modeFib">Fibonacci Curve</a>
    </div>
  </div>
</div>

<div class="container">
  
  <div id="calculator" class="grid" style="display:none">
    <div class="display" style="grid-column:1 / -1"><input id="calcDisplay" placeholder="0"></div>
    <div class="btn-card calc-btn" data-value="C">C</div>
    <div class="btn-card calc-btn" data-value="BACK">&#9003;</div>
    <div class="btn-card calc-btn" data-value="/">&divide;</div>
    <div class="btn-card calc-btn" data-value="=">=</div>
    <div class="btn-card calc-btn" data-value="7">7</div>
    <div class="btn-card calc-btn" data-value="8">8</div>
    <div class="btn-card calc-btn" data-value="9">9</div>
    <div class="btn-card calc-btn" data-value="*">&times;</div>
    <div class="btn-card calc-btn" data-value="4">4</div>
    <div class="btn-card calc-btn" data-value="5">5</div>
    <div class="btn-card calc-btn" data-value="6">6</div>
    <div class="btn-card calc-btn" data-value="-">&minus;</div>
    <div class="btn-card calc-btn" data-value="1">1</div>
    <div class="btn-card calc-btn" data-value="2">2</div>
    <div class="btn-card calc-btn" data-value="3">3</div>
    <div class="btn-card calc-btn" data-value="+">+</div>
    <div class="btn-card calc-btn" data-value="0">0</div>
    <div class="btn-card calc-btn" data-value=".">.</div>
  </div>

  
  <div id="fibonacci" class="fib-area">
    <div class="fib-controls">
      <label>Enter Fibonacci terms:</label>
      <input id="terms" type="number" min="1" max="45" placeholder="1-45" />
      <button id="drawBtn">Draw Curve</button>
    </div>
    <div class="fib-canvas">
      <div id="fibPlaceholder" class="fib-placeholder">
        Enter the Fibonacci term to generate the curve
      </div>
      <img id="fibImg" class="fib-img" alt="Fibonacci Curve" />
    </div>
  </div>
</div>

</body>
</html>