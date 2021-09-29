const express = require('express')
const app = express();
app.use(express.json()); // for parsing application/json
app.use(express.urlencoded({ extended: true })); // for parsing application/x-www-form-urlencoded

app.get("/", function (req, res) {
    res.sendFile(__dirname + "/calculator.html");
});

app.post("/", function (req, res) {
    // res.send("<h1>Thanks for posting!</h1>");
    //console.log(req.body);
    
    //res.send(`${+req.body.numUno + +req.body.numDos}`)
    
    // const {numUno, numDos} = req.body;
    // res.send(`<h1>Num 1 = ${+numUno + +numDos}</h1>`); ///+var = Numero()
});

app.listen(3000, function () {
console.log("Servidor corriendo!");
});
/*
app.get('/Calculator', function(req, res){ //* Para que cualquier dirección accese
    //res.send('<h1>Hola, mucho gusto!</h1>');
    console.log(__dirname);
    res.sendFile(__dirname + '/Calculator.html');
});
app.get('*', function(req, res){ //* Para que cualquier dirección accese
    //res.send('<h1>Hola, mucho gusto!</h1>');
    res.send("This page doesn't exist.")
});
app.post("/Calculator", function(req, res){
    res.send("<h1>Thanks for posting!<h1>")
})
*/