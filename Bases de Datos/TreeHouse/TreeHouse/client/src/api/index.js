import axios from "axios";
 
const url = "http://localhost:8000/";
 
export const sendEvent = (event) => axios.post(url + "event", event);