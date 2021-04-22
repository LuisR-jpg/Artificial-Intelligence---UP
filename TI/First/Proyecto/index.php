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
	margin-top: 10px;
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

<body>

<!-- Begin Container -->
<div id="container" style="width: 850px">
	<!-- Begin Masthead -->
	<div id="masthead" style="width: 850px">
		<a href="http://www.up.edu.mx/sede.aspx?doc=3">
		<img alt="Universidad Panamericana Campus Bonaterra" height="128" src="images/sys_escudointerno3.png" width="138" longdesc="Universidad Panamericana Campus Bonaterra" class="auto-style3" /></a>
		<h3 class="auto-style1" style="height: 100px"><span class="Titulos" >Registro de Asistencia</br>ECEE</br>Administración</span></h3>		

	</div>
	<!-- End Masthead -->
	<!-- Begin Page Content -->
	<div id="page_content">
		<!-- Begin Left Column -->
		<div id="column_l" style="left: 0px; top: 0px; width: 820px">
			<h1 class="auto-style6">Bienvenido</br></br></h1>
			<?php
			  // login.php Interface de entrada a usuarios autorizados para modificar la app
			  include_once('user_auth_fns.php');
				
			  if (!check_auth_user()) 
			  {
			    login_form();
			  }
			  else
			  {
				header('Location: default.php');
			  }
			?>
			</div>
		<!-- End Left Column -->
	<!-- End Page Content -->
<!-- End Container -->
	<!-- Begin Footer -->
	<div id="footer" style="width: 850px">
		<p class="auto-style5">Copyright &copy; 2019 
		<a href="http://www.up.edu.mx/">Tecnologías de la Información</a>. Reservados todos los 
		derechos.</p>
	</div>
	<!-- End Footer --></div>
<!-- End Container -->

</body>

</html>
