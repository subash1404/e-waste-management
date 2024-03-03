const express = require("express");
const router = express.Router();
const mongoose = require("mongoose");
const schema = mongoose.Schema;

const requestSchema = new schema({
  title: {
    type: String,
    required: true,
  },
  weight: {
    type: Number,
    required: true,
  },
  products: [
    {
      product: { type: String },
    },
  ],
  lat:{
    type:String,
  },
  long:{
    type:String,
  },
  status:{
    type:String,
    required:true,
    default:"Pending"
  },
  userId: {
    type: schema.Types.ObjectId,
    required:true,
    ref:'users',
  },
});


module.exports = mongoose.model("request",requestSchema);