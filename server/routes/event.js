const express = require('express');
const Event = require('../models/Event');
const auth = require("../middlewares/auth");

const eventRouter = express.Router();

eventRouter.get('/api/events', auth, async (req, res) => {
    const events = await Event.find({
    });
    res.json(events)
})

eventRouter.get('/api/events/:id', auth, async (req, res) => {
    const id = req.params.id;
    const event = await Event.findById(id);
    res.json(event)
})

eventRouter.post('/api/add-event', auth, async (req, res) => {
    try {
        const {
            title,
            description,
            userId,
            startDate, 
            endDate
        } = req.body;

        user = await User.findById(userId);
        userName = user.name

        let event = new Event({
            startDate,
            endDate,
            recorded: Date.now(),
            userId,
            userName,
            title,
            description, 
            location
        })
        event.save()
        return res.json(event);
    } catch (e) {
        return res.status(500).json({ error: e.message })
    }
})


eventRouter.delete('/api/notes/delete-note/:id', auth, async (req, res) => {
    try {
        const id = req.params.id;
        const event = await Event.findById(id);
        await event.delete()
        return res.status(200).json({ msg: "Event deleted" });
    } catch (e) {
        return res.status(500).json({ error: e.message })
    }
})

module.exports = eventRouter