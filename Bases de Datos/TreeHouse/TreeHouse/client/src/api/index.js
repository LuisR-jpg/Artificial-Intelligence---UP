import axios from "axios";
 
const url = "http://localhost:8000/";
 
export const sendEvent = (event) => axios.post(url + "event", event);
export const getSabores = (categoria) => axios.get(url + "sabores?categoria=" + categoria);
export const getCategorias = () => axios.get(url + "categorias");