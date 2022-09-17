const express = require('express');
const Note = require('../models/Note');
const User = require('../models/User');
const auth = require("../middlewares/auth");

const noteRouter = express.Router();

noteRouter.get('/api/notes', auth, async (req, res) => {
    const notes = await Note.find({
    });
    res.json(notes)
})

noteRouter.post('/api/notes/add-note', auth, async (req, res) => {
    try {
        const {
            title,
            description,
            userId
        } = req.body;

        user = await User.findById(userId);
        userName = user.name

        let note = new Note({
            title,
            description,
            date: Date.now(),
            userId,
            userName,
        })
        note.save()
        return res.json(note);
    } catch (e) {
        return res.status(500).json({ error: e.message })
    }
})

noteRouter.patch('/api/notes/edit-note', auth, async (req, res) => {
    try {
        console.log(req.body)
        const {
            title,
            description,
            noteId
        } = req.body;

        note = await Note.findById(noteId);
        note.title = title
        note.description = description
        note.save()
        return res.json(note);
    } catch (e) {
        return res.status(500).json({ error: e.message })
    }
})

noteRouter.patch('/api/notes/toggle-complete', auth, async (req, res) => {
    try {
        const {
            id
        } = req.body;
        const note = await Note.findById(id);
        note.isCompleted = !note.isCompleted
        note.save()
        return res.status(200).json({ isCompleted: note.isCompleted });
    } catch (e) {
        return res.status(500).json({ error: e.message })
    }
})


noteRouter.delete('/api/notes/delete-note/:id', auth, async (req, res) => {
    try {
        const id = req.params.id;
        const note = await Note.findById(id);
        await note.delete()
        return res.status(200).json({ msg: "Note deleted" });
    } catch (e) {
        return res.status(500).json({ error: e.message })
    }
})

module.exports = noteRouter