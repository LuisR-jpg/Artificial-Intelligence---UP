const express = require("express");
const path = require("path");

const app = express();

app.use(express.json()); // for parsing application/json
app.use(express.urlencoded({ extended: true })); // for parsing application/x-www-form-urlencoded

app.set("views", path.join(__dirname, "views")); // for ejs
app.set("view engine", "ejs"); // for ejs

const posts = [
  { username: "erickgtzh", post: "Hoy es un buen díaaaa!!!" },
  { username: "sebastian", post: "Ya hace hambre" },
  { username: "rafael", post: "Huele a gas" },
  { username: "saracar", post: "Tengo sueñooooo ZzZ" },
];

app.get("/posts", (req, res) => {
  res.render("posts/index", { posts });
});

app.get("/posts/create", (req, res) => {
    res.render("posts/create", { posts });
});

app.post("/posts", (req, res) => {
    console.log(req.body);
    const {username, post} = req.body;
    posts.push({username, post});
    res.send("<h1>Posted</h1>")
});

app.listen(3000, () => {
  console.log("Server running...");
});