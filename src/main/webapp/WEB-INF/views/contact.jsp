<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype HTML>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE = edge">
<meta name="viewport" content="width = device-width, initial-scale = 1">
<title>Contact</title>
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
		style="border: 1px solid #C7A138; background: #ADA692;">
	<div class="continer">	
		<div class="jumbotron jumbotron-sm">
    <div class="container">
        <div class="row">
            <div class="col-sm-12 col-lg-12">
                <h1 class="h1"><small>Nous contacter</small></h1>
            </div>
        </div>
    </div>
	</div>
<div class="container">
    <div class="row">
        <div class="col-md-8">
            <div class="well well-sm">
                <form>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="nom">
                                Nom</label>
                            <input type="text" class="form-control" id="nom" placeholder="Enterez votre nom" name="nom" />
                        </div>
                        <div class="form-group">
                            <label for="email">
                                Adresse email</label>
                            <div class="input-group">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-envelope"></span>
                                </span>
                                <input type="email" class="form-control" id="email" placeholder="Enterez votre email" name="email" /></div>
                        </div>
                        <div class="form-group">
                            <label for="sujet">
                                Sujet</label>
                            <input type="text" id="sujet" name="sujet" class="form-control" placeholder="Sujet">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="message">
                                Message</label>
                            <textarea name="message" id="message" class="form-control" rows="9" cols="25"
                                placeholder="Message"></textarea>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <button type="submit" class="btn btn-primary pull-right" id="btnSubmit">
                            Envoyer Message</button>
                    </div>
                </div>
                </form>
            </div>
        </div>
        <div class="col-md-4">
            <form>
            <legend><span class="glyphicon glyphicon-globe"> Mauritech</legend>
            <address>
                <strong>Ficartec.</strong><br>
                95 Ilot K, � cot� de Pizzorno<br>
                Nouakchott, Mauritanie<br>
                <abbr title="Telephone">
                    Tel.:</abbr>
                00 (222) 45 62 78 90
            </address>
            </form>
        </div>
    </div>
</div>

	</div>
  <!-- FOOTER -->
		<hr style="margin-bottom: 0px; background-color: black">
		<footer style="background-color: #9ACD32; min-height: 60px;">
			<div style="text-align: center; padding-top: 15px; color: black;">
				Copyright &copy; <em>MauriTech</em> 2016.
			</div>
		</footer>
  </div>
</body>
</html>