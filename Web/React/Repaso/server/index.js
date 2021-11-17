import express from "express";
import dotenv from "dotenv";
import mongoose from "mongoose";
import cors from "cors";
import todoRoutes from "./routes/todos.js"

const app = express();
dotenv.config();

app.use(express.json({limit: "30mb", extended: true}));
app.use(express.urlencoded({limit: "30mb", extended: true}));

const MONGO_URL = `mongodb+srv://${process.env.Mongo_Username}:${process.env.Mongo_Password}@cluster0.ytdh1.mongodb.net/myFirstDatabase?retryWrites=true&w=majority`;
console.log(MONGO_URL)

const PORT = process.env.PORT || 8000;  

app.use(cors());

app.get("/", (req, res) => {
    res.send("Servidor corriendo...")
});
app.use("/todos", todoRoutes);

mongoose.connect(MONGO_URL, {
    useNewUrlParser: true,
    useUnifiedTopology: true,   
})
.then(
    () => app.listen(PORT),
    () => console.log(`Server running on ${PORT}`)
)
.catch((error) => console.log(error));
