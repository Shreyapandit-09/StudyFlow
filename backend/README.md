# StudyFlow Backend Setup Guide

## Prerequisites

You need to install the following on your system:

### 1. **Node.js and npm**
   - ✅ **INSTALLED** - You have Node.js installed at `C:\Program Files\nodejs`
   - Verify installation:
     ```bash
     & "C:\Program Files\nodejs\node.exe" --version
     & "C:\Program Files\nodejs\npm.cmd" --version
     ```

### 2. **MongoDB Database**

   **Current Status: Connection Failed** ❌
   The MongoDB Atlas connection is failing. Here are the solutions:

   **Option A: Fix MongoDB Atlas Connection (Recommended)**
   1. Go to [MongoDB Atlas](https://cloud.mongodb.com/)
   2. Login to your account
   3. Go to **Network Access** → **IP Access List**
   4. Add IP Address: `0.0.0.0/0` (Allow access from anywhere - for testing)
   5. Or add your current IP address
   6. Wait 5-10 minutes for changes to take effect
   7. Try running the test again

   **Option B: Use Local MongoDB (Alternative)**
   - Download from: https://www.mongodb.com/try/download/community
   - Install and start MongoDB service
   - Update `.env` file:
     ```env
     MONGODB_URI=mongodb://localhost:27017/studyflow
     ```
   - Default connection: `mongodb://localhost:27017/studyflow`

## Installation Steps

### 1. Navigate to backend directory
```bash
cd backend
```

### 2. Install dependencies
```bash
& "C:\Program Files\nodejs\npm.cmd" install
```
✅ **COMPLETED** - Dependencies installed successfully

### 3. Test Database Connection
```bash
& "C:\Program Files\nodejs\node.exe" test-db.js
```

### 4. Start the server

**Development mode (with auto-reload):**
```bash
& "C:\Program Files\nodejs\npm.cmd" run dev
```

**Production mode:**
```bash
& "C:\Program Files\nodejs\node.exe" server.js
```

The server will start on `http://localhost:5000`

## Current Issues & Solutions

### ❌ MongoDB Connection Failed
**Error:** `querySrv ECONNREFUSED _mongodb._tcp.cluster0.odg3qfr.mongodb.net`

**Solutions:**
1. **Check Internet Connection** - Make sure you have stable internet
2. **MongoDB Atlas Network Access:**
   - Login to MongoDB Atlas
   - Go to Network Access
   - Add `0.0.0.0/0` to IP whitelist
   - Wait 5-10 minutes
3. **Firewall/Security Software** - Temporarily disable firewall
4. **Try Different Network** - Use mobile hotspot if available
5. **Use Local MongoDB** - Install MongoDB locally as fallback

### ✅ Node.js Working
Node.js is properly installed and working.

### ✅ Dependencies Installed
All npm packages installed successfully.

## Quick Start Commands

```bash
# Test database connection
& "C:\Program Files\nodejs\node.exe" test-db.js

# Start server
& "C:\Program Files\nodejs\node.exe" server.js

# Or use npm (if PATH is configured)
npm run dev
```

## API Endpoints

### Authentication Routes

#### 1. **Sign Up** - `POST /api/auth/signup`
```json
{
  "name": "John Doe",
  "email": "john@example.com",
  "password": "password123"
}
```

#### 2. **Sign In** - `POST /api/auth/signin`
```json
{
  "email": "john@example.com",
  "password": "password123"
}
```

#### 3. **Get Profile** - `GET /api/auth/profile`
Headers: `Authorization: Bearer <token>`

#### 4. **Logout** - `POST /api/auth/logout`
Headers: `Authorization: Bearer <token>`

#### 5. **Health Check** - `GET /api/health`

## Testing the API

Once the server is running, you can test the endpoints using:

1. **Browser:** Visit `http://localhost:5000/api/health`
2. **Postman:** Import the API endpoints
3. **Frontend:** Open `index.html` and try signup/signin

## Troubleshooting

### MongoDB Atlas Issues
- **IP Whitelist:** Make sure your IP is whitelisted in Atlas
- **Cluster Status:** Ensure cluster is running (not paused)
- **Connection String:** Verify the connection string in `.env`
- **Network:** Try different network or VPN

### Node.js Issues
- **Path Issues:** Use full path `& "C:\Program Files\nodejs\node.exe"`
- **Port Conflicts:** Change PORT in `.env` if 5000 is busy

### General Issues
- **Firewall:** Temporarily disable firewall/antivirus
- **Dependencies:** Run `npm install` again if needed
- **Environment:** Check `.env` file has correct values

## Next Steps

1. **Fix MongoDB Connection** (see solutions above)
2. **Test Database Connection:**
   ```bash
   & "C:\Program Files\nodejs\node.exe" test-db.js
   ```
3. **Start Server:**
   ```bash
   & "C:\Program Files\nodejs\node.exe" server.js
   ```
4. **Test Signup/Signin** in your frontend
5. **Deploy** when ready (optional)

---

**Current Status:**
- ✅ Node.js: Installed and working
- ✅ Dependencies: Installed
- ❌ MongoDB: Connection failed (needs fixing)
- ⏳ Server: Ready to start once DB is connected

## Installation Steps

### 1. Navigate to backend directory
```bash
cd backend
```

### 2. Install dependencies
```bash
npm install
```

This will install:
- **express** - Web framework
- **mongoose** - MongoDB object modeling
- **bcryptjs** - Password hashing
- **jsonwebtoken** - JWT authentication
- **dotenv** - Environment variables
- **cors** - Cross-origin requests
- **express-validator** - Input validation
- **nodemon** - Auto-reload during development

### 3. Create `.env` file
A `.env` file has already been created with default values. You can modify it if needed:

```env
MONGODB_URI=mongodb://localhost:27017/studyflow
PORT=5000
NODE_ENV=development
JWT_SECRET=studyflow_super_secret_key_2024_change_in_production
JWT_EXPIRE=7d
CORS_ORIGIN=http://localhost:3000
```

### 4. Start the server

**Development mode (with auto-reload):**
```bash
npm run dev
```

**Production mode:**
```bash
npm start
```

The server will start on `http://localhost:5000`

## API Endpoints

### Authentication Routes

#### 1. **Sign Up** - `POST /api/auth/signup`
```json
{
  "name": "John Doe",
  "email": "john@example.com",
  "password": "password123"
}
```

Response:
```json
{
  "success": true,
  "message": "User registered successfully",
  "token": "eyJhbGciOiJIUzI1NiIs...",
  "user": {
    "id": "user_id",
    "name": "John Doe",
    "email": "john@example.com",
    "avatar": null
  }
}
```

#### 2. **Sign In** - `POST /api/auth/signin`
```json
{
  "email": "john@example.com",
  "password": "password123"
}
```

Response:
```json
{
  "success": true,
  "message": "Login successful",
  "token": "eyJhbGciOiJIUzI1NiIs...",
  "user": {
    "id": "user_id",
    "name": "John Doe",
    "email": "john@example.com",
    "avatar": null
  }
}
```

#### 3. **Get Profile** - `GET /api/auth/profile`
Headers:
```
Authorization: Bearer <token>
```

Response:
```json
{
  "success": true,
  "user": {
    "id": "user_id",
    "name": "John Doe",
    "email": "john@example.com",
    "avatar": null
  }
}
```

#### 4. **Logout** - `POST /api/auth/logout`
Headers:
```
Authorization: Bearer <token>
```

Response:
```json
{
  "success": true,
  "message": "Logout successful. Please remove the token from client storage."
}
```

#### 5. **Health Check** - `GET /api/health`
Response:
```json
{
  "success": true,
  "message": "Server is running",
  "timestamp": "2024-04-24T12:00:00.000Z"
}
```

## Backend Structure

```
backend/
├── server.js                 # Main server entry point
├── package.json              # Dependencies
├── .env                      # Environment configuration
├── .env.example              # Example environment file
├── config/
│   └── db.js                # MongoDB connection setup
├── models/
│   └── User.js              # User schema and model
├── routes/
│   └── auth.js              # Authentication routes
└── middleware/
    └── auth.js              # JWT authentication middleware
```

## Frontend Integration

The frontend (`index.html`) needs to be updated to call these backend APIs. Update the `handleSignup()` and `handleLogin()` functions to make requests to the backend.

Example:
```javascript
// For signup
const response = await fetch('http://localhost:5000/api/auth/signup', {
  method: 'POST',
  headers: { 'Content-Type': 'application/json' },
  body: JSON.stringify({ name, email, password })
});

// For signin
const response = await fetch('http://localhost:5000/api/auth/signin', {
  method: 'POST',
  headers: { 'Content-Type': 'application/json' },
  body: JSON.stringify({ email, password })
});
```

## Troubleshooting

### MongoDB Connection Issues
- Ensure MongoDB is running locally or MongoDB Atlas credentials are correct
- Check `MONGODB_URI` in `.env`

### Port Already in Use
- Change `PORT` in `.env` to another port (e.g., 5001)

### CORS Errors
- Make sure `CORS_ORIGIN` in `.env` matches your frontend URL

### npm command not found
- Install Node.js from https://nodejs.org/

## Security Notes

- Always change `JWT_SECRET` in production
- Never commit `.env` file to version control (already in .gitignore if you have one)
- Use HTTPS in production
- Validate and sanitize all inputs (already implemented with express-validator)
- Hash passwords with bcrypt (already implemented)

## Next Steps

1. Install Node.js if not already installed
2. Set up MongoDB (local or Atlas)
3. Run `npm install` in the backend folder
4. Start the server with `npm run dev`
5. Update the frontend HTML to make API calls to the backend
6. Test signup and signin functionality

