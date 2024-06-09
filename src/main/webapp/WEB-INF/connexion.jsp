<%@ page language="java" pageEncoding="UTF8"%>
<% final String APP_ROOT = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF8">
	<title>Connexion</title>
	<link rel="stylesheet" type="text/css" href="<%= APP_ROOT %>/css/design.css">
</head>
<body>
<%@ include file="menu.jsp" %>
<section>

	<%
		if(request.getAttribute("status") != null)
		{%>
			<div class="alert alert-${ status ? 'success' : 'danger' }">
				${ statusMessage }
			</div>
		<%}
	%>
<h1 id="titre-principal"> Authentification</h1>
	<form class="main" action="" method="post">
		<div class="formItem">
			<label>Login</label><br>
			 <input type="text" name="login" value="${ login }" required>
		</div>
		<div class="formItem">
			<label>Mot de passe</label><br>
			 <input type="password" name="password" required><br>
		</div>
			 <div class="formItem">
			 <input type="submit" value=" Connexion ">
		</div>	 	 
	</form>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>