var counter = 0;
function myFunction() {
    var n = document.getElementById("inputName").value;
    var ele = document.getElementsByName('inlineRadioOptions'); 
    var v = document.getElementById("sel").value;
    var b = document.getElementById("inputBrand").value;
    var c = document.getElementById("Email1").value.toLowerCase(), s, e = "";
    patron = /^[a-zA-ZÀ-ÿ ]+$/;
    correo = /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/;
    if( n.length && (ele[0].checked || ele[1].checked) && v != "Seleccionar..." && c.length && b.length ){
      s = "Nombre: " + n;
      s += "\nEstado: " + (ele[0].checked? "Nuevo": "Seminuevo");
      s += "\nMarca: " + v;
      s += "\nSubmarca: " + b;
      s += "\nCorreo: " + c;
      if( !patron.test(n) ){
        e += "\n\tNombre";
        document.getElementById("inputName").focus();
      }
      if(!correo.test(c) ){
        e += "\n\tCorreo"; 
        document.getElementById("Email1").focus();
      }
      if(e.length){
        alert("Por favor revisa tu entrada de:" + e);
        return;
      }
      counter++;
    }
    else{
      s = "Elemento(s) por llenar:\n";
      if( !n.length ){
        document.getElementById("inputName").focus();
        s += "\tNombre\n";
      }
      if( !(ele[0].checked || ele[1].checked) )s += "\tEstado\n";
      if( v == "Seleccionar..." ){
        document.getElementById("sel").focus();
        s += "\tMarca\n";
      }
      if( !b.length ){
        document.getElementById("inputBrand").focus();
        s += "\tSubmarca\n";
      }
      if( !c.length ){
        document.getElementById("Email1").focus();
        s += "\tCorreo";
      }

    }
    alert(s);
    document.getElementById("buscados").innerHTML = "Carros solicitados: " + counter;
  }