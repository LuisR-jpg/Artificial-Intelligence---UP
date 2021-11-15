import "./index.css"
import React, {useState, useEffect} from "react";

function Usuario(props){
    const [info, setInfo] = useState();
    const { persona } = props;
    const  handleAsync = async() => {
        const user = await fetch("https://api.github.com/users/" + persona);
        const userJson = await user.json();
        console.log("Este es mi user", userJson);
        setInfo(userJson)
    }
    useEffect(() => {
        console.log("Bienvenido");
        handleAsync();
    }, []);
    return(
        <div className = "user">
            <img src = {info?.avatar_url} style = {{width: "25%"}}/><br/>
            <code>{info?.name}</code><br/>
            <code>@{info?.login}</code>
        </div>
    );
}



export default Usuario;