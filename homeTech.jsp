<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Technicien Home</title>
    <style>
        /* Global styles */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        /* Page container */
        .container {
            max-width: 800px;
            margin: 50px auto;
            padding: 0 20px;
            position: relative; /* For positioning the disconnect button */
        }

        /* Title */
        h1 {
            text-align: center;
        }

        /* Disconnect button */
        .disconnect-btn {
            position: absolute;
            top: 10px;
            right: 10px;
            background-color: #f44336; /* Red color for disconnect button */
            color: white;
            border: none;
            border-radius: 4px;
            padding: 8px 12px;
            cursor: pointer;
        }

        .disconnect-btn:hover {
            background-color: #d32f2f; /* Darker red on hover */
        }

        /* Button styles */
        #populateForm {
            text-align: center;
            margin-bottom: 20px;
        }

        #populateForm button {
            background-color: black;
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            width: 150px;
            height: 50px;
            font-size: 16px;
        }

        /* Table styles */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #dddddd;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        /* Status styles */
        .status-en-attente {
            color: orange;
        }

        .status-cloture {
            color: green;
        }
    </style>
     
</head>
<body>
    <div class="container">
        <h1>Technicien Home</h1><br><br>
        
        <a href="index.jsp"onclick="disconnect()"  class="disconnect-btn">Disconnect</a> <!-- Disconnect button -->
        <form id="populateForm" action="homeTech" method="post"style="display: none;">
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
        <table>
            <tr>
                <th>Code</th>
                <th>Machine</th>
                <th>Probleme</th>
                <th>Statut</th>
                <th>Action</th>
            </tr>
            <c:forEach items="${interventions}" var="intervention">
                <tr>
                    <td>${intervention.code}</td>
                    <td>${intervention.machine}</td>
                    <td>${intervention.probleme}</td>
                    <td>
                        <c:choose>
                            <c:when test="${intervention.statut == 1}">
                                <span class="status-en-attente">En attente</span>
                            </c:when>
                            <c:otherwise>
                                <span class="status-cloture">Clos</span>
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td>
                        <c:if test="${intervention.statut == 1}">
                            <form action="homeTech" method="post">
                                <input type="hidden" name="action" value="updateStatut">
                                <input type="hidden" name="code" value="${intervention.code}">
                                <button type="submit">Reparer</button>
                            </form>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>
