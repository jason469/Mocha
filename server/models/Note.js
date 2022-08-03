const mongoose = require('mongoose')

const noteSchema = mongoose.Schema(
    {
        id: {
            required: true,
            type: Number,
        },
        title: {
            required: true,
            type: String,
            trim: true,
        },
        description: {
            required: true,
            type: String,
            trim: true,
        },
        date: {
            required: true,
            type: Date,
        },
        userId: {
            required: true, 
            type: String
        }
    },
    {
        collection: "Notes"
    }
);

const Note = mongoose.model('Note', noteSchema);
module.exports = Note;