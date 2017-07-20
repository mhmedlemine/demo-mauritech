<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype HTML>
<html>
	<%
	  response.setHeader("Cache-Control","no-cache");
	  response.setHeader("Cache-Control","no-store");
	  response.setHeader("Pragma","no-cache");
	  response.setDateHeader ("Expires", 0);	
	%>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE = edge">
<meta name="viewport" content="width = device-width, initial-scale = 1">
<title>Profile</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrapValidator.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/bootstrap/css/custom.css">
<script
	src="<%=request.getContextPath()%>/resources/bootstrap/js/jquery.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.min.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrapValidator.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/bootstrap/js/custom.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#btnConnexion').on('click', function(event) {
			$('#formConnexion').bootstrapValidator({
				fields: {
					j_username: {
						validators: {
							notEmpty: {
								message: 'veillez indiquer votre email.'
							}
						}
					},
					j_password: {
						validators: {
							notEmpty: {
								message: 'veillez indiquer votre mot de passe.'
							}
						}
					}
				}
			});
		});
		
	});	
</script>
<style type="text/css">
</style>
</head>
<body>
	<!-- LOGO -->
	<header style="background-color: #9ACD32;">
		<div class="container">
			<a href="<%=request.getContextPath()%>/"><img
				src="<%=request.getContextPath()%>/resources/img/logo.png"
				width="125" height="175"></a>
			<c:if test="${not empty client }">
				<div style="float: right; color: #da4a4a; margin-top: 4px;">
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

			<div class="panel-heading">
				<div class="panel-title text-left">
					<h1 class="title">Espace Client</h1>
					<hr />
				</div>
			</div>

			<div class="container">
				<div class="main">
					<h4>Je dispse d'un compte !</h4>
					<div class="main-login main-center col-lg-3 col-md-4 hidden-sm" style="margin-left:10px; margin-right:10px;">
						<form class="form-horizontal" id="formConnexion"
							action="<c:url value='/j_spring_security_check'/>" method="post">
							<div class="form-group">
								<span class="text-danger">${message }</span>
							</div>
							<div class="form-group">
								<label for="email" class="cols-sm-2 control-label hidden-sm">Adresse
									Email</label>
								<div class="cols-sm-10">
									<div class="input-group">
										<span class="input-group-addon"><i
											class="glyphicon glyphicon-user" aria-hidden="true"></i></span> <input
											type="text" class="form-control" name="j_username"
											id="username" placeholder="Email" />
									</div>
								</div>
							</div>

							<div class="form-group">
								<label for="password"
									class="cols-sm-2 control-label hidden-sm">Mot
									de passe</label>
								<div class="cols-sm-10">
									<div class="input-group">
										<span class="input-group-addon"><i
											class="glyphicon glyphicon-lock" aria-hidden="true"></i></span> <input
											type="password" class="form-control" name="j_password"
											id="password" placeholder="Mot de passe" />
									</div>
								</div>
							</div>

							<div class="form-group ">
								<button type="submit" id="btnConnexion"
									class="btn btn-primary btn-lg btn-block login-button">Connexion</button>
							</div>
							<div class="login-register">
								<label for="remeber-me"><input type="checkbox"
									name="remeber-me" id="remeber-me"> Souviens de moi.</label>
							</div>
						</form>
						<div class="login-register">
							<a href=""> Mot de passe oublié ?</a>
						</div>
					</div>

					<div class="col-lg-0 col-md-1 col-sm-1 col-xs-1"></div>
					<div class="main-login col-lg-8 col-md-7 hidden-sm"
						style="padding: 30px; margin-top: 25px; margin-left:10px; margin-right:10px;">
						<div style="">
							<p>
							<h4 class="text-warning">C'est votre premiere fois sur le
								site ?</h4>
							</p>

							<p>
								<c:if test="${not empty url  }">
								<a href="signup?url=${url }" class="btn btn-success col-sm-offset-3">Creer un
									compte</a>
								</c:if>
								<c:if test='${empty url }'>
								<a href="signup" class="btn btn-success col-sm-offset-3">Creer un
									compte</a>
								</c:if>
							</p>
							<p>
							<h4 class="text-warning">Pourquoi creer un compte ?</h4>
							<b>La creation d'un compte sur le site vous permettera de :</b>
							<ul>
								<li>passer vos commandes en ligne (en nous indiquant les
									adresses de livraison et de facturation que nous devons
									utiliser).</li>
								<li>Suivre la progression du traitement de la commande.</li>
								<li>et plus ...</li>
							</ul>
							</p>
							<p></p>
						</div>
					</div>

					<!-- CREER COMPTE SM -->
					<div class="main-login visible-sm"
						style="width: 60%; float: right; padding: 30px;">
						<div style="">
							<p>
							<h4 class="text-warning">C'est votre premiere fois sur le
								site ?</h4>
							</p>
							<p>
								<a href="signup" class="btn btn-success col-sm-offset-3">Creer un
									compte</a>
							</p>
							<p>
							<h4 class="text-warning">Pourquoi creer un compte ?</h4>
							<b>La creation d'un compte sur le site vous permettera de :</b>
							<ul>
								<li>passer vos commandes en ligne (en nous indiquant les
									adresses de livraison et de facturation que nous devons
									utiliser).</li>
								<li>Suivre la progression du traitement de la commande.</li>
								<li>et plus ...</li>
							</ul>
							</p>
							<p></p>
						</div>
					</div>
					<!-- ./CREER COMPTE SM -->

					<!-- CONNEXION SM -->
					<div class="main-login visible-sm"
						style="width: 30%; padding: 30px;">
						<form class="form-horizontal"
							action="<c:url value='/j_spring_security_check'/>" method="post">

							<div class="form-group" style="height: 34px;">
								<label for="email"
									class="cols-sm-2 control-label hidden-sm hidden-xs">Adresse
									Email</label>
								<div class="cols-sm-10">
									<div class="input-group">
										<span class="input-group-addon"><i
											class="glyphicon glyphicon-user" aria-hidden="true"></i></span> <input
											type="text" class="form-control" name="j_username"
											id="username" placeholder="Email" />
									</div>
								</div>
							</div>

							<div class="form-group" style="height: 34px;">
								<label for="password"
									class="cols-sm-2 control-label hidden-sm hidden-xs">Mot
									de passe</label>
								<div class="cols-sm-10">
									<div class="input-group">
										<span class="input-group-addon"><i
											class="glyphicon glyphicon-lock" aria-hidden="true"></i></span> <input
											type="password" class="form-control" name="j_password"
											id="password" placeholder="Mot de passe" />
									</div>
								</div>
							</div>

							<div class="form-group" style="height: 40px;">
								<button type="submit"
									class="btn btn-primary btn-lg btn-block login-button">Connexion</button>
							</div>
							<div class="login-register">
								<label for="remeber-me"><input type="checkbox"
									name="remeber-me" id="remeber-me"> Souviens de moi.</label>
							</div>
						</form>
						<div class="login-register">
							<a href=""> Mot de passe oublié ?</a>
						</div>
					</div>
					<!-- ./CONNEXION SM -->

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