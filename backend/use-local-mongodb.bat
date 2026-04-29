@echo off
echo Switching to Local MongoDB...
echo.

cd /d "%~dp0"

echo Updating .env file to use local MongoDB...
powershell -Command "(Get-Content .env) -replace '^MONGODB_URI=.*', 'MONGODB_URI=mongodb://localhost:27017/studyflow' | Set-Content .env"

echo.
echo ✅ Updated to local MongoDB
echo.
echo Next steps:
echo 1. Install MongoDB from: https://www.mongodb.com/try/download/community
echo 2. Start MongoDB service
echo 3. Run: start-server.bat
echo.
pause