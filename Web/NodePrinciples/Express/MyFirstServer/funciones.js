const PrimeraMayus = (cad) => {
    return cad[0].toUpperCase() + cad.substring(1);
}
const aMayus = (cad) => {
    return cad.toUpperCase();
}
const aMinus = (cad) => {
    return cad.toLowerCase();
}
console.log(PrimeraMayus("hola"));
console.log(aMayus("hola"));
console.log(aMinus("hola"));