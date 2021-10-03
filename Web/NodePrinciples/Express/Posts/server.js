const express = require("express");
const path = require("path");
const app = express();
app.use(express.json()); // for parsing application/json
app.use(express.urlencoded({ extended: true })); // for parsing application/x-www-form-urlencoded
app.set("views", path.join(__dirname, "views")); // for ejs
app.set("view engine", "ejs"); // for ejs

let posts = [/*
  { username: "erickgtzh", post: "Hoy es un buen díaaaa!!!" },
  { username: "sebastian", post: "Ya hace hambre" },
  { username: "rafael", post: "Huele a gas" },
  { username: "saracar", post: "Tengo sueñooooo ZzZ" },
  */  
];

app.get("/posts", (req, res) => {
  res.render("posts/index", { posts });
});

app.post("/posts", (req, res) => {
  console.log(req.body);
  const {username, post} = req.body;
  posts.push({username: username, post: post});
  for(let p of posts){
    console.log(p);
  }
  /*res.send(
    `
    <h1>Posted</h1>
    <a href = "./posts">See posts!</a>
    `
  );
  */
  res.render("posts/index", { posts });
});

app.get("/posts/create", (req, res) => {
  res.render("posts/create", { posts });
});

app.get("/posts/modify", (req, res) => {
  res.render("posts/modify", { posts });
});

app.post("/posts/modify", (req, res) => {
  const {user, newPost} = req.body;
  //res.send(req.body);
  for(let i = 0; i < posts.length; i++){
    console.log(posts[i].username)
    if(posts[i].username == user){
      posts[i].post = newPost;
    }
  }
  res.render("posts/index", { posts });
});

app.get("/posts/delete/:id", (req, res) => {
  const {id} = req.body;
  console.log(posts);
  console.log(posts.splice(id, 1));
  res.render("posts/index", {posts});
});

app.get("/posts/clear", (req, res) => {
  posts = [];
  res.render("posts/index", {posts});
});

app.get("/posts/update", (req, res) => {
  let usernames = [
    "engageunit",
    "erminelisten",
    "ceremonylever",
    "jordanianwise",
    "leveretcard",
    "confessporcupine",
    "jealousarmy",
    "sewsister",
    "recipepay",
    "bushgambian"
  ];
  let greetings = [
    "Hi",
    "Hey",
    "What’s up",
    "It’s a pleasure",
    "Hello",
    "Good morning",
    "Good afternoon",
    "Good evening",
    "It's a great day",
    "I wanna sleep"
  ];
  let u = Math.random()*usernames.length, p = Math.random()*greetings.length;
  posts.unshift({username: usernames[parseInt(u)], post: greetings[parseInt(p)]});
  res.render("posts/index", {posts});
});

app.listen(3000, () => {
  console.log("Server running...");
});