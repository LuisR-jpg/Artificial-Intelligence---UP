fetch("https://pokeapi.co/api/v2/pokemon/")
.then((data) => data.json())
.then((data) => console.log(data));