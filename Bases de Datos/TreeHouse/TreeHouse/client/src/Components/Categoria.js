import React, { useEffect, useState } from "react";
import { getSabores } from "../functions/index.js";
function Categoria(props){
    const [flavors, setFlavors] = useState();
    const [categoria, setCategoria] = useState(props.categoria);
    useEffect(() => {
        console.log(categoria);
        const fetchData = async () => {
            const result = await getSabores(categoria);
            setFlavors(result.recordset)
            console.log(result.recordset);
        }
        fetchData();

      }, []);
    return(
        <>
            <h3>{categoria}</h3>
            <ul>
                {
                    flavors && flavors.map((sabor) => {
                        return(
                            <li>{sabor.Nombre}</li>
                        )
                    })
                }
            </ul>
        </>
    );
}
export default Categoria;