<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype HTML>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE = edge">
<meta name="viewport" content="width = device-width, initial-scale = 1">
<title>Success</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/bootstrap/css/custom.css">
<script
	src="<%=request.getContextPath()%>/resources/bootstrap/js/jquery.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.min.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/bootstrap/js/custom.js"></script>
<style type="text/css">

</style>
</head>
</head>
<body>
	<!-- LOGO -->
	<header style="background-color: #9ACD32;">
		<div class="container">
			<a href="<%=request.getContextPath()%>/"><img
				src="<%=request.getContextPath()%>/resources/img/logo.png"
				width="55" height="55"></a>
		</div>
	</header>
	<hr style="margin: 0;" class="hidden-xs" />
	<div
		style="border: 1px solid #C7A138; padding-top: 45px; padding-bottom: 45px; background: #ADA692;">
		<div class="row bs-wizard" style="border-bottom: 0; width: 100%;">

			<div class="col-xs-4 bs-wizard-step complete" style="color: black;">
				<div class="text-center bs-wizard-stepnum">
					<h3 style="padding: 0; margin: -2px;">1</h3>
				</div>
				<div class="progress">
					<div class="progress-bar"></div>
				</div>
				<span class="bs-wizard-dot"></span>
				<div class="bs-wizard-info text-center" style="color: black;">
					<b>validation du panier</b>
				</div>
			</div>

			<div class="col-xs-4 bs-wizard-step complete" style="color: black;">
				<div class="text-center bs-wizard-stepnum">
					<h3 style="padding: 0; margin: -2px;">2</h3>
				</div>
				<div class="progress">
					<div class="progress-bar"></div>
				</div>
				<span class="bs-wizard-dot"></span>
				<div class="bs-wizard-info text-center" style="color: black;">
					<b>infornations de livraison</b>
				</div>
			</div>

			<div class="col-xs-4 bs-wizard-step complete" style="color: black;">
				<div class="text-center bs-wizard-stepnum">
					<h3 style="padding: 0; margin: -2px;">3</h3>
				</div>
				<div class="progress">
					<div class="progress-bar"></div>
				</div>
				<span class="bs-wizard-dot"></span>
				<div class="bs-wizard-info text-center" style="color: black;">
					<b>success</b>
				</div>
			</div>

		</div>
	</div>
	
	<div class="container">
		<br>
		<div class="alert alert-success" style="text-align: center;margin:10px;">
			Félicitation, votre Commande a ete valider. votre commande sera delivre le ${commande.dateLivraison }.<br>
			un e-mail contenant les details de la commade vous a été envoyé!
			<br> <a href="<%=request.getContextPath()%>/profile/">votre Profile. </a>
		</div>
	</div>
</body>
</html>
