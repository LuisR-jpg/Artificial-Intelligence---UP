/*
const fs = require("fs");
fs.copyFileSync("math.js", "nuevo.js");
*/
const math = require("./math");
//console.log("Math Node:", math.add(5, 4));

const superheroes = require("superheroes");
//console.log(superheroes.random())

const YesNo = require("yes-no-words");
for(var i = 0; i < 10; i++)
    console.log(YesNo.yesRandom());
for(var i = 0; i < 10; i++)
    console.log(YesNo.noRandom());
for(var i = 0; i < 10; i++)
    console.log(YesNo.allRandom());
