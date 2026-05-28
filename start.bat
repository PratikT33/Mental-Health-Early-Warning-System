@echo off
title Mental Health Early Warning System - Startup
color 0A

echo.
echo  =====================================================
echo    Mental Health Early Warning System
echo    Starting all services...
echo  =====================================================
echo.

:: ── 1. Create MongoDB data directory if it doesn't exist ──
if not exist "%~dp0data\db" (
    mkdir "%~dp0data\db"
    echo  [OK] Created MongoDB data directory at data\db
)

:: ── 2. Start MongoDB ──────────────────────────────────────
echo  [*] Starting MongoDB on port 27018...
cd /d "%~dp0"
start "MongoDB" cmd /k "mongod --dbpath data\db --port 27018"
timeout /t 3 /nobreak >nul
echo  [OK] MongoDB started.

:: ── 3. Start FastAPI Backend ──────────────────────────────
echo  [*] Starting FastAPI backend on http://localhost:8000 ...
cd /d "%~dp0backend"
start "Backend - FastAPI" cmd /k "python run.py"
timeout /t 2 /nobreak >nul
echo  [OK] Backend started.

:: ── 4. Start Vite Frontend ────────────────────────────────
echo  [*] Starting React frontend on http://localhost:5173 ...
cd /d "%~dp0frontend"
start "Frontend - Vite" cmd /k "npm run dev"
timeout /t 2 /nobreak >nul
echo  [OK] Frontend started.

:: Reset directory
cd /d "%~dp0"

echo.
echo  =====================================================
echo    All services are running!
echo.
echo    Frontend  ->  http://localhost:5173
echo    Backend   ->  http://localhost:8000
echo    API Docs  ->  http://localhost:8000/docs
echo    MongoDB   ->  localhost:27017
echo  =====================================================
echo.
echo  Press any key to exit this window (servers keep running)
pause >nul
