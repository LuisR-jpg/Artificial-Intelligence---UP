import {useState} from "react";
function Todo(){
    const [titleValue, setTitle] = useState();
    const [descValue, setDesc] = useState();
    function titleChanged(e){
        const {value} = e.target;
        setTitle(value);
        console.log(titleValue);
    }
    function descChanged(e){
        const {value} = e.target;
        setDesc(value);
        console.log(descValue);
    }
    return(
        <div>
            <div className="row">
                <form className="col s12">
                    <div className="row">
                        <div className="input-field col s6">
                            <i className="material-icons prefix">account_circle</i>
                            <input id="icon_prefix" type="text" className="validate" onChange = {titleChanged}/>
                            <label htmlFor="icon_prefix">Titulo</label>
                        </div>
                        <div className="input-field col s6">
                            <i className="material-icons prefix">Description</i>
                            <input id="icon_telephone" type="tel" className="validate" onChange = {descChanged}/>
                            <label htmlFor="icon_telephone">Description</label>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    )
}
export default Todo;