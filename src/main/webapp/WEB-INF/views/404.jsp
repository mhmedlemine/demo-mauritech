<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype HTML>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE = edge">
<meta name="viewport" content="width = device-width, initial-scale = 1">
<title>Page introuvable</title>
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
.error-template {
	padding: 40px 15px;
	text-align: center;
}

.error-actions {
	margin-top: 15px;
	margin-bottom: 15px;
}

.error-actions .btn {
	margin-right: 10px;
}
</style>
</head>
<body>
	<!-- LOGO -->
	<header style="background-color: #9ACD32;">
		<div class="container">
			<a href="accueil.html"><img
				src="<%=request.getContextPath()%>/resources/img/logo.png"
				width="75" height="75"></a>
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
			<div class="row" style="">
				<div class="col-md-12">
					<div class="error-template">
						<h1>Oops!</h1>
						<img class="img-responsive" src="<%=request.getContextPath()%>/resources/img/error-logo.png" style="margin:auto;"/>
						<h2 class="text-danger">Page introuvable.</h2>
						<div class="error-details">vous avez demandé une page qui n'existe pas!</div>
						<div class="error-actions">
							<a href="<%=request.getContextPath()%>/"
								class="btn btn-primary btn-lg btn-md btn-sm btn-xs"><span
								class="glyphicon glyphicon-home"></span> Retourner à Mauritech.</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>