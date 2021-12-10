import React, { useState } from "react";
import { DatePicker } from "react-materialize";
import { sendEvent } from "../functions/index.js";
import Swal from "sweetalert2";
import withReactContent from "sweetalert2-react-content";
const MySwal = withReactContent(Swal);
function Eventos(){
    const [date, setDate] = useState({myDate: new Date(Date.now()).toDateString().substring(4)});
    const [name, setName] = useState("");
    const [people, setPeople] = useState(3);
    const [mail, setMail] = useState("");
    const nameChanged = (e) => {
        const {value} = e.target;
        setName(value);
        console.log(name);
    }
    const mailChanged = (e) => {
        const {value} = e.target;
        setMail(value);
    }
    const peopleChanged = (e) => {
        const {value} = e.target;
        setPeople(value);
    }
    const dateChanged = (e) => {
        const key = e.target.id;
        const val = e.target.value;
        const newState = {...date};
        newState[key] = val.toDateString().substring(4);
        setDate(newState);
    }
    const onSubmitHandler = async (e) => {
        e.preventDefault();
        var send = {
            nombre: name,
            correo: mail,
            nPersonas: people,
        };
        console.log(await sendEvent(send));
        setName("");
        setMail("");
        MySwal.fire({
            title: "Evento registrado.",
            icon: "success",
            text: "Pronto nos pondremos en contacto",
            confirmButtonText: "¡Qué emoción!",
          });
    }
    return(
        <div style={{display: 'flex',  justifyContent:'center', alignItems:'center', height: '100vh'}}>
            <form className="col s12" onSubmit={onSubmitHandler}>
                <h4>Contacto</h4>
                <div className="row">
                    <div className="input-field col s10">
                        <input id="nombre" type="text" onChange = {nameChanged} value = {name} required/>
                        <label htmlFor="first_name">Nombre</label>
                    </div>
                        <div className="input-field col s10">
                            <input id="email" type="email" onChange = {mailChanged}  value = {mail} required/>
                            <label htmlFor="email">Email</label>
                        </div>
                </div>
                <h4>Datos del evento</h4>
                <div className="row inline">
                    <div className="col s5">
                        <div className="input-field">
                            <input type="number" value = {people} id = "people" min = "1" max = "500" onChange = {peopleChanged} required/>
                            <label htmlFor="people">Personas</label>
                        </div>
                    </div>
                    <div className = "col s5">
                        <DatePicker
                                readOnly
                                label="Fecha del evento"
                                value={date.myDate}
                                id="myDate"
                                onChange={(newDate) => {
                                    dateChanged({
                                        target: {
                                            id: "myDate",
                                            value: newDate
                                        }
                                    })
                                }} 
                            />
                    </div>
                </div>
                <button className="waves-effect waves-light btn" >
                        <i className="material-icons right">send</i>Solicitar
                </button>
            </form>
        </div>
    );
}
export default Eventos;