import React from "react"
import Container from 'react-bootstrap/Container'
import './eventos.css';
import "bootstrap/dist/css/bootstrap.min.css"

function Eventos() {

    const backChange = (x) =>{
        window.location = "/";
    }
    
    return (
        
        <Container fluid className="container">
            <br/>
            <i class="small material-icons left iconColor" onClick={backChange} >arrow_back</i>

            
            <h1 className="TituloEventos">Eventos</h1>
            <br/><br/>
           
            <br/>
            <br/>
            <br/>
        </Container>
    )
}

export default Eventos;