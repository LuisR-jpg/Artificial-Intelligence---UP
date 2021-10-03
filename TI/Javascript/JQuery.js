$(document).ready(function(){
  //Aquí va el codigo
  $('h1').html('Etiqueta H1'); //Reemplaza el codigo dentro de h1 (todos los h1)
  $('.display-4').html('DesdeClase');
  $('#idh1').html('Desde ID');

  $('.container h1').html('Cambio de texto');
  $('.container h1:first').html('Cambio de texto');
  $('.container h1:last').html('Cambio de texto');
  }
);
