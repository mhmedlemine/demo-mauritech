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
						href="<%=request.getContextPath()%>/j_spring_security_logout">deconnexion</a>
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
					style="background-color: #428bca; text-shadow: 1px 1px 1px #666; padding: 3px; margin-left: 12px; padding-left: 12px; margin-bottom: 0;">
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
			
			<!-- RECHERCHE -->
			<div class="row" style="margin-top: 2%">
				<form action="<%=request.getContextPath()%>/home/recherche" method="GET">
					<div class="col-sm-offset-2 col-sm-8">
						<div class="input-group">
							<div class="input-group-btn search-panel">
								<a class="btn btn-default btn-select btn-select-light"> <input
									type="hidden" class="btn-select-input" id="categorie"
									name="categorie" value="Tous" /> <span class="btn-select-value">Categories</span>
									<span class="btn-select-arrow glyphicon glyphicon-chevron-down"></span>
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
			<!-- MENU CATEGORIE -->
			<div class="row">
				<div class="col-md-2 col-sm-12" style="margin-right: 7%;border:none;">
					<nav class="nav-sidebar" style="border:none;">
						<h3>Categories</h3>
						<ul class="nav">
							<c:forEach var="cat" items="${categories }">
								<li class="${cat.libelle == categorie ? 'active' : '' }"><a
									href="<%=request.getContextPath()%>/home/produits?categorie=${cat.libelle }">${cat.libelle }</a></li>
							</c:forEach>
						</ul>
					</nav>
				</div>
				<!-- LISTE DE Produits -->
				<div class="container">
				<div class="" style="margin:10px;">
					<h2 style="margin:10px;">${categorie }</h2>
					<div class="row">
						<div class="col-md-9">
							<c:forEach var="produit" items="${produits }" varStatus="i">
								<div class="col-sm-6 col-md-4">
									<div class="thumbnail"
										style="background-color: #cab391; box-shadow: 1px 1px 1px 1px black;">
										<c:if test="${not empty favoris[i.index] }">
											<h4 class="text-center" style="margin-top: 0;">
												<a href="<%=request.getContextPath()%>/favoris?remove=&produit=${produit.idProduit }" title="supprimer de mes favoris"><span
													class="glyphicon glyphicon-star text-warning"></span></a>
											</h4>
										</c:if>
										<c:if test="${empty favoris[i.index] }">
											<h4 class="text-center" style="margin-top: 0;">
												<a href="<%=request.getContextPath()%>/favoris?add=&produit=${produit.idProduit }" class="" title="ajouter mes favoris"><span
													class="glyphicon glyphicon-star-empty text-warning"></span></a>
											</h4>
										</c:if>
											<img
												src="<%=request.getContextPath()%>/resources/img/${produit.image }"
												class="img-responsive" >
										<div class="caption">
											<div class="row">
												<div class="col-md-6 col-xs-6">
													<h3>
														<a href="<%=request.getContextPath()%>/home/details?produit=${produit.idProduit }" style="text-decoration:none">
															${produit.libelle }
														</a>
													</h3>
												</div>
												<div class="col-md-6 col-xs-6 price">
													<h3>
														<label>${produit.prix } MRO.</label>
													</h3>
												</div>
											</div>
											<p>${produit.description }</p>
											<div class="row">
												<div class="col-md-6">
													<a
														href="<%=request.getContextPath()%>/home/details?produit=${produit.idProduit }"
														class="btn btn-primary btn-product"><span
														class="glyphicon glyphicon-question-sign"></span> Details</a>
												</div>
												<c:if test="${produit.quantiteDispo <= 0 }">
													<div class="col-md-6">
														<span class="text-danger">Indisponible</span>
													</div>
												</c:if>
												<c:if test="${produit.quantiteDispo > 0 }">
													<div class="col-md-6">
														<form
															action="<%=request.getContextPath()%>/home/panieradd">
															<input type="hidden" name="quantite" value="1"> <input
																type="hidden" value="${produit.idProduit}"
																name="produit">
															<button type="submit" class="btn btn-success btn-product">
																<span class="glyphicon glyphicon-shopping-cart"></span>
																Panier
															</button>
														</form>
													</div>
												</c:if>
											</div>
											<p></p>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
				</div>
			</div>
			<!-- PAGES -->
			<div class="row"
				style="background-color: #2a2f2a; text-align: center; border-radius: 6px; padding: 3px; width: 98%; margin:5px;">
				<c:if test="${pageCourente != 1}">
					<a class="btn btn-default"
						href="<%=request.getContextPath()%>/home/produits?categorie=${categorie }&page=${pageCourente - 1}">
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
								href="<%=request.getContextPath()%>/home/produits?categorie=${categorie }&page=${i}">${i}</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${pageCourente lt nbreDePages}">
					<a class="btn btn-default"
						href="<%=request.getContextPath()%>/home/produits?categorie=${categorie }&page=${pageCourente + 1}">
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
	<!-- BizChatId -->
<script type="text/javascript" >var BizChatId="641809c2"; var WidgetId="c9da6017";</script> <script src="https://dashboard.bizchatbox.com/Content/js/BizChat.js" type="text/javascript"></script></body>
</html>