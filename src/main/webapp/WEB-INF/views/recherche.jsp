<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype HTML>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE = edge">
<meta name="viewport" content="width = device-width, initial-scale = 1">
<title>Produits</title>
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
.categorie li {
	margin-right: 6%;
	margin-bottom: 4%;
	width: 15%;
	text-align: center;
	display: inline-block;
}
</style>
</head>
<body>
	<!-- LOGO -->
	<header style="background-color: #9ACD32;">
		<div class="container">
			<a href="accueil.html"><img
				src="<%=request.getContextPath()%>/resources/img/logo.png"
				width="125" height="175"></a>
			<c:if test="${not empty client }">
				<div style="float: right; color: #da4a4a">
					Bienvenu <b>${client.nom } ${client.prenom }</b> | <a
						href="test/j_spring_security_logout">deconnexion</a>
				</div>
			</c:if>
		</div>
	</header>
	<hr style="margin: 0;" class="hidden-xs"/>
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
					style="background-color: #428bca; text-shadow: 1px 1px 1px #666; padding: 3px; padding-left: 12px; margin-bottom: 0;">
					<h3>Menu Principale</h3>
				</div>
				<div class="container">
					<nav class="nav-sidebar center-block" style="padding-top: 0;">
						<ul class="nav">
							<li class=""><a href="<%=request.getContextPath()%>/"><span
									class="glyphicon glyphicon-home" style="margin-right:7px;"></span> Accueil</a></li>
							<li><a href="<%=request.getContextPath()%>/"><span
									class="glyphicon glyphicon-send" style="margin-right:7px;"></span> Nous
									contacter</a></li>
							<li><a href="<%=request.getContextPath()%>/profile"><span
									class="glyphicon glyphicon-user" style="margin-right:7px;"></span> Espace Client</a></li>
							<li><a href="<%=request.getContextPath()%>/home/panier"><span
									class="glyphicon glyphicon-shopping-cart" style="margin-right:7px;"></span>
									Panier <span class="badge">${panier.items }</span></a></li>
						</ul>
					</nav>
				</div>
			</div>
			<!-- FIN MENU XS -->

			<hgroup class="mb20 visible-lg visible-md">
				<h1>
					Resultats de Recherche pour "${cle }" dans <b>${categorie }</b>
				</h1>
				<h2 class="lead">
					Page ${pageCourente } sur ${nbreDePages }; <strong
						class="text-danger">${nbreDeProduits }</strong> resultats trouvés.
				</h2>
			</hgroup>
			<hgroup class="mb20 visible-sm">
				<h1>
					Resultats de Recherche pour "${cle }" dans <b>${categorie }</b>
				</h1>
				<h2 class="lead">
					<strong class="text-danger">${nbreDeProduits }</strong> resultats
					trouvés.
				</h2>
			</hgroup>
			<hgroup class="mb20 visible-xs">
				<h3>
					Resultats de Recherche pour "${cle }" dans <b>${categorie }</b>
				</h3>
				<h4 class="lead">
					<strong class="text-danger">${nbreDeProduits }</strong> resultats
					trouvés.
				</h4>
			</hgroup>

			<!-- First Featurette -->
			<div class="row">
				<!-- RECHERCHE AVANCEE -->
				<div class="panel panel-info col-md-4 container hidden-sm hidden-xs"
					style="padding: 0;">
					<div class="panel-heading">
						<h3 class="panel-title">Recherche Avancée</h3>
					</div>
					<div class="panel-body">
						<form class="form form-horizontal">
							<label for="categorie">Categorie</label> <select
								class="form-control" name="categorie" id="categorie">
								<c:forEach var="cat" items="${categories }">
									<option value="${cat.libelle }"
										${cat.libelle == categorie ? '"SELECTED"' : '' }>${cat.libelle }</option>
								</c:forEach>
							</select> <label for="cle">Nom</label> <input type="text" name="cle"
								class="form-control" id="cle"> <label for="max">Prix
								Max.</label> <input type="text" name="max" id="max" class="form-control">
							<label for="min">Prix Min.</label> <input type="text" name="min"
								class="form-control" id="min"> <label for="dispo"><input
								type="checkbox" name="dispo" id="dispo"> Disponible.</label>
					</div>
					<div class="panel-footer info">
						<input type="submit" value="Lancer" class="btn btn-primary">
						</form>
					</div>
				</div>

				<div class="visible-xs visible-sm">
					<form class="form">
						<label for="categorie">Categorie</label> <select
							class="form-control" name="categorie" id="categorie">
							<c:forEach var="cat" items="${categories }">
								<option value="${cat.libelle }"
									${cat.libelle == categorie ? '"SELECTED"' : '' }>${cat.libelle }</option>
							</c:forEach>
						</select> <label for="nom">Nom</label> <input type="text" name="nom"
							class="form-control" id="nom"> <label for="max">Prix
							Max.</label> <input type="text" name="max" id="max" class="form-control">
						<label for="min">Prix Min.</label> <input type="text" name="min"
							class="form-control" id="min"> <label for="dispo"><input
							type="checkbox" name="dispo" id="dispo"> Disponible.</label> <input
							type="submit" value="Lancer" class="btn btn-primary">
					</form>
				</div>

				<div class="col-xs-12 col-sm-10 col-md-7 col-lg-7 ">
					<c:forEach var="produit" items="${produits }">
						<!------------------start---------------->
						<div class="well">
							<div class="media">
								<a class="pull-left" href="#"> <img class=" img-responsive"
									height="95" width="95"
									src="<%=request.getContextPath()%>/resources/img/${produit.image }">
								</a>
								<div class="media-body">
									<h4 class="media-heading">${produit.libelle }</h4>
									<p class="text-right"></p>
									<p>${produit.description }</p>
									<h3 class="hidden-xs">
										<label>15000 MRO.</label>
									</h3>
									<h4 class="visible-xs">
										<label>${produit.prix } MRO.</label>
									</h4>
									<div class="col-md-offset-2">
										<div class="col-md-6">
											<a class="btn btn-primary btn-product"><span
												class="glyphicon glyphicon-question-sign"></span> Details</a>
										</div>
										<div class="col-md-6">
											<a href="" class="btn btn-success btn-product"><span
												class="glyphicon glyphicon-shopping-cart"></span> Panier</a>
										</div>
									</div>
								</div>

							</div>
						</div>
						<!---------end----------------------------------->
					</c:forEach>
				</div>
			</div>
			<!-- PAGES -->
			<div class="row"
				style="background-color: #2a2f2a; text-align: center; border-radius: 6px; padding: 3px; width: 98%">
				<c:if test="${pageCourente != 1}">
					<a class="btn btn-default"
						href="<%=request.getContextPath()%>/home/recherche?categorie=${categorie }&cle=${cle }&page=${pageCourente - 1}">
						<span class="glyphicon glyphicon-chevron-left"></span>
					</a>
				</c:if>
				<c:forEach begin="1" end="${nbreDePages}" var="i">
					<c:choose>
						<c:when test="${pageCourente eq i}">
							<button class="btn btn-default active">${i}</button>
						</c:when>
						<c:otherwise>
							<a class="btn btn-default"
								href="<%=request.getContextPath()%>/home/recherche?categorie=${categorie }&cle=${cle }&page=${i}">${i}</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${pageCourente lt nbreDePages}">
					<a class="btn btn-default"
						href="<%=request.getContextPath()%>/home/recherche?categorie=${categorie }&cle=${cle }&page=${pageCourente + 1}">
						<span class="glyphicon glyphicon-chevron-right"></span>
					</a>
				</c:if>
			</div>
		</div>
		<!-- FOOTER -->
		<hr style="margin-bottom: 0px; background-color: black">
		<footer style="background-color: #9ACD32; min-height: 50px;">
			<div style="text-align: center; padding-top: 15px; color: black;">
				Copyright &copy; <em>MauriTech</em> 2016.
			</div>
		</footer>
	</div>
</body>
</html>