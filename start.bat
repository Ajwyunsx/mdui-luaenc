@echo off
echo Starting Lua Code Obfuscation Tool...
echo.
REM Check if Python is available
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo Error: Python is not installed or not in PATH!
    echo Please install Python and try again.
    echo.
    pause
    exit /b 1
)

echo Starting HTTP server...
start /B python -m http.server 8000
echo.
echo Opening browser...
timeout /t 2 >nul
start http://localhost:8000
echo.
echo The tool has been opened in your browser. Enjoy using it!
echo.
pause