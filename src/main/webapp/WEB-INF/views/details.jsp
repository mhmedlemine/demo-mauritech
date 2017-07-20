<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
					style="background-color: #428bca; text-shadow: 1px 1px 1px #666; padding: 3px; padding-left: 20px; margin-bottom: 0;">
					<h3>Menu Principale</h3>
				</div>
				<div class="container" style="padding: 3px; padding-left: 20px;">
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
			
			<!-- PRODUIT -->
			<div class="container-fluid" style="border-top-left-radius: 10px;border-top-right-radius: 10px;">
				<div class="content-wrapper" style="padding-top: 40px;padding-bottom: 40px;border-top-left-radius: 10px;border-top-right-radius: 10px;">
					<div style="float: right; margin-right: 35px;" class="hidden-sm hidden-xs">
						<img class="img-responsive" style="max-width:250px;" src="<%=request.getContextPath()%>/resources/img/banner.png"  >
					</div>
					<div class="item-container">
						<div class="container">
							<div class="col-md-8 col-sm-12">
								<div class="product col-md-8 col-sm-6 service-image-center">
									<img id="item-display" class="img-responsive" style="margin: auto;"
										src="<%=request.getContextPath()%>/resources/img/${produit.image }"
										alt="image"></img>
								</div>

							</div>

							<div class="col-md-7">
								<div class="product-title">
									<b>${produit.libelle }</b>
								</div>
								<div class="product-desc">
									<h4 class="text-warning">Description :</h4>
									${produit.description }
								</div>
								<div class="product-rating">
									<i class="fa fa-star gold"></i> <i class="fa fa-star gold"></i>
									<i class="fa fa-star gold"></i> <i class="fa fa-star gold"></i>
									<i class="fa fa-star-o"></i>
								</div>
								<hr>
								<div class="product-price">${produit.prix }MRO.</div>
								<c:if test="${produit.quantiteDispo > 0}">
									<div class="product-stock">Disponible</div>
								</c:if>
								<c:if test="${produit.quantiteDispo <= 0}">
									<div class="product-stock">
										<span class="text-danger">Indisponible</span>
									</div>
								</c:if>
								<hr>
								<c:if test="${produit.quantiteDispo > 0}">
									<div class="btn-group cart">
										<form class="form form-inline"
											action="<%=request.getContextPath()%>/home/panieradd">
											<span class="text-info">Quantité :</span> <select
												class="form-control" name="quantite">
												<c:forEach var="i" begin="1" end="${produit.quantiteDispo }">
													<option value="${i}" ${i==1 ? '"SELECTED"' : '' }>${i}</option>
												</c:forEach>
											</select> <input type="hidden" value="${produit.idProduit}"
												name="produit">

											<button type="submit" style="margin:4px;" class="btn btn-success">
												Ajouter au Panier</button>
										</form>
									</div>
								</c:if>
								<div class="btn-group wishlist">
									<c:if test="${not empty favoris }">
									<a href="<%=request.getContextPath()%>/favoris?remove=&produit=${produit.idProduit}" class="btn btn-warning">Supprimer des Favoris</a>
									</c:if>
									<c:if test="${empty favoris }">
									<a href="<%=request.getContextPath()%>/favoris?add=&produit=${produit.idProduit}" class="btn btn-warning">Ajouter
										aux favoris</a>
									</c:if>
								</div>
							</div>
						</div>
					</div>
					<!-- DESRIPTION -->
					<!-- <div class="container-fluid" style="padding-bottom: 40px;">
						<div class="col-md-12 product-info">
							<ul id="myTab" class="nav nav-tabs nav_tabs">

								<li class="active"><a href="#service-one" data-toggle="tab">DESCRIPTION</a></li>

							</ul>
							<div id="myTabContent" class="tab-content">
								<div class="tab-pane fade in active" id="service-one">

									<section class="container product-info">
										The Corsair Gaming Series GS600 power supply is the ideal
										price-performance solution for building or upgrading a Gaming
										PC. A single +12V rail provides up to 48A of reliable,
										continuous power for multi-core gaming PCs with multiple
										graphics cards. The ultra-quiet, dual ball-bearing fan
										automatically adjusts its speed according to temperature, so
										it will never intrude on your music and games. Blue LEDs bathe
										the transparent fan blades in a cool glow. Not feeling blue?
										You can turn off the lighting with the press of a button.

										<h3>Corsair Gaming Series GS600 Features:</h3>
										<ul>
											<li>It supports the latest ATX12V v2.3 standard and is
												backward compatible with ATX12V 2.2 and ATX12V 2.01 systems</li>
											<li>An ultra-quiet 140mm double ball-bearing fan
												delivers great airflow at an very low noise level by varying
												fan speed in response to temperature</li>
											<li>80Plus certified to deliver 80% efficiency or higher
												at normal load conditions (20% to 100% load)</li>
											<li>0.99 Active Power Factor Correction provides clean
												and reliable power</li>
											<li>Universal AC input from 90~264V — no more hassle of
												flipping that tiny red switch to select the voltage input!</li>
											<li>Extra long fully-sleeved cables support full tower
												chassis</li>
											<li>A three year warranty and lifetime access to
												Corsair’s legendary technical support and customer service</li>
											<li>Over Current/Voltage/Power Protection, Under Voltage
												Protection and Short Circuit Protection provide complete
												component safety</li>
											<li>Dimensions: 150mm(W) x 86mm(H) x 160mm(L)</li>
											<li>MTBF: 100,000 hours</li>
											<li>Safety Approvals: UL, CUL, CE, CB, FCC Class B, TÜV,
												CCC, C-tick</li>
										</ul>
									</section>

								</div>
							</div>
						</div>
					</div> <!-- ./DESRIPTION -->
				</div>
			</div> <!-- ./PRODUIT -->

		</div> <!-- ./CONTAINER -->
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