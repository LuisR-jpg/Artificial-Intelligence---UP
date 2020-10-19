<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html dir="ltr" xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
    <title>Workshop RED</title>
    <link href="http://www.ags.up.mx/tiqr/favicon.ico" rel="shortcut icon" type="image/vnd.microsoft.icon" />
    <link href="styles/style3.css" media="screen" rel="stylesheet" title="CSS" type="text/css" />
    <style type="text/css">
      .auto-style3 {
      	border-width: 0;
      	margin-left: 30px;
      	margin-right: 30px;
      }
      .auto-style4 {
      	font-size: 16pt;
      	font-family: Tahoma;
      	color: #005E1D;
      	margin-top: 25px;
      	margin-right: 0px;
      	margin-bottom: 0px;
      	text-align: center;
      	padding-right: 180px;
      }
      .auto-style5 {
      	font-family: Tahoma;
      }
      .auto-style6 {
      	font-size: 20pt;
      	font-family: Tahoma;
      	color: #005E1D;
      	margin-top: 15px;
      	margin-right: 0px;
      	margin-bottom: 0px;
      	text-align: center;
      }
    </style>
  </head>
  <body style = "background-color: white">

    <!-- Begin Container -->
    <div id="container" style="width: 850px; background-image: url(images/background.jpg); background-size: 850px; background-repeat: no-repeat">

      <!-- Begin Masthead -->
      <div id="masthead" style="width: 850px; background-color: transparent">
	<a href="http://www.up.edu.mx/sede.aspx?doc=3">
	  <img alt="Universidad Panamericana Campus Bonaterra" src="images/LogoUP.png" width="150" longdesc="Universidad Panamericana Campus Bonaterra" class="auto-style3" />
	</a>
	<br>
      </div>
      <div align = center>
	<h1>Bienvenido</h1>
	<h4>Lista de asistencia</h4>
      </div>
      <!-- End Masthead -->


      <!-- Begin Page Content -->
      <div id="page_content" align = "center"> 
<!-- id="column_l" -->
	<div style="border-radius = 5px; background-color: rgb(233, 241, 242); width: 500px">
	  <?php
	    // login.php Interface de entrada a usuarios autorizados para modificar la app
	    include_once('user_auth_fns.php');
	    if( !check_auth_user() ) login_form();
            else header('Location: default.php');
	  ?>
	</div>
      </div>
      <br>
      <div align = right>
	<a href = "http://www.up.edu.mx/sede.aspx?doc=3?">
	  <img style = "margin-bottom: 10px" width = 75 alt = "universidad panamericana campus bonaterra" src = "images/LogoZoom.png" longdesc = "universidad panamericana campus bonaterra" class = "auto-style3"/>
	</a>
    	<!-- End Page Content -->


    	<!-- Begin Footer -->
    	<div id="footer" style="width: 850px">
	  <p class="auto-style5">Copyright &copy; 2019 
	    <a href="http://www.up.edu.mx/">Tecnologías de la Información</a>.
	    Reservados todos los derechos.
	  </p>
    	</div>
    	<!-- End Footer -->

      </div>
    </div>
    <!-- End Container -->

  </body>
</html>
