function myFunction() {
  var n = document.getElementById("inputName").value;
  var p = document.getElementById("inputLName").value;
  var m = document.getElementById("inputLName2").value;
  var l = document.getElementsByName('inlineRadioOptions'); 
  var v = document.getElementById("sel").value;
  var c = document.getElementById("Email1").value.toLowerCase(), s = "", e = "", a = "";
  patron = /^[a-zA-ZÀ-ÿ ]+$/;
  correo = /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/;

  if( !c.length ) s = "\n\tCorreo" + s, a = "Email1";
  if( !correo.test(c) ) e = "\n\tCorreo" + e, a = "Email1";
  if( v == "Seleccionar..." ) s = "\n\tVivienda" + s, a = "sel";
  if( !(l[0].checked || l[1].checked) ) s = "\n\tGenero" + s;
  if( m.length < 5 || m.length > 120 ) s = "\n\tApellido materno" + s, a = "inputLName2";
  if( !patron.test(m) ) e = "\n\tApellido materno" + e, a = "inputLName2";
  if( p.length < 5 || p.length > 120 ) s = "\n\tApellido paterno" + s, a = "inputLName";
  if( !patron.test(p) ) e = "\n\tApellido paterno" + e, a = "inputLName";
  if( n.length < 5 || n.length > 120 ) s = "\n\tNombre" + s, a = "inputName";
  if( !patron.test(n) ) e = "\n\tNombre" + e, a = "inputName";
  if( s.length || e.length ){
    if( a.length ) document.getElementById(a).focus();
    if( s.length ) alert("Verifique que haya llenado los siguientes campos:" + s + "\nNota. Las entradas deben ser de entre 5 y 120 caracteres");
    else alert("Verifique que las siguentes entradas sean validas:" + e);
  }
  else{
    s = "Nombre: " + n;
    s += "\nApellidos: " + p  + " " + m;
    s += "\nGenero: " + (l[0].checked? "Hombre": "Mujer");
    s += "\nVivienda: " + v;
    s += "\nCorreo: " + c;
    alert("Datos Ingresados:\n" + s);
  }
}
function changed(){
  alert("Ha cambiado el valor a " + document.getElementById("sel").value);
}
