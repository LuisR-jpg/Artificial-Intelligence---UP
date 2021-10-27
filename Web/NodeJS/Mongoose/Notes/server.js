
const express = require("express");
const path = require("path");
const app = express();
app.use(express.json()); // for parsing application/json
app.use(express.urlencoded({ extended: true })); // for parsing application/x-www-form-urlencoded
app.set("views", path.join(__dirname, "views")); // for ejs
app.set("view engine", "ejs"); // for ejs

const mongoose = require('mongoose');
mongoose
    .connect('mongodb://localhost:27017/daw')
    .then(() => console.log('Successfully connected to db'))
    .catch((err) => console.log("Error: ", err))

const noteeSchema = new mongoose.Schema({
  title: String, 
  description: String
});



const Note = mongoose.model("Nota", noteeSchema);

/*
let posts = [
  { username: "erickgtzh", post: "Hoy es un buen díaaaa!!!" },
  { username: "sebastian", post: "Ya hace hambre" },
  { username: "rafael", post: "Huele a gas" },
  { username: "saracar", post: "Tengo sueñooooo ZzZ" },
];
*/  


app.get("/posts", (req, res) => {
  Note.find({}, (err, docs) => {
    res.render("posts/index", { docs });
    console.log(docs);
  });
});

app.post("/posts", (req, res) => {
  console.log(req.body);
  const {username, post} = req.body;
  //posts.push({username: username, post: post});
  Note.create({title: username, description: post}, () => res.redirect("/posts"));
  //res.render("posts/index", { });
  //res.redirect("/posts")
});

app.get("/posts/create", (req, res) => {
  res.render("posts/create");
});

app.get("/posts/modify", (req, res) => {
  Note.find({}, (err, docs) => {
    res.render("posts/modify", { docs });
    console.log(docs);
  });
});

app.post("/posts/modify", (req, res) => {
  const {idnum} = req.body;
  console.log(idnum);
  Note.deleteOne({_id: idnum}, () => res.redirect("/posts"))
  //res.send(req.body);
  /*
  let index = 0;
  for(let i = 0; i < posts.length; i++){
    console.log(posts[i].username)
    if(posts[i].username == user){
      index = i;
    }
  }
  posts.splice(index, 1);
  res.render("posts/index", { posts });
  */

});

app.get("/posts/clear", (req, res) => {
  Note.deleteMany({}, () => res.redirect("/posts"))
});

app.listen(3000, () => {
  console.log("Server running...");

});