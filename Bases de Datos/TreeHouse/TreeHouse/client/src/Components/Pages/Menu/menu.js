import React from "react"
import Container from 'react-bootstrap/Container'
import './menu.css';
import Button from 'react-bootstrap/Button'
// import Logo from './Logo.png'
import M from 'materialize-css'
import Swal from 'sweetalert2';
import "bootstrap/dist/css/bootstrap.min.css"
import { Dropdown, DropdownItem, DropdownMenu, DropdowmToggle } from 'react-bootstrap'
import { useEffect, useState } from 'react';


function Menu() {
    const [categoria, setCategoria] = useState();
    const [sabor, setSabor] = useState();

    const ChangeCategoria = (x) =>{
        // Swal.fire({
        //     position: 'center',
        //     title: `${x}`,
            
        //     showConfirmButton: true,
        //     confirmButtonColor: '#467a39',
        // })
        var cate = JSON.parse(localStorage.getItem('cat'));
        console.log("categoria: ",cate);
    }

    const ChangeSabor = (x) =>{

    }

    const backChange = (x) =>{
        window.location = "/";
    }

    useEffect(() => {
        const fetchData = async() => {
            // const resCateg = await getCategorias();
            const resCateg = ['unoC', 'dosC', 'tresC'];
            setCategoria(resCateg);

            // const resSab = await getAllSabores();
            const resSab = ['unoS', 'dosS', 'tresS'];
            setSabor(resSab);
        };
        fetchData();
    }, []);
    return (
        
        <Container fluid className="container">
            <i class="small material-icons left iconColor" onClick={backChange} >arrow_back</i>

            <br/><br/>
            <h1 className="TituloMenu">Menú</h1>
            <br/><br/>

            {/* ¿QUÉ TENEMOS? */}
            <Dropdown className="Options" >
                <Dropdown.Toggle variant="success" id="dropdown-basic">
                    ¿Qué tenemos?
                </Dropdown.Toggle>

                <Dropdown.Menu >
                   {categoria && categoria.map((cat) =>{
                       return(
                            <Dropdown.Item onClick={(e) => 
                                Swal.fire({
                                    position:'center', 
                                    title:`${cat}`,
                                    showConfirmButton: true,
                                    confirmButtonColor: '#467a39',
                                     
                                })}>{cat}</Dropdown.Item>
                       )
                   })}
                </Dropdown.Menu>
            </Dropdown>

            {/* ¿ALGO ESPECÍFICO? */}
            <br/><br/>
            <Dropdown className="Options" >
                <Dropdown.Toggle  variant="success" id="dropdown-basic"> 
                    ¿Algo específico?
                </Dropdown.Toggle>

                <Dropdown.Menu className="Options" >
                   {sabor && sabor.map((sab) =>{
                       return(
                             <Dropdown.Item onClick={(e) => 
                                Swal.fire({ 
                                    position:'center', 
                                    title:`${sab}`  
                                })}>{sab}</Dropdown.Item>
                        )
                   })}
                </Dropdown.Menu>
            </Dropdown>
            <br/><br/>
            <br/><br/>
        </Container>
    )
}

export default Menu;