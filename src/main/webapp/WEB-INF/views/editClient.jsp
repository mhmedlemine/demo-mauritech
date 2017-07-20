<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<!doctype HTML>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE = edge">
<meta name="viewport" content="width = device-width, initial-scale = 1">
<title>Modifier compte</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/bootstrap/css/custom.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/bootstrap/css/datepicker.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrapValidator.css">
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

<script
	src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrapValidator.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/bootstrap/js/mask.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/bootstrap/js/custom.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#niassance').on('focus', function(event) {
		}).datepicker({
			startDate : "1900-01-01",
			endDate : "1999-12-31",
			format : "yyyy/mm/dd",
			language : "fr"
		});

		$("#niassance").mask('0000/00/00', {placeholder : "____/__/__"});

		$('#dateNiassance').datepicker({
			startDate : "1900-01-01",
			endDate : "1999-12-31",
			format : "yyyy/mm/dd",
			language : "fr"
		});
		
		$('#btnSubmit').on('click', function(event) {
			$('#editForm').bootstrapValidator({
				fields : {
					nom : {
						validators : {
							notEmpty : {
								message : 'veillez indiquer votre nom.'
							},
							regexp : {
								regexp : /^[a-z\s]+$/i,
								message : 'le nom contient seulement des charactères alphabetiques ou espace.'
							}
						}
					},
					prenom : {
						validators : {
							notEmpty : {
								message : 'veillez indiquer votre prenom.'
							},
							regexp : {
								regexp : /^[a-z\s]+$/i,
								message : 'le prenom contient seulement des charactères alphabetiques ou espace.'
							}
						}
					},
					niassance : {
						validators : {
							notEmpty : {
								message : 'veillez indiquer votre niassance.'
							},
							date : {
								format : 'YYYY/MM/DD',
								message : 'le format de la date est \'aaaa/mm/jj\'.'
							}
						}
					},
					nin : {
						validators : {
							notEmpty : {
								message : 'ce champs est obligatoire.'
							},
							digits : {
								message : 'le NIN est composé de chiffres seulement.'
							}
						}
					},
					email : {
						validators : {
							notEmpty : {
								message : 'ce champs est obligatoire.'
							},
							emailAddress : {
								message : 'ceci n\'est pas une adresse email valide.'
							}
						}
					},
					newpass : {
						validators : {
						}
					},
					confPass : {
						validators : {
							identical : {
								field : 'password',
								message : 'la confirmation n\'est pas identique au mot de passe'
							}
						}
					},
					oldpass : {
						validators : {
							notEmpty : {
								message : 'veillez indiquer votre mot de passe.'
							}
						}
					}
				}
			}).find('[name="naissance"]').mask('1000/00/00',{placeholder : "____/__/__"});

			window.setTimeout(function() {
				var errors = $('.has-error')
				if (errors.length) {
					$('html, body').animate({scrollTop : errors.offset().top - 50},500);
				}
			}, 0);
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
					style="background-color: #428bca; text-shadow: 1px 1px 1px #666; padding: 3px; padding-left: 12px; margin-bottom: 0;">
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

			<h2>Espace Client</h2>
			<hr>
			<div class="pull-right visible-lg visible-md">
				<img src="<%=request.getContextPath()%>/resources/img/banner.png"
					width="350" height="250"><br> <br> <img
					src="<%=request.getContextPath()%>/resources/img/banner.png"
					width="350" height="250">
			</div>
			<div class="container">
				<div class="row">
					<div class="col-md-6 col-sm-12 col-xs-12 ">
						<c:if test="${not empty passError }">
							<div class="well well-sm">
								<span class="text-danger">${passError }</span>
							</div>
						</c:if>
						<f:form cssClass="form-horizontal" action="" method="POST" id="editForm"
							enctype="multipart/form-data" modelAttribute="command">
						<div class="main-login" style="padding: 30px; margin-top: 30px;">
								<div style="border-bottom: 1px solid blue;" class="form-group">
									<h3>Informations Personnelles</h3>
								</div>
								<div class="form-group ${empty erreurs['nom'] ? '' : 'has-error'}">
									<label class="control-label" for="nom">Nom</label>
									<div class="col-md-12" style="padding: 0;">
										<f:input class="form-control" path="nom" name="nom" id="nom" value="${param.nom }"/>
										<span class="help-block danger">${erreurs['nom']}</span>
									</div>
								</div>
								<div class="form-group ${empty erreurs['prenom'] ? '' : 'has-error'}">
									<label class="control-label" for="prenom">Prenom</label>
									<div class="col-md-12" style="padding: 0;">
										<f:input name="prenom" id="prenom" class="form-control" path="prenom" value="${param.prenom }"/>
										<span class="help-block danger">${erreurs['prenom']}</span>
									</div>
								</div>
								<div class="form-group ${empty erreurs['naissance'] ? '' : 'has-error'}">
									<label class="control-label" for="naissance">Date de
										naissance</label>
									<div class="input-group date" id="dateNiassance">
										<input name="naissance" class="form-control" value="${empty param.naissance ? dateNaissance : param.naissance }"
											id="naissance" />
										<div class="input-group-addon"
											style="cursor: pointer; cursor: hand;">
											<span class="glyphicon glyphicon-calendar"></span>
										</div>
									</div>
									<span class="help-block danger">${erreurs['naissance']}</span>
								</div>
								<div class="form-group ${empty erreurs['nin'] ? '' : 'has-error'}">
									<label class="control-label" for="nin">NIN</label>
									<div class="col-md-12" style="padding: 0;">
										<f:input name="nin" id="nin" class="form-control" path="nin" value="${param.nin }"/>
										<span class="help-block danger">${erreurs['nin']}</span>
									</div>
								</div>
						</div>
						<div class="main-login" style="padding: 30px; margin-top: 10px;">
							<div style="border-bottom: 1px solid blue;" class="form-group">
								<h3>Informations du compte</h3>
							</div>
							<div class="form-group ${empty erreurs['email'] ? '' : 'has-error'}">
								<label class="control-label" for="email">E-mail</label>
								<div>
									<f:input class="form-control" name="email" value="${param.email }"
										path="mail" id="email" />
									<span class="help-block danger">${erreurs['email']}</span>
								</div>
							</div>

							<div class="form-group ${(empty erreurs['password'] &&  empty erreurs['confPass']) ? '' : 'has-error'}">
								<label class="control-label" for="newpass">Mot de passe</label>
								<div>
									<input class="form-control" type="password" id="newpass"
										name="newpass"/>
									<span class="help-block danger">${erreurs['password']}</span>
								</div>
							</div>
							<div class="form-group ${empty erreurs['confPass'] ? '' : 'has-error'}">
								<label class="control-label" for="confPass">Confirmation du mot de passe</label>
								<div>
									<input class="form-control" type="password" name="confPass"
										id="confPass" />
									<span class="help-block danger">${erreurs['confPass']}</span>
								</div>
							</div>
						</div>

						<div class="form-group" style="width: 40%; padding: 20px;">
							<label for="oldpass">Mot de passe</label> <input class="form-control"
								name="oldpass" type="password" id="oldpass" />
						</div>

						<div class="form-group" style="margin-top: 20px">
							<input class="btn btn-success" type="submit" value="Enregister" id="btnSubmit">
							<input class="btn btn-warning" type="reset" value="Mettre à zero">
							<a href="../" class="btn btn-danger" style="margin-left: 12px;">Annuler</a>
						</div>
						</f:form>
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