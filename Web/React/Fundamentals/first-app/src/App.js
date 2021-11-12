import React from "react";
import Blog from "./components/Blog"
function App() {
  //Inicializacion
  const [state, setState] = React.useState();
  function handleChange(e){
    const {value} = e.target;
    console.log(value);

    setState(value);
  }
  return (
    <>
      <Blog />
      <p style = {{ paddingLeft: 10 }} >Ingresa algooo</p>
      <input style = {{paddingLeft: 10}} onChange = {handleChange} name = "inputReact"/>
      <Blog textoContenido = {state} textoTitulo = {state}/>
      <Blog textoTitulo = "Este es titulo 1" textoContenido = "Este es mi contenido 1"/>
      <Blog textoTitulo = "Este es titulo 2" textoContenido = "Este es mi contenido 2"/>
      <Blog textoTitulo = "Este es titulo 3" textoContenido = "Este es mi contenido 3"/>
      <Blog />
    </>
  );
}

export default App;
