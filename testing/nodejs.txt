var express = require("express");
var app = express();

app.use(express.json()); //Used to parse JSON bodies
app.use(express.urlencoded()); //Parse URL-encoded bodies

var fs = require('fs');
var obj;
fs.readFile('/path/to/send_Res.json', 'utf8', function (err, data) {
  if (err) throw err;
  obj = JSON.parse(data);
});

app.get('/hello', (req, res) => {
  res.setHeader('Content-Type', 'application/json');
  res.end(JSON.stringify(obj));
});

app.post("/send", (req, res) => {
  console.log(req.body); 
  res.setHeader('Content-Type', 'application/json');
  res.end(JSON.stringify(obj));
});
app.listen(3000, () => {
 console.log("Server running on port 3000");
});
