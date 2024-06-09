<%@page import="dao.UtilisateurDao"%>
<%@page import="gesusers.Utilisateur"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% final String APP_ROOT = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="<%= APP_ROOT %>/css/design.css">
<title>Gestion des utilisateurs</title>
</head>
<body>
<%@ include file="menu.jsp" %>
<section>
<h1 id="titre-principal"> Modification d'un utilisateur</h1>
<% Utilisateur utilisateur = (Utilisateur) request.getAttribute("utilisateur"); %>

	<form class="main" action="" method="post">
	
		<div class="formItem">
			<label>Nom</label>
			 <input type="text" name="nom" value="${ utilisateur.nom }" required>
		</div>
		<div class="formItem">
			<label>Prenom</label><br>
			 <input type="text" name="prenom" value="${ utilisateur.prenom }" required>
		</div>
		<div class="formItem">
			<label>Login</label><br>
			 <input type="text" name="login" value="${ utilisateur.login }" required>
		</div>
		<div class="formItem">
			<label>Password</label><br>
			 <input type="password" name="password" value="${ utilisateur.password }" required><br>
		</div>
			 <div class="formItem">
			 <input type="submit" value=" Modifer ">
		</div>	 	 
	</form>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>