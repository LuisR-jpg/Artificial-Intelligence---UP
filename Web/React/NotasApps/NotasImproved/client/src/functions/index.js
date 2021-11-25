import * as api from  "../api/index.js"

export const getTodos = async() => {
    try {
        const {data} = await api.getTodos();
        return data;
    }
    catch (error) {
        console.log(error)
    }
}

export const createTodo = async({title, content}) => {
    try {
        const {data} = await api.createTodo({title, content});
        return data;
    }
    catch (error) {
        console.log(error)
    }
}

export const deleteTodo = async(id) => {
    try {
        await api.deleteTodo(id);
        return `${id} deleted successfully`;
    }
    catch (error) {
        console.log(error)
    }
}
