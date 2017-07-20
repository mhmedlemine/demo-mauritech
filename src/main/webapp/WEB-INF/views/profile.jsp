<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype HTML>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE = edge">
<meta name="viewport" content="width = device-width, initial-scale = 1">
<title>Profile</title>
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
<script type="text/javascript">
$(document).ready(function() {
	$('#dateLivraison').datepicker({
		startDate : "+1d",
		endDate : "+1m",
		format : "yyyy/mm/dd",
		language : "fr"
	});

});
</script>
<style type="text/css">
tbody>tr {
	cursor: pointer;
}

.result {
	margin-top: 20px;
}
</style>
</head>
<body>
	<%
	  response.setHeader("Cache-Control","no-cache");
	  response.setHeader("Cache-Control","no-store");
	  response.setHeader("Pragma","no-cache");
	  response.setDateHeader ("Expires", 0);	
	%>
	<c:if test="${empty client }">
		<c:redirect url="/login"/>
	</c:if>
	<!-- LOGO -->
	<header style="background-color: #9ACD32;">
		<div class="container">
			<a href="<%=request.getContextPath()%>/"><img
				src="<%=request.getContextPath()%>/resources/img/logo.png"
				width="125" height="175"></a>
			<c:if test="${not empty client }">
				<div style="float: right; margin-top:4px;">
					Bienvenu <b>${client.nom } ${client.prenom }</b> | <a
						href="<%=request.getContextPath()%>/j_spring_security_logout">deconnexion</a>
				</div>
			</c:if>
		</div>
	</header>
	<hr style="margin: 0;" class="hidden-xs" />
	<div
		style="background: url('<%=request.getContextPath()%>/resources/img/bg.jpg');">
		<div class="container">
			<!-- MENU -->
			<div class="row hidden-xs" style="margin-top: 3%;">
				<div class="hidden-sm hidden-xs col-md-2 col-md-offset-3">
					<a href="<%=request.getContextPath()%>/"><img
						class="img-responsive"
						src="<%=request.getContextPath()%>/resources/img/comment.png"
						width="65" height="65"><br> Nous contacter</a>
				</div>
				<div class="visible-sm hidden-xs col-sm-3 col-sm-offset-2">
					<a href="<%=request.getContextPath()%>/"><img
						class="img-responsive"
						src="<%=request.getContextPath()%>/resources/img/comment.png"
						width="45" height="45"><br> Nous contacter</a>
				</div>

				<div class="hidden-sm hidden-xs col-md-2">
					<a href="<%=request.getContextPath()%>/profile"><img
						src="<%=request.getContextPath()%>/resources/img/client.png"
						class="img-responsive" width="65" height="65" class=""><br>
						Espace Client</a>
				</div>
				<div class="visible-sm hidden-xs col-sm-3">
					<a href="<%=request.getContextPath()%>/profile"><img
						src="<%=request.getContextPath()%>/resources/img/client.png"
						class="img-responsive" width="45" height="45" class=""><br>
						Espace Client</a>
				</div>

				<div class="hidden-sm hidden-xs col-md-2">
					<a href="<%=request.getContextPath()%>/home/panier"><img
						src="<%=request.getContextPath()%>/resources/img/panier.png"
						class="img-responsive" width="65" height="65" class=""><br>
						Panier <span class="badge">${panier.items }</span></a>
				</div>
				<div class="visible-sm hidden-xs col-sm-3">
					<a href="<%=request.getContextPath()%>/home/panier"><img
						src="<%=request.getContextPath()%>/resources/img/panier.png"
						class="img-responsive" width="45" height="45" class=""><br>
						Panier <span class="badge">${panier.items }</span></a>
				</div>
			</div>
			<!-- FIN MENU -->
			<!-- MENU XS -->
			<div class="visible-xs row">
				<div
					style="background-color: #428bca; text-shadow: 1px 1px 1px #666; padding: 3px; padding-left: 12px; margin-left: 12px; margin-bottom: 0;">
					<h3>Menu Principale</h3>
				</div>
				<div class="container">
					<nav class="nav-sidebar center-block" style="padding-top: 0;">
						<ul class="nav">
							<li class=""><a href="<%=request.getContextPath()%>/"><span
									class="glyphicon glyphicon-home" style="margin-right: 7px;"></span>
									Accueil</a></li>
							<li><a href="<%=request.getContextPath()%>/"><span
									class="glyphicon glyphicon-send" style="margin-right: 7px;"></span>
									Nous contacter</a></li>
							<li><a href="<%=request.getContextPath()%>/profile"><span
									class="glyphicon glyphicon-user" style="margin-right: 7px;"></span>
									Espace Client</a></li>
							<li><a href="<%=request.getContextPath()%>/home/panier"><span
									class="glyphicon glyphicon-shopping-cart"
									style="margin-right: 7px;"></span> Panier <span class="badge">${panier.items }</span></a></li>
						</ul>
					</nav>
				</div>
			</div>
			<!-- FIN MENU XS -->

			<!-- RECHERCHE -->
			<div class="row" style="margin-top: 2%">
				<form action="<%=request.getContextPath()%>/home/recherche"
					method="GET">
					<div class="col-sm-offset-2 col-sm-8">
						<div class="input-group">
							<div class="input-group-btn search-panel">
								<a class="btn btn-default btn-select btn-select-light"> <input
									type="hidden" class="btn-select-input" id="categorie"
									name="categorie" value="Tous" /> <span
									class="btn-select-value">Categories</span> <span
									class="btn-select-arrow glyphicon glyphicon-chevron-down"></span>
									<ul>
										<li>Tous</li>
										<c:forEach var="categorie" items="${categories }">
											<li>${categorie.libelle }</li>
										</c:forEach>
									</ul>
								</a>
							</div>
							<div class="input-group col-sm-12">

								<input type="text" class="form-control" name="cle"
									placeholder="Mot cle..."> <span class="input-group-btn">
									<button type="submit" class="btn btn-default" type="button">
										<span class="glyphicon glyphicon-search"></span>
									</button>
								</span>
							</div>
						</div>
					</div>
				</form>
			</div>
			<!-- Controls -->
			<div style="margin-left:10px; margin-right:10px;" class="row col-lg-10 col-lg-offset-1">
				<div class="panel center-block"
					style="padding-left: 8px; padding-right: 8px;">
					<div class="panel-hading">
						<h3 class="">${client.nom } ${client.prenom}</h3>
						<div class="col-md-12  toppad">
							<p class="text-info" style="margin-top: 7px;">${time }, ${date }</p>
							<a href="<%=request.getContextPath()%>/j_spring_security_logout" class="">Deconnexion</a> <br>
						</div>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-md-4 col-lg-3 col-sm-3 hidden-xs" align="center">
								<img alt="client" src="<%=request.getContextPath()%>/resources/img/clients/${client.photo}"
									class="img-circle img-responsive">
							</div>
							<div class="visible-xs" align="center">
								<img width="95" height="95" alt="User Pic" src="<%=request.getContextPath()%>/resources/img/clients/${client.photo}"
									class="img-circle img-responsive">
							</div>
							<br> <a href="<%=request.getContextPath()%>/profile/edit" class="btn btn-primary hidden-xs"
								style="margin-top: 4px; margin-bottom: 4px;">Modifer le
								compte</a> <a href="#adresses" class="btn btn-primary hidden-xs">Gerer
								les adresses</a> <a href="#favoris"
								class="btn btn-primary hidden-xs">Favoris</a> <a href="#"
								class="btn btn-primary visible-xs col-xs-12"
								style="margin-top: 4px; margin-bottom: 4px;">Modifer le
								compte</a> <a href="#adresses"
								class="btn btn-primary visible-xs col-xs-12"
								style="margin-bottom: 4px;">Gerer les adresses</a> <a
								href="#favoris" class="btn btn-primary visible-xs col-xs-12">Favoris</a>
						</div>
					</div>

				</div>
				<div class="pull-right">
					<img src="<%=request.getContextPath()%>/resources/img/banner.png" class="hidden-xs" width="45%"
						height="300"> <img src="<%=request.getContextPath()%>/resources/img/banner.png"
						class="visible-xs col-xs-10 col-xs-offset-1" height="250"> <img
						src="<%=request.getContextPath()%>/resources/img/banner.png" class="hidden-xs" width="45%" height="300">
				</div>
			</div>

			<div style="margin-left:1px; margin-right:1px; margin-top:20px;" class="row col-lg-12">
			<div class="panel center-block" style="background-color:#E6F2E1;">
				<div class="panel-hading">
					
				</div>
				<div class="panel-body">
				<!-- Commandes en attente -->
				<h3 class="pull-left">Commandes en attente</h3>
				<c:if test="${empty commandes }">
					<div class="well col-xs-12">
						<span>Pas de commandes en attente.</span>
					</div>
				</c:if>	
				<c:if test="${not empty commandes }">
					<table class="table table-responsive table-hover table-condensed">
						<thead>
							<tr>
								<th>Commande</th>
								<th>Livraison</th>
								<th class="hidden-xs">Adresse</th>
								<th>Total</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${commandes }" var="commande" varStatus="i">
								<tr onclick="void (open('<%=request.getContextPath()%>/facture?commande=${commande.idCommande }', '_self',''));">
									<td id="idCommande">${commande.idCommande }</td>
									<td>${commande.dateLivraison }</td>
									<td class="hidden-xs">${commande.adresse }</td>
									<td>${commande.sommeTotal }</td>
									<c:if test="${livree[i.index] == true and confirmee[i.index] == false }">
										<td>
											<a href="<%=request.getContextPath()%>/plainte?commande=${commande.idCommande }">Passer une plainte</a>
										</td>
									</c:if>
									<c:if test="${livree[i.index] == false }">
										<td></td>
									</c:if>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</c:if>
				<!-- Adresses -->
				<div class="clearfix">
					<h3 class="pull-left clearfix">Liste des Adresses</h3>
				</div>
				<div class="table-responsive">
					<table class="table table-hover table-condensed" id="adresses">
						<thead>
							<tr>
								<th>Nom</th>
								<th>Prenom</th>
								<th>Telephone</th>
								<th>Ville</th>
								<th class="hidden-xs">Rue</th>
								<th>Defaut</th>
							</tr>
						</thead>
						<tbody>
							<%@include file="include/adresse.html"%>
							<tr onclick="$('#myModal').modal('show');">
								<td>${defAdresse.nom }</td>
								<td>${defAdresse.prenom }</td>
								<td>${defAdresse.telephone }</td>
								<td>${defAdresse.ville }</td>
								<td class="hidden-xs">${defAdresse.rue }</td>
								<td><font color="#439E24"><span class="glyphicon glyphicon-ok success"></span></font></td>
							</tr>
							<c:forEach items="${adresses }" var="adr" varStatus="boucle">
								<%@include file="include/adresse.html"%>
								<tr>
									<td onclick="$('#myModal${boucle.index }').modal('show');">${adr.nom }</td>
									<td onclick="$('#myModal${boucle.index }').modal('show');">${adr.prenom }</td>
									<td onclick="$('#myModal${boucle.index }').modal('show');">${adr.telephone }</td>
									<td onclick="$('#myModal${boucle.index }').modal('show');">${adr.ville }</td>
									<td onclick="$('#myModal${boucle.index }').modal('show');" class="hidden-xs">${adr.rue }</td>
									<td><span onclick="$('#supModal${boucle.index }').modal('show');" class="glyphicon glyphicon-trash"></span></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
	
				<!-- Favoris -->
				<h3 class="pull-left">Liste des Favoris</h3>
				<c:if test="${empty favoris }">
					<div class="well col-xs-12">
						<span>Liste Vide.</span>
					</div>
				</c:if>
				<c:if test="${not empty favoris }">
					<table class="table table-hover" id="favoris">
						<thead>
							<tr>
								<th>Nom</th>
								<th>Categorie</th>
								<th>Prix</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${favoris }" var="fav">
								<tr onclick="void (open('<%=request.getContextPath()%>/home/details?produit=${fav.produit.idProduit }', '_self',''));">
									<td>${fav.produit.libelle }</td>
									<td>${fav.produit.categorie.libelle }</td>
									<td>${fav.produit.prix } MRO.</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</c:if>
				</div>
			</div>
			</div>
		</div>
		<!-- ./container -->
		<!-- FOOTER -->
		<hr style="margin-bottom: 0px; background-color: black">
		<footer style="background-color: #9ACD32; min-height: 50px;">
			<div style="text-align: center; padding-top: 15px; color: black;">
				Copyright &copy; <em>MauriTech</em> 2016.
			</div>
		</footer>
	</div>
	<!-- BizChatId -->
	<script type="text/javascript">
		var BizChatId = "641809c2";
		var WidgetId = "c9da6017";
	</script>
	<script src="https://dashboard.bizchatbox.com/Content/js/BizChat.js"
		type="text/javascript"></script>
</body>
</html>