<%@ page language="java" pageEncoding="UTF8"%>
<% final String APP_ROOT = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF8">
	<title>ACCUEIL </title>
	<link rel="stylesheet" type="text/css" href="<%= APP_ROOT %>/css/design.css">
</head>
<body>
<%@ include file="menu.jsp" %>
<section>
<h1 id="titre-principal"> Ajouter un utilisateur</h1>
	<form class="main" action="" method="post">
		<div class="formItem">
			<label>Nom</label>
			 <input type="text" name="nom" value="${ utilisateur.nom }" >
			 <span class="erreur">${ erreurs.nom }</span>
		</div>
		<div class="formItem">
			<label>Prenom</label><br>
			 <input type="text" name="prenom" value="${ utilisateur.prenom }">
			 <span class="erreur">${ erreurs.prenom }</span>
		</div>
		<div class="formItem">
			<label>Login</label><br>
			 <input type="text" name="login" value="${ utilisateur.login }">
			 <span class="erreur">${ erreurs.login }</span>
		</div>
		<div class="formItem">
			<label>Mot de passe</label><br>
			 <input type="password" name="password" value="${ utilisateur.password }" ><br>
			 <span class="erreur">${ erreurs.password }</span>
		</div>
		<div class="formItem">
			<label>Confirmer votre mot de passe</label><br>
			 <input type="password" name="passwordBis"><br>
			 <span class="erreur">${ erreurs.passwordBis }</span>
		</div>
			 <div class="formItem">
			 <input type="submit" value=" Ajouter ">
		</div>	 	 
	</form>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>