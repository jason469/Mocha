require('dotenv').config()

const express = require('express');
const mongoose = require('mongoose');
const authRouter = require('./routes/auth');
const eventRouter = require('./routes/event');
const noteRouter = require('./routes/note');
const userRouter = require('./routes/user');

//Define backend
const app = express();
const PORT = 5000;
const DB = process.env.DB_CONNECTION;


//Middleware
app.use(express.json())
app.use(authRouter)
app.use(noteRouter)
app.use(userRouter)
app.use(eventRouter)


//Connections
mongoose.connect(DB).then(() => console.log('Connection Successful'))
.catch(error => console.log(error))

//API
app.listen(PORT, "0.0.0.0", () => console.log(`connected at port ${PORT}`))  
