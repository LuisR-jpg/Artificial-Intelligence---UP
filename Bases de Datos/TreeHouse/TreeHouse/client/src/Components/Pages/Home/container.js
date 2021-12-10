import React from "react"
import Container from 'react-bootstrap/Container'
import './container.css';
import "bootstrap/dist/css/bootstrap.min.css"
import Button from 'react-bootstrap/Button'
// import Logo from './Logo.png'
import M from 'materialize-css'
import Swal from 'sweetalert2';
// import { Link } from 'react-router-dom';
import Nav from 'react-bootstrap/Nav'
import { BrowserRouter as Router, Link } from "react-router-dom";
import { useEffect, useState } from 'react';



function Cont() {

    const menuChange = (x) =>{
        console.log("menuuu");
        window.location = "/Menu"
    }
    const eventosChange = (x) =>{
        console.log("eventosss");
        window.location = "/Eventos"
    }

    const iconChange = (x) =>{
        Swal.fire({
            position: 'center',
            html: '<h1>Misión</h1>\n<p>Un día lleno de trabajo requiere una alimentación deliciosa y nutritiva, pensada para iniciar el día con buena actitud.\nNuestra misión es otorgar alimentos prácticos que no distraen al comensal de aquello que más importa, la convivencia y el trabajo responsable. Creamos los distintos porductos Tree House para que sean alimentos ideales en reuniones empresariales y eventos.</p>\n\n  <h1>Visión</h1>\n<p>Tree House desea ofrecer alimentos frescos y naturales, cuya combinación de ingredientes formen un menú con variedad de alimentos en conjunto con snacks y bebidas; buscando lograr el equilibrio perfecto entre el disfrute del paladar y la nutrición del comensal, manteniendo siempre excelente calidad y servicio.</p>',
            showConfirmButton: true,
            confirmButtonColor: '#467a39',
        })
        
    }

    return (
        
        <Container fluid className="container">
            {/* <br/> */}
            <h1 className="Titulo">¡Bienvenid@!</h1>
            <br/><br/>
            <Button onClick={menuChange} className="menueventos" variant="success">Menú</Button>
            <br/><br/>
            <Button onClick={eventosChange} className="menueventos" variant="success">Eventos</Button>


            <i class="small material-icons right iconColor" onClick={iconChange} >info_outline</i>

            <br/>
        </Container>
    )
}

export default Cont;