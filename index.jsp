<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Page de Connexion</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

    <style>
        .login-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .login-form-container {
            width: 140vh;
            height: 80vh;
            background-color: #f2f2f2;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-direction: row;
        }

        .login-form {
            flex: 1;
            padding-right: 30px;
        }

        .login-inf {
            flex: 1;
            position: relative; /* Permet de positionner le calque sur l'image */
        }

        .overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: #007bff;
            display: flex;
            justify-content: center;
            align-items: center;
            color: white;
            font-size: 24px;
        }

        .form-group label {
            font-weight: bold;
            margin-bottom: 25px; 
        }

        .form-control {
            margin-bottom: 30px; 
        }

        .btn {
            margin-top: 30px; 
        }
    </style>
</head>
<body>
    <div class="container-fluid">
        <div class="row login-container">
            <div class="col-md-8">
                <div class="login-form-container">
                    <div class="login-form">
                        <h1 class="text-center mb-4">Connexion</h1>
                        <form action="<%=request.getContextPath()%>/index" method="post">
                            <div class="form-group">
                                <label for="code">Entrez votre Code :</label>
                                <input type="text" name="code" id="code" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label for="password">Entrez votre Mot de Passe :</label>
                                <input type="password" name="password" id="password" class="form-control" required>
                            </div><br>
                            <button type="submit" class="btn btn-primary btn-block">Connexion</button>
                        </form>
                    </div>
                    <div class="login-inf">
                        <div class="overlay"><div class="text-center text-white">
                    <h1>Bienvenue !</h1>
                    <p>Connectez-vous pour accéder à votre compte.</p>
                </div></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>