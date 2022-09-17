const express = require('express');
const User = require('../models/User');
const auth = require("../middlewares/auth");

const userRouter = express.Router();

userRouter.get('/api/user', auth, async (req, res) => {
    try {
        const users = await User.find({});
        return res.status(200).json(users);
    } catch (e) {
        return res.status(500).json({ error: e.message });
    }
})

userRouter.get('/api/user/:id', auth, async (req, res) => {
    try {
        const id = req.params.id;
        const user = await User.findById(id);
        return res.status(200).json(user);
    } catch (e) {
        return res.status(500).json({ error: e.message })
    }
})

userRouter.patch('/api/user/:id', auth, async (req, res) => {
    try {
        const id = req.params.id;
        const user = await User.findById(id);
        return res.status(200).json(user);
    } catch (e) {
        return res.status(500).json({ error: e.message })
    }
})


module.exports = userRouter