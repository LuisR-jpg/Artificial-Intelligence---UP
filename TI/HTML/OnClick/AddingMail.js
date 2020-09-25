function myFunction() {
  var n = document.getElementById("inputName").value;
  var ap = document.getElementById("inputLName").value;
  var am = document.getElementById("inputLName2").value;
  var ele = document.getElementsByName('inlineRadioOptions'); 
  var v = document.getElementById("sel").value;
  var c = document.getElementById("Email1").value.toLowerCase(), s, e = "";
  patron = /^[a-zA-ZÀ-ÿ ]+$/;
  correo = /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/;
  if( n.length && ap.length && am.length && (ele[0].checked || ele[1].checked) && v != "Seleccionar..." && c.length ){
    s = "Nombre: " + n;
    s += "\nApellidos: " + ap  + " " + am;
    s += "\nGenero: " + (ele[0].checked? "Hombre": "Mujer");
    s += "\nVivienda: " + v;
    s += "\nCorreo: " + c;
    if( !patron.test(n) ){
      e += "\n\tNombre";
      document.getElementById("inputName").focus();
    }
    if( !patron.test(ap) ){
      e += "\n\tApellido Paterno";
      document.getElementById("inputLName").focus();
    }
    if( !patron.test(am) ){
      e += "\n\tApellido Materno";
      document.getElementById("inputLName2").focus();
    }
    if(	!correo.test(c) ){
      e += "\n\tCorreo"; 
      document.getElementById("Email1").focus();
    }
    if( e.length ){
      alert("Por favor revisa tu entrada de:" + e);
      return;
    }
  }
  else{
    s = "Elemento(s) por llenar:\n";
    if( !n.length ){
      document.getElementById("inputName").focus();
      s += "\tNombre\n";
    }
    if( !ap.length ){
      document.getElementById("inputLName").focus();
      s += "\tApellido Paterno\n";
    }
    if( !am.length ){
      document.getElementById("inputLName2").focus();
      s += "\tApellido Materno\n";
    }
    if( !(ele[0].checked || ele[1].checked) )s += "\tGenero\n";
    if( v == "Seleccionar..." ){
      document.getElementById("sel").focus();
      s += "\tVivienda\n";
    }
    if( !c.length ){
      document.getElementById("Email1").focus();
      s += "\tCorreo";
    }
  }
  alert(s);
}
