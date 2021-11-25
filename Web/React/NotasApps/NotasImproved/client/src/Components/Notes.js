import { getTodos, deleteTodo} from "../functions/index.js";
import { useEffect, useState } from "react";

function Notes(){
const [todos, setTodos] = useState();
const removeTodo = async (id) => {
    await deleteTodo(id);
}
useEffect(() => {
    const fetchData = async() => {
        const result = await getTodos();
        setTodos(result)
    };
    fetchData();
}, [todos]); //Refreshes the page
    return(
        <>
            <ul class="collection with-header">
                <li class="collection-header"><h4>Stuff to do</h4></li>
                {todos && todos.map((todo) => {
                    if(todo.title)
                        return(
                            <li class="collection-item" key={todo._id}>
                                <div>{todo?.title}
                                    <a href = "#!" class="secondary-content" onClick= {() => removeTodo(todo._id)}>
                                        <i class="material-icons">delete</i>
                                    </a>
                                </div>
                            </li>
                        )
                })}
            </ul>
        </>
    )
}

export default Notes;