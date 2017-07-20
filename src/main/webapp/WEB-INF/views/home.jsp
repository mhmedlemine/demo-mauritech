<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%
	  response.setHeader("Cache-Control","no-cache");
	  response.setHeader("Cache-Control","no-store");
	  response.setHeader("Pragma","no-cache");
	  response.setDateHeader ("Expires", 0);	
	%>
<!doctype HTML>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE = edge">
<meta name="viewport" content="width = device-width, initial-scale = 1">
<title>Mauritech</title>
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
@media screen and (min-width: 980px) {
	.categorie a {
		font-size: 2em;
	}
}

@media screen and (max-width: 640px) {
	.categorie a {
		font-size: 1.4em;
	}
}

.categorie li {
	font-size: 25px;
	margin-right: 6%;
	margin-bottom: 4%;
	width: 25%;
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
						href="<%=request.getContextPath()%>/j_spring_security_logout">deconnexion</a>
				</div>
			</c:if>
			<div class="container">
				<!-- MENU -->
				<div class="row hidden-xs" style="margin-bottom:70px;margin-top:-70px;">
					<div class="hidden-sm hidden-xs col-md-2 col-md-offset-3">
						<a href="<%=request.getContextPath()%>/contact"><img
							class="img-responsive"
							src="<%=request.getContextPath()%>/resources/img/comment.png"
							width="100" height="100"><br> Nous contacter</a>
					</div>
					<div class="visible-sm hidden-xs col-sm-3 col-sm-offset-2">
						<a href="<%=request.getContextPath()%>/home/contact"><img
							class="img-responsive"
							src="<%=request.getContextPath()%>/resources/img/comment.png" width="55" height="55" ><br> Nous contacter</a>
					</div>

					<div class="hidden-sm hidden-xs col-md-2">
						<a href="<%=request.getContextPath()%>/profile"><img
							src="<%=request.getContextPath()%>/resources/img/client.png"
							class="img-responsive" width="100" height="100" class=""><br>
							Espace Client</a>
					</div>
					<div class="visible-sm hidden-xs col-sm-3">
						<a href="<%=request.getContextPath()%>/profile"><img
							src="<%=request.getContextPath()%>/resources/img/client.png"
							class="img-responsive" width="55" height="55" class=""><br>
							Espace Client</a>
					</div>

					<div class="hidden-sm hidden-xs col-md-2">
						<a href="<%=request.getContextPath()%>/home/panier"><img
							src="<%=request.getContextPath()%>/resources/img/panier.png"
							class="img-responsive" width="100" height="100" class=""><br>
							Panier <span class="badge">${panier.items }</span></a>
					</div>
					<div class="visible-sm hidden-xs col-sm-3">
						<a href="<%=request.getContextPath()%>/home/panier"><img
							src="<%=request.getContextPath()%>/resources/img/panier.png"
							class="img-responsive" width="55" height="55" class=""><br>
							Panier <span class="badge">${panier.items }</span></a>
					</div>
				</div>
				<!-- FIN MENU -->
			</div>
			<!-- MENU XS -->
			<div class="visible-xs row">
				<div
					style="background-color: #428bca; text-shadow: 1px 1px 1px #666; padding: 3px; padding-left: 20px; margin-bottom: 0;">
					<h3>Menu Principale</h3>
				</div>
				<div class="container" style="padding: 3px; padding-left: 20px;">
					<nav class="nav-sidebar center-block"
						style="padding-top: 0; border: 0; margin-bottom: 40px;font-color:white;">
						<ul class="nav">
							<li class=""><a href="<%=request.getContextPath()%>/"><span
									class="glyphicon glyphicon-home" style="margin-right: 7px;"></span>
									Accueil</a></li>
							<li><a href="<%=request.getContextPath()%>/home/contact"><span
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
		</div>
	</header>
	<hr style="margin: 0;" class="hidden-xs" />
	<div
		style="background: url('<%=request.getContextPath()%>/resources/img/bg.jpg');">
		<!-- CAROUSEL  -->
		<div class="carousel fade-carousel slide" data-ride="carousel"
			data-interval="4000" id="bs-carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#bs-carousel" data-slide-to="0" class="active"></li>
				<li data-target="#bs-carousel" data-slide-to="1"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner">
				<div class="item slides active">
					<div class="slide-1"
						style="background-image: url('<%=request.getContextPath()%>/resources/img/portables.png');">
						<!-- Overlay -->
						<div class="overlay"></div>
					</div>
					<div class="hero">
						<hgroup>
							<h1>Apple Mac book air</h1>
							<h3>Réductions jusqu'a 40%</h3>
							<span style="text-decoration: line-through;" class="text-danger">250000
								MRO.</span>
							<br>
							<span style="text-decoration:;" class="text-info">150000
								MRO.</span>
						</hgroup>
						<a href="<%=request.getContextPath()%>/home/details?produit=1" class="btn btn-hero btn-lg">Voir Détails</a>
					</div>
				</div>
				<div class="item slides">
					<div class="slide-2"
						style="background-image: url('<%=request.getContextPath()%>/resources/img/smartphones.png')">
						<!-- Overlay -->
						<div class="overlay"></div>
					</div>
					<div class="hero">
						<hgroup>
							<h1>Xperia Z</h1>
							<h3>Réductions jusqu'a 40%</h3>
							<span style="text-decoration: line-through;" class="text-danger">190000
								MRO.</span>
							<br>
							<span style="text-decoration:;" class="text-info">130000
								MRO.</span>
						</hgroup>
						<a href="<%=request.getContextPath()%>/home/details?produit=2" class="btn btn-hero btn-lg">Voir Détails</a>
					</div>
				</div>
			</div>
		</div>
		<!-- ./CAROUSEL  -->

		<div class="container">
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
			<!-- BANNER -->
			<div class="row">
				<div>
					<a class="col-xs-offset-1 img-responsive" href="#"><img
						src="<%=request.getContextPath()%>/resources/img/banner.jpg"
						width="90%" height="110"></a>
				</div>
			</div>
			<!-- ./BANNER -->
			<!-- LISTE DE CATEGORIES -->
			<div class="categorie">
				<h2>Liste de Categorie</h2>
				<c:forEach var="categorie" items="${categories }">
					<a href="<%=request.getContextPath()%>/home/produits?categorie=${categorie.libelle }" class="col-sm-6 col-md-4"> ${categorie.libelle }</a>
				</c:forEach>
			</div>
			<!-- ./LISTE DE CATEGORIES -->

		</div>
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