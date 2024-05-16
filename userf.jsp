<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>Gestion Interventions</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<body>
	<header>
            <nav class="navbar navbar-expand-md navbar-dark" style="background-color: blue">
                <div>
                        <a href="https://www.javaguides.net" class="navbar-brand"> Gestion Des Utilisateurs </a>
                </div>
            </nav>
	</header>
	<br>
	<div class="container col-md-5">
            <div class="card">
                <div class="card-body">
                    <c:if test="${user != null}">
                            <form action="update" method="post">
                    </c:if>
                    <c:if test="${user == null}">
                            <form action="insert" method="post">
                    </c:if>
            <caption>
                <h2>
                    <c:if test="${user != null}">
                            Editer Utilisateur
                    </c:if>
                    <c:if test="${user == null}">
                            Ajouter Nouveau Utilisateur
                    </c:if>
                </h2>
            </caption>
            <c:if test="${user != null}">
                    <input type="hidden" name="code" value="<c:out value='${user.code}' />" />
            </c:if>
            <fieldset class="form-group">
                    <label>Code :</label> <input type="text"
                    value="<c:out value='${user.code}' />" class="form-control"
                    name="code" required="required">
            </fieldset>
            <fieldset class="form-group">
                    <label>Nom :</label> <input type="text"
                    value="<c:out value='${user.nom}' />" class="form-control"
                    name="nom" required="required">
            </fieldset>
            <fieldset class="form-group">
                    <label>Prenom :</label> <input type="text"
                    value="<c:out value='${user.prenom}' />" class="form-control"
                    name="prenom" required="required">
            </fieldset>
            <fieldset class="form-group">
                    <label>Mot de Passe :</label> <input type="text"
                    value="<c:out value='${user.password}' />" class="form-control"
                    name="password" required="required">
            </fieldset>
            <fieldset class="form-group">
                    <label>Type:</label> <select name="type">
                    <option value="1" <c:if test="${user.type == 1}">selected</c:if>>Admin</option>
                    <option value="2" <c:if test="${user.type == 2}">selected</c:if>>Demandeur</option>
                    <option value="3" <c:if test="${user.type == 3}">selected</c:if>>Technicien</option>
                    </select>
            </fieldset>
                                <div class="d-flex justify-content-between">
                    <button type="submit" class="btn btn-success mr-2">Sauvegarder</button>
                <button type="button" class="btn btn-secondary"><a href="<%=request.getContextPath()%>/homeAdmin" class="text-white">Annuler</a></button>
            </div>
        </form>
    </div>	
   </div>	
 </div>	
</body>
</html>