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
<title>Facture</title>
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
	
</script>
<style type="text/css">
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-xs-12">
				<div class="invoice-title">
					<div class="row" style="padding-left: 17px; padding-right: 17px;">
						<h3 class="" style="margin-bottom:">
							Commande <span class="text-danger">#${commande.idCommande
								}</span>
						</h3>
						<c:if test="${commande.livre == false}">
							<h5 class="pull-right text-warning" style="margin-bottom: -10px;">
								<c:if test="${commande.enAttente == false }">En attente</c:if>
								<c:if test="${commande.enAttente == true }">En cours</c:if>
							</h5>
						</c:if>
						<c:if test="${commande.livre == true}">
							<h5 class="pull-right text-success" style="margin-bottom: -10px;">
								Livrée
							</h5>
						</c:if>
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-xs-6">
						<address>
							<strong>Adresse de livraison:</strong><br>
							${commande.adresse.nom } ${commande.adresse.prenom }<br>
							${commande.adresse.telephone }<br> ${commande.adresse.ville }<br>
							${commande.adresse.rue }
						</address>
					</div>
					<div class="col-xs-6 text-right">
						<address>
							<strong>Date pévue de livraison:</strong><br>${commande.dateLivraison }<br>
							<br>
						</address>
					</div>
					<div class="col-xs-6 text-right">
						<address>
							<strong>Date de la commande:</strong><br>${commande.dateCommande }<br>
							<br>
						</address>
					</div>

				</div>
				<div class="row"></div>
			</div>
		</div>

		<div class="row">
			<div class="col-md-12">
				<c:if test="${diffHeures <= 24 }">
					<span>Vous avez <b>${24 - diffHeures }</b> heures pour modifier ou annuler cette commande.</span>
				</c:if>
				<c:if test="${diffHeures > 24 }">
					<span class="text-danger">Vous ne pouvez plus modifier ou annuler cette commande.</span>
				</c:if>
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">
							<strong>Produits commandés</strong>
							<c:if test="${diffHeures <= 24 }">
								<button type="button" class="btn btn-danger pull-right"
									style="margin-top: -8px;" data-toggle="modal"
									data-target="#annulerModal">
									<em class="">Annuler</em>
								</button>
							</c:if>
						</h3>
					</div>
					<div class="panel-body">
						<span class="visible-xs text-info" style="padding-left: 5px;">faites
							défiler vers la droite</span>
						<div class="table-responsive">
							<table class="table table-condensed">
								<thead>
									<tr>
										<c:if test="${diffHeures <= 24 }">
										<td class="text-left visible-xs"><strong><span
												class="glyphicon glyphicon-cog"></span></strong></td>
										</c:if>
										<td><strong>Produit</strong></td>
										<td class="text-center"><strong>Prix</strong></td>
										<td class="text-center"><strong>Quantite</strong></td>
										<td class="text-right"><strong>Totals</strong></td>
										<c:if test="${diffHeures <= 24 }">
										<td class="text-right hidden-xs"><strong><span
												class="glyphicon glyphicon-cog"></span></strong></td>
										</c:if>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${commande.produits }" var="ligne">
										<%@include file="include/facture.html"%>
										<tr>
											<c:if test="${diffHeures <= 24 }">
											<td class="text-left visible-xs">
												<button type="button"
													class="btn btn-xs btn-default col-xs-12"
													data-toggle="modal" data-target="#modModal${boucle.index }">
													<em class="glyphicon glyphicon-edit"></em>
												</button> <font style="height: 3px" class="hidden-lg col-xs-12"></font>
												<button type="button"
													class="btn btn-xs btn-danger  col-xs-12"
													data-toggle="modal" data-target="#supModal${boucle.index }">
													<em class="glyphicon glyphicon-trash"></em>
												</button>
											</td>
											</c:if>
											<td><a
												href="<%=request.getContextPath()%>/home/details?produit=${ligne.produit.idProduit }">
													<img width="45" height="45"
													class="img-responsive hidden-xs"
													src="<%=request.getContextPath()%>/resources/img/${ligne.produit.image }">
													<b>${ligne.produit.libelle }</b>
											</a></td>
											<td class="text-center">${ligne.produit.prix }MRO</td>
											<td class="text-center">${ligne.quantite }</td>
											<td class="text-right">${ligne.produit.prix * ligne.quantite }
												MRO</td>
											<c:if test="${diffHeures <= 24 }">
											<td class="text-right hidden-xs">
												<button type="button" class="btn btn-default"
													data-toggle="modal" data-target="#modModal${boucle.index }">
													<em class="glyphicon glyphicon-edit"></em>
												</button> <font style="height: 3px" class="hidden-lg col-xs-12"></font>
												<button type="button" class="btn btn-danger"
													data-toggle="modal" data-target="#supModal${boucle.index }">
													<em class="glyphicon glyphicon-trash"></em>
												</button>
											</td>
											</c:if>
										</tr>
									</c:forEach>
									<tr>
										<td class="no-line"></td>
										<td class="no-line"></td>
										<td class="no-line text-center"><strong>Total</strong></td>
										<td class="no-line text-right">${commande.sommeTotal }
											MRO.</td>
										<td class="no-line text-right"></td>
									</tr>
								</tbody>
							</table>
						</div>
						<a href="<%=request.getContextPath()%>/">Accueil</a> | <a
							href="<%=request.getContextPath()%>/profile">Profile</a>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- ANNULER MODAL -->
	<div class="modal fade" id="annulerModal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">

		<div class="modal-dialog">
			<div class="modal-content">

				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>

					<h4 class="modal-title" id="myModalLabel">Suppression</h4>
				</div>

				<div class="modal-body">Etes vous sure de vouloir annuler la commande ?</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Annuler</button>
					<a
						href="<%=request.getContextPath()%>/commande?annuler=&commande=${commande.idCommande}">
						<button type="button" class="btn btn-danger">Supprimer</button>
					</a>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.ANNULER MODAL -->
</body>
</html>