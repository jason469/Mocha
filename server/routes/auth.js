const express = require('express');
const User = require('../models/User');
const bcryptjs = require('bcryptjs');
const jwt = require('jsonwebtoken');

const authRouter = express.Router();


authRouter.post('/api/signup', async (req, res) => {
    try {
        console.log(`request is ${req}`)
        const {
            name,
            email,
            password
        } = req.body;

        const existingUser = await User.findOne({ email });
        if (existingUser) {
            return res.status(400).json({ msg: 'There is already a user with that email!' });
        }

        const hashedPassword = await bcryptjs.hash(password, 8);

        let user = new User({
            email,
            password: hashedPassword,
            name,
        })
        user = await user.save()
        res.json(user);
    } catch (e) {
        return res.status(500).json({ error: e.message })
    }
})

authRouter.post('/api/signin', async (req, res) => {
    try {
        const { email, password } = req.body;
        const user = await User.findOne({ email });
        if (!user) {
            return res
            .status(400)
            .json({ msg: 'User with this email doesnt exist' });
        }
        const isMatch = await bcryptjs.compare(password, user.password);
        if (!isMatch) {
            return res
            .status(400)
            .json({ msg: 'Incorrect password' });
        }

        const token = jwt.sign({id: user._id}, "passwordKey");
        res.json({token, ...user._doc})
    } catch (e) {
        return res.status(500).json({ error: e.message })
    }
})

module.exports = authRouter