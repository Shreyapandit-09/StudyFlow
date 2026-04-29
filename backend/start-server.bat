@echo off
echo ========================================
echo   StudyFlow Backend Server Starter
echo ========================================
echo.

cd /d "%~dp0"

echo Checking Node.js installation...
"C:\Program Files\nodejs\node.exe" --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Node.js not found. Please install Node.js from https://nodejs.org/
    pause
    exit /b 1
)
echo ✅ Node.js found
echo.

echo Testing MongoDB connection...
"C:\Program Files\nodejs\node.exe" test-db.js
if %errorlevel% neq 0 (
    echo.
    echo ❌ MongoDB connection failed!
    echo.
    echo 🔧 Please fix the MongoDB Atlas IP whitelist:
    echo    1. Go to https://cloud.mongodb.com
    echo    2. Network Access → Add IP Address
    echo    3. Add: 0.0.0.0/0 (or your IP: 14.194.100.206)
    echo    4. Wait 5-10 minutes
    echo    5. Run this script again
    echo.
    echo 💡 Or use local MongoDB (see LOCAL_MONGODB.md)
    echo.
    pause
    exit /b 1
)

echo.
echo ✅ MongoDB connection successful!
echo Starting StudyFlow backend server...
echo.
echo 🌐 Server will be available at: http://localhost:5000
echo 🛑 Press Ctrl+C to stop the server
echo.

"C:\Program Files\nodejs\node.exe" server.js