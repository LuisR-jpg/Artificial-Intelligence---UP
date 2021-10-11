const mongoose = require('mongoose');
mongoose
    .connect('mongodb://localhost:27017/daw')
    .then(() => console.log('Probando Mongooo'))
    .catch((err) => console.log("Error: ", err))

const movieSchema = new mongoose.Schema({
    // title: "Toy Story", 
    // year: 1996, 
    // score: 100,
    // rating: 'A',    
   title: String, 
   year: Number,
   score: Number, 
   rating: String,
});

const Movie = mongoose.model("Movie", movieSchema);
const toystory = new Movie({title: "Toy Story", year: "1996", score: 100, rating: "A"});    
console.log(toystory);