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
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/bootstrap/css/font-awesome.min.css">
<script
	src="<%=request.getContextPath()%>/resources/bootstrap/js/jquery.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.min.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/bootstrap/js/custom.js"></script>
<style type="text/css">

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
					style="background-color: #428bca; text-shadow: 1px 1px 1px #666; padding: 3px; padding-left: 20px; margin-bottom: 0;">
					<h3>Menu Principale</h3>
				</div>
				<div class="container" style="padding: 3px; padding-left: 20px;">
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
			<p> </p>
			<p></p>
			<h1>Panier</h1>
			<p> </p>

			<c:choose>
				<c:when test="${panier.items == 0 }">
					<div class="well well-sm" style="text-align: center;">
						Votre Panier est vide. <a href="<%=request.getContextPath()%>/">
							Accueil </a>
					</div>
				</c:when>
				<c:otherwise>
					<!-- FIN PANIER -->
					<div class="col-md-10 col-md-offset-1">
						<div class="panel panel-default panel-table">
							<div class="panel-heading">
								<div class="row">
									<div class="col col-xs-6">
										<h3 class="panel-title">Panier</h3>
									</div>
									<div class="col col-xs-6 text-right">
										<button class="btn btn-sm btn-danger col-xs-12 col-md-4 pull-right" data-toggle="modal"
													data-target="#viderModal">vider
											panier</button>
										<div class="col-md-4 pull-right"
											style="height: 3px; width: 0px;"></div>
										<a href="<%=request.getContextPath()%>/commander"
											class="btn btn-sm btn-success col-xs-12 col-md-4 pull-right">commander</a>
									</div>
								</div>
							</div>
							<div class="panel-body">
								<table
									class="table table-striped table-bordered table-responsive table-list">
									<thead>
										<tr>
											<th>Designation</th>
											<th class="hidden-xs">Prix</th>
											<th class="">Quantite</th>
											<th class="hidden-xs">Total</th>

											<th align="center"><em class="fa fa-cog"></em></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="ligne" items="${lignes }" varStatus="boucle">
											<%@include file="include/panier.html"%>
											<tr>
												<td><img width="105" height="95" class="img-responsive"
													src="<%=request.getContextPath()%>/resources/img/${ligne.produit.image }">
													<h4><a href="<%=request.getContextPath()%>/home/details?produit=${ligne.produit.idProduit }">${ligne.produit.libelle }</a></h4>
													${ligne.produit.description }</td>
												<td class="hidden-xs">${ligne.produit.prix }</td>
												<td class="">${ligne.quantite }</td>
												<td class="hidden-xs">${ligne.produit.prix * ligne.quantite }</td>

												<td align="center">
													<button type="button" class="btn btn-default"
														data-toggle="modal"
														data-target="#modModal${boucle.index }">
														<em class="fa fa-pencil"></em>
													</button> <font style="height: 3px" class="hidden-lg col-xs-12"></font>
													<button type="button" class="btn btn-danger"
														data-toggle="modal"
														data-target="#supModal${boucle.index }">
														<em class="fa fa-trash"></em>
													</button>
												</td>
											</tr>
										</c:forEach>
										<tr>
											<td class="hidden-xs"></td>
											<td class="hidden-xs"></td>
											<td align="right"><b>Total :</b></td>
											<td class="hidden-xs"><b>${panier.total } MRO.</b></td>
											<td class="visible-xs"><font
												style="font-weight: bold; font-size: 10px;">${panier.total }MRO.</font></td>
											<td></td>
										</tr>
									</tbody>
								</table>
								<a href="<%=request.getContextPath()%>/" class="col-md-offset-1">Accueil</a>
							</div>
						</div>
					</div>
					<!-- FIN PANIER -->
				</c:otherwise>
			</c:choose>
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

	<!-- Vid PANIER MODAL -->
	<div class="modal fade" id="viderModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">

		<div class="modal-dialog">
			<div class="modal-content">

				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>

					<h4 class="modal-title" id="myModalLabel">Suppression</h4>
				</div>

				<div class="modal-body">Etes vous sure de vouloir vider le panier ?</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Annuler</button>
					<a href="<%=request.getContextPath()%>/home/vider">
						<button type="button" class="btn btn-danger">Supprimer</button>
					</a>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modalConfVid -->
</body>
</html>