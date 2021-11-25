import { useState } from "react";
import { createTodo } from "../functions/index.js";

function Todo() {
    const [title, setTitle] = useState();
    const [content, setContent] = useState();

    const handleOnChangeTitle =  (e) => {
        setTitle(e.target.value);
    };
    const handleOnChangeContent = (e) => {
        const {value} = e.target;
        setContent(value)
    };
    const onSubmitHandler = async () =>  {
        await createTodo({title:title, content:content})
    };

    return (
    <div className="row">
        <form className="col s12" onSubmit={onSubmitHandler}>
            <div className="row">
                <div className="input-field col s6">
                    <i className="material-icons prefix">account_circle</i>
                    <input id="icon_prefix" type="text" className="validate" onChange={handleOnChangeTitle}/>
                    <label htmlFor="icon_prefix">Titulo</label>
                </div>
                <div className="input-field col s6">
                    <i className="material-icons prefix">Descripcion</i>
                    <input id="icon_telephone" type="tel" className="validate" onChange={handleOnChangeContent}/>
                    <label htmlFor="icon_telephone">Descripcion</label>
                </div>
            </div>
            <div className="row right-align">
                <button class="waves-effect waves-light btn">
                    <i class="material-icons left">send</i>Publicar
                </button>
            </div>
        </form>
    </div>
    )
}

export default Todo;
