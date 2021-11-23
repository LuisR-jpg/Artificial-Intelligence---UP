import {getTodos} from "../functions/index.js";
import Col from 'react-bootstrap/Col';
import Container from 'react-bootstrap/Container';
import Card from 'react-bootstrap/Card';
import 'bootstrap/dist/css/bootstrap.min.css';
import { IconName } from "react-icons/bi";

import React, {useEffect, useState} from "react";
function Notes(){
    var rows = [];
    const [notas, setNotas] = useState();

    useEffect(() => {
        console.log("Todos");
        const fetchData = async() => {
            const result = await getTodos();
            console.log('Fetched data', result);
            setNotas(result);
        };
        fetchData();
    }, []);

    for(let i = 0; i < 5; i++)
    rows.push(<Col>{i} of 5</Col>);
    return(
        <>  
            <Container>
                    {notas && notas.map((nota) => {
                        if(nota.title)
                            return(
                                <Card>
                                    <Card.Header>{nota.title}</Card.Header>
                                    <Card.Body>
                                        <Card.Text>{nota.content}</Card.Text>
                                    </Card.Body>
                                </Card>
                            )
                    })}

            </Container>
        </>
    );
}
export default Notes;