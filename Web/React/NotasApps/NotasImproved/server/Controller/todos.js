import mongoose from "mongoose";
import Todo from "../Models/todos.js";
export const getTodos = async(req, res) => {
    try{
        const Todos = await Todo.find();
        res.status(200).json(Todos);
    }
    catch(error) {
        res.status(400).json({message: error.message})
    }
};

export const createTodo = async(req, res) => {
    console.log(req.body);
    const todo = new Todo(req.body);

    try{
        await todo.save()
        req.status(200).json(todo);
    }
    catch(error) {
        res.status(400).json({message: error.message})
    }
};

export const deleteTodo = async(req, res) => {
    const {id} = req.params;
    if (!mongoose.Types.ObjectId.isValid(id))
        return res.status(404).send("This ID doesn't exist!")
    await Todo.findByIdAndRemove(id);
    return res.status(200).json({message : "To Do deleted successfully!"})
};