<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
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
<title>Passer une commande</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/bootstrap/css/custom.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/bootstrap/css/datepicker.css">
<script
	src="<%=request.getContextPath()%>/resources/bootstrap/js/jquery.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.min.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/bootstrap/js/custom.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/bootstrap/js/datepicker.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/bootstrap/js/datepicker-fr.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#dateLivraison').on('focus', function(event) {
		}).datepicker({
			startDate : "+2d",
			endDate : "+1m",
			format : "yyyy/mm/dd",
			language : "fr"
		});
		
		$('#livraison').on('blur', function(event) {
			if(!document.getElementById("livraison").value){
				$("#dateL").closest("div").addClass("has-error");
				document.getElementById("errorMessage").innerHTML = "veillez indiquer la date de livraison!";
			}else{
				$("#dateL").closest("div").removeClass("has-error");
				document.getElementById("errorMessage").innerHTML = "";
			}
		});

		$('#terminer').on('click', function(event) {
			if(!document.getElementById("livraison").value){
				$("#dateL").closest("div").addClass("has-error");
				document.getElementById("errorMessage").innerHTML = "veillez indiquer la date de livraison!";
			}else{
				document.getElementById("terminer").setAttribute('disabled', 'disabled');
				document.getElementById("livrForm").submit();
			}
		});

	});
</script>
<style type="text/css">
.date-glyph {
	cursor: pointer;
	cursor: hand;
}
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

			<div class="col-xs-4 bs-wizard-step active" style="color: black;">
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

			<div class="col-xs-4 bs-wizard-step disabled" style="color: black;">
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
		<div class="row" style=";width:95%;margin: auto">
			<br><br><b class="col-xs-12">choisissez une adresse de livraison :</b> <br>
			<form class="form form-horizontal col-xs-12" method="POST" style="padding-left:20px;padding-right:20px;"
				action="<%=request.getContextPath()%>/passercommande" id="livrForm">
				<div>
					<label class="radio-inline" style="margin-left: 10px;"> <input
						type="radio" value="${adresse.idAdresse }" name="adresse"
						checked="checked"> ${adresse } (defaut)<br>
					</label>
					<c:forEach items="${adresses }" var="adr">
						<label class="radio-inline"> <input type="radio"
							value="${adr.idAdresse }" name="adresse"> ${adr.nom }
							${adr.prenom }<br> ${adr.telephone }<br> ${adr.ville }<br>
							${adr.rue }
						</label>
					</c:forEach>
				</div>
				<br><br>
				ou ajouter
				<button type="button" class="btn btn-sm  btn-default"
					data-toggle="modal" data-target="#MyModal">une nouvelle
					adresse</button>
				<br> <br> <br> 
				<div class="col-md-5 form-group has-feedback" id="dateL">
					<label class="control-label" for="livraison">Date de livraison:</label>
					<div class="input-group date" id="dateLivraison">
						<input type="text" class="form-control" id="livraison"
							name="dateLivraison" readonly>
						<div class="input-group-addon"
							style="cursor: pointer; cursor: hand;">
							<span class="glyphicon glyphicon-th"></span>
						</div>
					</div>
					<span id="errorMessage" class="help-block with-errors"></span>
					<br><button class="btn btn-success pull-right" type="button"
					id="terminer">Terminer</button>
				</div>
				<div class="col-md-5" style="margin-bottom:45px;">
					
				</div>
			</form>
		</div>
	</div>

</body>
<!-- AJOUT D'ADRESSE MODAL -->
<div class="modal fade" id="MyModal" tabindex="-1" role="dialog"
	aria-labelledby="ModifModalLabel" aria-hidden="true">

	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="ModifModalLabel">Nouvelle adresse</h4>
			</div>
			<div class="modal-body">
				<f:form data-toggle="validator" role="form" modelAttribute="command"
					action="" method="post">
					<div class="form-group">
						<label for="">Nom</label>
						<f:input cssClass="form-control" path="nom" />
					</div>
					<div class="form-group">
						<label for="">Prenom</label>
						<f:input cssClass="form-control" path="prenom" />
					</div>
					<div class="form-group">
						<label for="">Telephone</label>
						<f:input cssClass="form-control" path="telephone" />
					</div>
					<div class="form-group">
						<label for="">Ville</label>
						<f:input cssClass="form-control" path="ville" />
					</div>
					<div class="form-group">
						<label for="">Rue</label>
						<f:input cssClass="form-control" path="rue" />
					</div>

					<div class="form-group">
						<input class="btn btn-success" type="submit" value="Enregister">
					</div>
				</f:form>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->

</div>
<!-- /.Modifmodal -->
</html>