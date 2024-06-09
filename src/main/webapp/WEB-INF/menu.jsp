<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% boolean isConnected = session.getAttribute("loggedUser") != null; %>
<header> Gestion des utilisateurs </header>
	<nav>
		<ul>
		<li><a href="<%= APP_ROOT %>"> Acceuil </a></li>
		<%
			if(isConnected)
			{%>
				<li><a href="<%= APP_ROOT %>/list"> Lister </a></li>
				<li><a href="<%= APP_ROOT %>/add"> Ajouter </a></li>
				<li><a href="<%= APP_ROOT %>/logout"> Deconnexion </a></li>
			
			<%}
			else
			{%>
				<li><a href="<%= APP_ROOT %>/login"> Connexion </a></li>
			<%}
		%>
		
		
		</ul>
	</nav>
</body>
</html>