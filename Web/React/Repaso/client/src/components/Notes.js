import {getTodos} from "../functions/index.js";
import Button from 'react-bootstrap/Button';
import Row from 'react-bootstrap/Row';
import Col from 'react-bootstrap/Col';
import Container from 'react-bootstrap/Container';
import 'bootstrap/dist/css/bootstrap.min.css';
import React, {useEffect, useState} from "react";
function Notes(){
    var rows = [];

    useEffect(() => {
        console.log("Todos");
        const fetchData = async() => {
            const result = await getTodos();
            console.log('Fetched data', result);

        };
        fetchData();
    }, []);

    for(let i = 0; i < 5; i++)
    rows.push(<Col>{i} of 5</Col>);
    return(
        <>  
            <Container style = {{backgroundColor: "wheat"}}>

            <Row>
                {rows}
                {rows}
                {rows}
                {rows}
                {rows}
                {rows}
                {rows}
                {rows}
                {rows}
                {rows}
                {rows}
                {rows}
                {rows}
                {rows}
                {rows}
                <Col>1 of 3</Col>
                <Col>2 of 3</Col>
                <Col>2 of 2</Col>
                <Col>3 of 3</Col>
            </Row>
            </Container>
        </>
    );
}
export default Notes;