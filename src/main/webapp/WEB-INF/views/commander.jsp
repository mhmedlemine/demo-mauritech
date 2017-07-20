<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype HTML>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE = edge">
<meta name="viewport" content="width = device-width, initial-scale = 1">
<title>Passer une commande</title>
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
	<div style="width: 100%; border: 1px solid #C7A138; padding-top: 45px;padding-bottom: 45px; background: #ADA692;">
		<div class="row bs-wizard" style="border-bottom: 0;width: 100%;">
	
			<div class="col-xs-4 bs-wizard-step active" style="color: black;">
				<div class="text-center bs-wizard-stepnum"><h3 style="padding:0;margin:-2px;">1</h3></div>
				<div class="progress">
					<div class="progress-bar"></div>
				</div>
				<span class="bs-wizard-dot"></span>
				<div class="bs-wizard-info text-center" style="color: black;"><b>validation du panier</b></div>
			</div>
	
			<div class="col-xs-4 bs-wizard-step disabled" style="color: black;">
				<div class="text-center bs-wizard-stepnum"><h3 style="padding:0;margin:-2px;">2</h3></div>
				<div class="progress">
					<div class="progress-bar"></div>
				</div>
				<span class="bs-wizard-dot"></span>
				<div class="bs-wizard-info text-center" style="color: black;"><b>infornations de
					livraison</b></div>
			</div>
	
			<div class="col-xs-4 bs-wizard-step disabled" style="color: black;">
				<div class="text-center bs-wizard-stepnum"><h3 style="padding:0;margin:-2px;">3</h3></div>
				<div class="progress">
					<div class="progress-bar"></div>
				</div>
				<span class="bs-wizard-dot"></span>
				<div class="bs-wizard-info text-center" style="color: black;"><b>success</b></div>
			</div>
			
		</div>
		<a href="commander/2" class="btn btn-default pull-right" style="margin-right:10px;">valider -></a>
	</div>
	
	<div class="container">
		<div class="row" style="margin-bottom:10px;">
			<h2>Liste des produits commandes:</h2>
			<c:forEach items="${lignes }" var="ligne">
				<div class="col-md-8 col-sm-10 col-xs-10 col-xs-offset-1"
					style="border: 1px solid #C7A138; padding: 15px; border-radius: 4px;margin-bottom:20px;">
					<img alt="produit" width="105" height="95" 
						src="<%=request.getContextPath()%>/resources/img/${ligne.produit.image}">
					<b><font size="5pt"><a href="<%=request.getContextPath()%>/home/details?produit=${ligne.produit.idProduit}" style="text-decoration: none;">${ligne.produit.libelle}</a></font></b>
					<div class="row">
						<form action="<%=request.getContextPath()%>/calculer" class="form form-inline">
							<div class="form-group col-md-3">
								<label>Quantite :</label> <select class="form-control" name="quantite">
								<c:forEach var="i" begin="1" end="${ligne.produit.quantite }">
									<option ${i == ligne.quantite ? 'selected="selected"' : ''}>${i}</option>
								</c:forEach>
								</select> <input type="hidden" value="${ligne.produit.idProduit}"
									name="produit">
							</div>
							
							<button type="submit" class="col-md-offset-0 col-md-2 col-xs-offset-1 col-xs-10 btn btn-success" >modifer</button>
						</form>
						<a style="margin-top:5px;" href="<%=request.getContextPath()%>/supp?produit=${ligne.produit.idProduit}" class="btn btn-danger col-md-2 col-xs-offset-1 col-xs-10 col-md-offset-9">Supprimer</a>
					</div>
				</div>
			</c:forEach>
		</div>
		<a href="commander/2" class="btn btn-default pull-right" style="margin-right:10px;margin-bottom:40px;">valider -></a>
	</div>
</body>
</html>