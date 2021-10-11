const math = {};
function add(a, b){
    return a + b;
}
const multiply = (a, b) => {
    return a * b;
}
const PI = Math.PI;

math.add = add;
math.multiply = multiply;
math.PI = PI;

module.exports = math;
