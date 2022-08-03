const express = require('express');
const Note = require('../models/Note');

const noteRouter = express.Router();

noteRouter.get('/note', auth, async (req, res) => {
    const note = await Note.findById(req.noteId);
    res.json({...user._doc, token: req.token})
}) 


module.exports = noteRouter