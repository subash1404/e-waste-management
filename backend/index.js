const express = require("express");
require("dotenv").config();
const bodyParser = require("body-parser");
const jwt = require("jsonwebtoken");
const mongoose = require("mongoose");
const userRoute = require("./routes/user");
const requestRoute = require("./routes/request");
const app = express();
const cors = require("cors");
const helmet = require("helmet");

app.use(helmet());
app.use(cors());

//express middleware
app.use(express.json());

//moongose connection to database
mongoose
  .connect(process.env.MONGO_URI)
  .then(() => {
    //app listening to the requests
    app.listen(process.env.PORT, () => {
      console.log("listening to port " + process.env.PORT);
    });
  })
  .catch((error) => {
    console.log("error");
  });

//route configuration for user login
app.use("/user", userRoute);
app.use("/request", requestRoute);

app.use("/test", (req, res) => {
  res.json({ message: "Hello from server" });
});
