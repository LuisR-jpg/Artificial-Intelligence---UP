var countries = ["USA", "Mexico"];
var states = new Array("Chihuahua", "Washington");
console.log(countries, states);
console.log(countries.length, states.length);
states.pop(); //Deletes last element
console.log(countries.length, states.length);
countries.unshift(0);
console.log(countries, states);
countries.shift(); //Deletes first element
console.log(countries, states);
console.log(countries.indexOf("USA"), countries.indexOf("Australia"));
console.log(Array.from("Hitesh"));
