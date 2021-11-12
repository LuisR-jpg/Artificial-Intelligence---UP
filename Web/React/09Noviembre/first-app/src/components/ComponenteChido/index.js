import React, {useState, useEffect} from "react";
function ComponenteChido(){
    const [info, setInfo] = useState();
    const  handleAsync = async() => {
        const user = await fetch("https://api.github.com/users/luisr-jpg");
        const userJson = await user.json();
        console.log("Este es mi user", userJson);
        setInfo(userJson)
    }
    useEffect(() => {
        console.log("Bienvenido");
        handleAsync();
    }, []);
    return(
        <>
            <img src = {info?.avatar_url}/>
            <p>{info?.name}</p>
            <p>@{info?.login}</p>
        </>
    );
}
export default ComponenteChido;