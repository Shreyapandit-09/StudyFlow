const mongoose = require('mongoose');
require('dotenv').config();

async function testConnection() {
  try {
    console.log('Testing MongoDB connection...');
    console.log('Connection string:', process.env.MONGODB_URI);

    await mongoose.connect(process.env.MONGODB_URI, {
      serverSelectionTimeoutMS: 10000,
      socketTimeoutMS: 45000,
      family: 4,
    });

    console.log('✅ MongoDB connection successful!');
    console.log('Connected to database:', mongoose.connection.db.databaseName);

    await mongoose.connection.close();
    console.log('Connection closed.');
  } catch (error) {
    console.error('❌ MongoDB connection failed:');
    console.error('Error:', error.message);

    if (error.message.includes('ECONNREFUSED')) {
      console.log('\n🔧 Troubleshooting suggestions:');
      console.log('1. Check your internet connection');
      console.log('2. Verify MongoDB Atlas IP whitelist (0.0.0.0/0 for testing)');
      console.log('3. Make sure your MongoDB Atlas cluster is running');
      console.log('4. Check if your firewall is blocking the connection');
      console.log('5. Try using a different network (mobile hotspot)');
    }
  }
}

testConnection();