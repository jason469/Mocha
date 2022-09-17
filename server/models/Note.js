const mongoose = require('mongoose')

const noteSchema = mongoose.Schema(
    {
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
            type: String,
        },
        userName: {
            required: true, 
            type: String,
        },
        isCompleted: {
            required: true, 
            type: Boolean, 
            default: false,
        }
    },
    {
        collection: "Notes"
    }
);

const Note = mongoose.model('Note', noteSchema);
module.exports = Note;