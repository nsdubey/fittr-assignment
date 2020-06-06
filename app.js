const createError = require('http-errors');
const express = require('express');
const path = require('path');
const cookieParser = require('cookie-parser');
const bodyParser = require('body-parser');
const logger = require('morgan');
const mysql = require('mysql');

const app = express();


app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));


app.use("/", require("./routes/index"))

const port = 4020;

/******** Create Connection to database *************/
const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'promocode_managment'
});
console.log("hello")

// connect to database
db.connect((err) => {
  if (err) {
    throw err;
  }
});
global.db = db;

// catch 404 and forward to error handler
app.use(function (req, res, next) {
  next(createError(404));
});

// error handler
app.use(function (err, req, res, next) {
  // render the error page
  res.status(err.status || 500);
  res.json({ status: "error", message: "Error" })
});

app.listen(port, () => {
  console.log(`Server running on port: ${port}`);
});

module.exports = app;