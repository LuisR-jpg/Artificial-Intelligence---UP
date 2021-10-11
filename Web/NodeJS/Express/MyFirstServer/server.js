const express = require("express");
const app = express();
app.get("/", function(request, response){
    //console.log("Request", request);
    response.send("Hello, world!")
});
app.get("/PrimeraMayus", function(request, response){
    //console.log("Request", request);
    response.send("This is my about!")
});
app.get("/aMayus", function(request, response){
    //console.log("Request", request);
    response.send("<h1>Call me, bbe</h1>")
});
app.get("/aMinus", function(request, response){
    //console.log("Request", request);
    response.send("<h1>Call me, bbe</h1>")
});
app.listen(3000, function(){
    console.log("Servidor corriendo en puerto 3000.");
});