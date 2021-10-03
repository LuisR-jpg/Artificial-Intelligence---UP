//Applies a function inside of an array without using loops
//All codes below are equivalent
/*
var isEven = (element) => {
  return element % 2 === 0;
};
//console.log(isEven(2));
var result = [2, 3, 6, 8].every(isEven);
*/
var result = [2, 3, 6, 7].every((e) => (e % 2 === 0));
console.log(result);
