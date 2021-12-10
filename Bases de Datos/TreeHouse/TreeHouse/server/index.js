const bodyParser = require("body-parser");
const express = require("express");
const cors = require("cors");
const app = express();
app.use(bodyParser.json());
app.use(cors());

const configsql = {
    user: 'TreeHouse',
    password: 'THSL1221',
    server: 'localhost',
    database: 'TreeHouse' ,
    options: {
        trustedConnection: true,
        encrypt: true,
        enableArithAbort: true,
        trustServerCertificate: true
    }
};
const PORT = 8000;
app.listen(PORT, () => {
    console.log(`Servidor iniciado en puerto ${PORT}`);
});
app.get('/', function(requets, response){
    response.send("API desde NodeJS")
});
app.post('/event', function(request, response){
    console.log(request.body)
    const {nombre, nPersonas} = request.body;
    var sql = require("mssql");
    sql.connect(configsql, function(err){
        if(err) console.log("Error 1:", err);
        var querystring = `insert into Eventos (Nombre, NumeroPersonas) values ('${nombre}', ${nPersonas})`;
        var result = new sql.Request();
        result.query(querystring, function(err, recordset){
            if(err) console.log("Falló", err);
            else response.send(recordset);
        })
    })
});
app.get('/menu', function(request,response){
    var sql = require("mssql");
    sql.connect(configsql, function(err){
        if(err) console.log(err);
        var querystring = "SELECT * FROM PRODUCTO";
        var result = new sql.Request();
        result.query(querystring, function(err, recordset){
            if(err) console.log(err);
            response.send(recordset);
        })
    })
});