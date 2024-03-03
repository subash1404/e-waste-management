const express = require('express');
const mongoose = require('mongoose');
const router = express.Router();
const schema = mongoose.Schema;
const Request = require('../models/requestmodel');

router.post('/postRequest',async (req,res) => {
    try{
        const {title,weight,lat,long,userId,products} = req.body;
        const newRequest = new Request({
            title,weight,
            products,lat,long,userId
        })
        await newRequest.save();
        res.status(201).json({message:"Request Saved successfully"});
    }catch(err){
        console.log(err);
        res.status(500).json({message:"Internal server error"});
    }
});

router.get('/getRequest',async (req,res) => {
    try{
        const {userId}  = req.body;
        const requests = await Request.find({userId:userId});
        res.json(requests);
    }catch(err){
        console.log(err);
        res.status(500).json({message:"Internal server error"});
    }
})

module.exports = router;

