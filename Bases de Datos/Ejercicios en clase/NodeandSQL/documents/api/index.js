const express = require("express");
const bodyParser = require("body-parser");
const app = express();
app.use(bodyParser.json());
const configsql = {
    user: 'UserRamen',
    password: 'Ramen123',
    server: 'localhost',
    database: 'ramenreview' ,
    options: {
        trustedConnection: true,
        encrypt: true,
        enableArithAbort: true,
        trustServerCertificate: true
    }
};

app.get('/', function(request, response){
    response.send("API desde NodeJS")
});
app.post('/testpost', function(request, response){
    var objeto = request.body;
    response.send(objeto.nombre);
});
app.get('/brand', function(request,response){

    var filter = request.query.filter;

    var sql = require("mssql");

    sql.connect(configsql, function(err){
        if(err) console.log(err);

        var querystring = "";

        if(filter){
            querystring = "select IdBrand, BrandName from Brand where BrandName like '%"+filter+"%'"
        }else{
            querystring = "select IdBrand, BrandName from Brand";
        }

        var result = new sql.Request();

        result.query(querystring, function(err, recordset){
            if(err) console.log(err);
            response.send(recordset);
        })
    })
});
app.post("/brand", function(request, response){
    var brand = request.body;
    if(brand.brandname){
        var sql = require("mssql");
        sql.connect(configsql, function(error){
            if(error) console.log(error);
            var querystring = "insert into brand (brandname) values ('" + brand.brandname + "')";
            var result = new sql.Request();
            result.query(querystring, function(error, recordSet){
                response.send(recordSet);
            });
        });
    }
    else{
        response.status(400);
        response.send('Objeto Incorrecto');
    }
});
app.patch('/brand', function(request, response){
    var brand = request.body;
    if(brand.brandname && brand.idbrand){
        var sql = require("mssql");
        sql.connect(configsql, function(error){
            if(error) console.log(error);
            var querystring = "update brand set brandname = '" + brand.brandname + "' where idbrand = " + brand.idbrand;
            var result = new sql.Request();
            result.query(querystring, function(err, recordSet){
                if(err) console.log(err);
                response.send(recordSet);
            })
        })
    }
    else {
        response.status(400);
        response.send('Objeto Incorrecto');
    }
})
app.delete('/brand', function(request, response){
    var idbrand = request.query.idbrand;
    if(idbrand){
        var sql = require("mssql");
        sql.connect(configsql, function(err){
            if(err) console.log(err);
            var querystring = "delete from brand where idbrand =" + idbrand;
            var result = new sql.Request();
            result.query(querystring, function(err, recordSet){
                if(err){
                    console.log(err);
                    response.status(500);
                    response.send(err);
                }
                else {
                    response.send(recordSet);
                }
            });
        })

    }
    else {
        response.status(400);
        response.send('No se proporcionó el idbrand');
    }
});
app.get('/topten', function(request, response){
    var idcountry = request.query.idcountry;

    var sql = require("mssql");

    sql.connect(configsql, function(err){
        if(err) console.log(err);

        var sqlrequest = new sql.Request();

        var querystring = '';

        if(idcountry){
            querystring="select top 10 IdRamenReview,CountryName,BrandName,StyleName,Variety,Stars from Ramen rr  join Country c on rr.IdCountry=c.IdCountry join Brand b on rr.IdBrand=b.IdBrand join Style s on rr.IdStyle=s.IdStyle order by Stars desc";
        }else{
            querystring="select top 10 IdRamenReview,CountryName,BrandName,StyleName,Variety,Stars from Ramen rr  join Country c on rr.IdCountry=c.IdCountry join Brand b on rr.IdBrand=b.IdBrand join Style s on rr.IdStyle=s.IdStyle where rr.IdCountry=1 order by Stars desc";
        }

        sqlrequest.query(querystring, function(err, recordset){
            if(err) console.log(err);
            response.send(recordset);
        })
    })
})

app.listen(3000, () => {
    console.log("Servidor iniciado en puerto 3000");
});
