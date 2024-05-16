<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>User Management Application</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<body>

	<header>
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: blue">
			<div>
				<a href="https://www.javaguides.net" class="navbar-brand"> Gestion Des Utilisateurs </a>
			</div>

		</nav>
	</header>
	<br>
		<div class="container">
			<h3 class="text-center">Liste Utilisateurs</h3>
			<hr>
			<div class="container text-center">

				<a href="<%=request.getContextPath()%>/new" class="btn btn-success">Nouveau Utilisateur</a>
			</div>
			<br>
    <div align="center">
        <table border="1" cellpadding="5">
            <tr>
                <th>Code</th>
                <th>Nom</th>
                <th>Prenom</th>
                <th>Mot de Passe</th>
                <th>Type</th>
                <th>Actions</th>
            </tr>
            <c:forEach var="user" items="${listUser}">
                <tr>
                    <td><c:out value="${user.code}" /></td>
                    <td><c:out value="${user.nom}" /></td>
                    <td><c:out value="${user.prenom}" /></td>
                    <td><c:out value="${user.password}" /></td>
                    <td><c:out value="${user.type}" /></td>
                    <td>
                    	<a href="edit?code=<c:out value='${user.code}' />">Edit</a>
                    	&nbsp;&nbsp;&nbsp;&nbsp;
                    	<a href="delete?code=<c:out value='${user.code}' />">Delete</a>                    	
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <br>
    <div class="container text-center">
        <button id="disconnectButton" class="btn btn-success" onclick="disconnect()">Déconnexion</button>
    </div>
</div>	
<form id="populateForm" action="homeAdmin" method="post"style="display: none;">
            <input type="hidden" name="action" value="populate">
            <button type="submit" id="populateButton">Populate Table</button>
        </form>
        <script>
        // Function to automatically submit the form only once
        window.onload = function() {
            // Check if the form has already been submitted
            if (!sessionStorage.getItem('formSubmitted')) {
                // Submit the form
                document.getElementById("populateForm").submit();
                // Set a flag in sessionStorage to indicate that the form has been submitted
                sessionStorage.setItem('formSubmitted', 'true');
            }
        };
         // Function to clear session storage and redirect to index.jsp
        function disconnect() {
            // Clear session storage
            sessionStorage.clear();
            // Redirect to index.jsp
            window.location.href = 'index.jsp';
        }
    </script>

</body>
</html>