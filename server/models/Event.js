const mongoose = require('mongoose')

const eventSchema = mongoose.Schema(
    {
        startDate: {
            required: true,
            type: Date,
        },
        endDate: {
            required: true,
            type: Date,
        },
        recorded: {
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
        title: {
            required: true, 
            type: String, 
            default: false,
        },
        description: {
            required: true, 
            type: String, 
            default: false,
        },
        location: {
            required: true, 
            type: String, 
            default: false,
        }
    },
    {
        collection: "Events"
    }
);

const Event = mongoose.model('Event', eventSchema);
module.exports = Event;