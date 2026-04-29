# Local MongoDB Setup (Alternative to Atlas)

If MongoDB Atlas is not working, you can use local MongoDB instead.

## Install MongoDB Locally

1. **Download MongoDB Community Edition**
   - Go to: https://www.mongodb.com/try/download/community
   - Select: Windows → MSI → Version 7.0+ (Current)
   - Download and install

2. **Start MongoDB Service**
   - After installation, MongoDB should start automatically
   - Or start manually: `net start MongoDB`

3. **Update Environment File**
   - Change `.env` file:
     ```env
     MONGODB_URI=mongodb://localhost:27017/studyflow
     ```

4. **Test Connection**
   ```bash
   & "C:\Program Files\nodejs\node.exe" test-db.js
   ```

## If Local MongoDB Doesn't Work

You can also use MongoDB Compass (GUI) to test:
1. Download: https://www.mongodb.com/try/download/compass
2. Connect to: `mongodb://localhost:27017`
3. Create database: `studyflow`

## Quick Test Commands

```bash
# Check if MongoDB service is running
net start | findstr MongoDB

# Start MongoDB if not running
net start MongoDB

# Stop MongoDB
net stop MongoDB
```