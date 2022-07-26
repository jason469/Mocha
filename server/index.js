const express = require('express');
const mongoose = require('mongoose')
require('dotenv').config()

const app = express();
const PORT = 5000;
const DB = process.env.DB_CONNECTION;

const authRouter = require('./routes/auth')

//Middleware
app.use(authRouter)

//Connections
mongoose.connect(DB).then(() => {
    console.log('Connection Successful');
})
.catch(error => {
    console.log(error)
})

//API
app.get('/', (req, res) => {
    res.json({hi: "Hello"})
})


app.listen(PORT, "0.0.0.0", () => {
    console.log(`connected at port ${PORT}`)
})  
