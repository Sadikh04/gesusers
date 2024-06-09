<%@page import="gesusers.Utilisateur"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" pageEncoding="UTF8"%>
<% final String APP_ROOT = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF8">
	<link rel="stylesheet" type="text/css" href="<%= APP_ROOT %>/css/design.css">
	<title>Gestion des utilisateurs</title>
</head>

<body>
<%@ include file="menu.jsp" %>
<section>
<h1 id="titre-principal"> Liste des utilisateurs</h1>
<%
  // Check if the "utilisateurs" attribute exists before using it
  if (request.getAttribute("utilisateurs") != null) {
      ArrayList<Utilisateur> users = (ArrayList<Utilisateur>) request.getAttribute("utilisateurs");
      
      if(users.isEmpty()) {
          out.print("Désolé, la liste des utilisateurs est vide !");
      } else {%>
      <table border="1" cellspacing="0" cellpadding="10">
      	<tr>
      		<th>ID</th><th>Nom</th><th>Prénom</th><th>Login</th><th>Password</th><th colspan="2">Actions</th>
      	</tr><% 
      
          for(Utilisateur user : users) 
          {%>
          <tr>
			<td><%= user.getId() %></td>
			<td><%= user.getNom() %></td>
			<td><%= user.getPrenom() %></td>
			<td><%= user.getLogin() %></td>
			<td><%= user.getPassword() %></td>
			<td><a href="update?id=<%= user.getId() %>">Modifier</a></td>
			<td><a href="delete?id=<%= user.getId() %>" onclick="return confirm('En êtes vous sûre ?')">Supprimer</a></td>
           </tr><% 
          }%>
      </table><%
      }
  } else {
      
      out.print("Une erreur est survenue lors de la récupération des utilisateurs.");
  }
%>

</section>
<%@ include file="footer.jsp" %>
</body>
</html>
