<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Demandeur Home</title>
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
        #openModalBtn, #populateButton {
            background-color: black;
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            width: 150px;
            height: 50px;
            font-size: 16px;
            display: block;
            margin: auto;
            margin-bottom: 20px;
            text-align: center;
        }
       /* Modal styles */
#newInterventionModal {
    display: none;
    position: fixed;
    z-index: 1;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: auto;
    background-color: rgba(0, 0, 0, 0.4);
}

.modal-content {
    background-color: #fefefe;
    margin: 10% auto;
    padding: 20px;
    border-radius: 10px;
    width: 60%; /* Adjusted width for better visibility */
    max-width: 500px; /* Maximum width to prevent stretching on larger screens */
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
}

.close {
    color: #aaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover, .close:focus {
    color: black;
    text-decoration: none;
    cursor: pointer;
}

/* Form inside the modal */
#newInterventionForm {
    text-align: center;
}

#newInterventionForm label {
    font-size: 18px;
    display: block;
    margin-bottom: 10px;
}

#newInterventionForm input[type="text"] {
    width: calc(100% - 20px); /* Adjusted width for better alignment */
    padding: 10px;
    margin-bottom: 20px;
    border-radius: 5px;
    border: 1px solid #ccc;
    box-sizing: border-box; /* Include padding and border in the width calculation */
}

#newInterventionForm input[type="submit"] {
    background-color: cornflowerblue;
    color: white;
    padding: 14px 20px;
    border: none;
    border-radius: 8px;
    cursor: pointer;
    width: 50%;
    font-size: 16px;
}

#newInterventionForm input[type="submit"]:hover {
    background-color: #45a049;
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
        <h1>Demandeur Home</h1>
        <a href="index.jsp"onclick="disconnect()"  class="disconnect-btn">Disconnect</a> <!-- Disconnect button -->
        <button id="openModalBtn">New Intervention</button>
        <form id="populateForm" action="homeDem" method="post"style="display: none;">
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
        <div id="newInterventionModal" class="modal">
            <div class="modal-content">
                <span class="close">&times;</span>
                <h2 style="text-align: center;">New Intervention</h2>
                <form id="newInterventionForm" action="homeDem" method="post">
                    <label for="machineName" style="font-size: 18px;">Nom de Machine:</label>
                    <input type="text" id="machineName" name="machineName" required style="width: 80%; padding: 10px; margin-bottom: 20px; border-radius: 5px; border: 1px solid #ccc;"><br>
                    <label for="problem" style="font-size: 18px;">Probleme:</label>
                    <input type="text" id="problem" name="problem" required style="width: 80%; padding: 10px; margin-bottom: 20px; border-radius: 5px; border: 1px solid #ccc;"><br>
                    <input type="submit" value="Confirmer" style="background-color:activeborder ;color: white; padding: 14px 20px; border: none; border-radius: 8px; cursor: pointer; width: 50%; font-size: 16px;">
                </form>
            </div>
        </div>

        <table>
            <tr>
                <th>Code</th>
                <th>Machine</th>
                <th>Probleme</th>
                <th>Statut</th>
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
                </tr>
            </c:forEach>
        </table>
    </div>

    <script>
        // Get the modal and the button
        var modal = document.getElementById('newInterventionModal');
        var btn = document.getElementById('openModalBtn');

        // Get the <span> element that closes the modal
        var span = document.getElementsByClassName('close')[0];

        // When the user clicks the button, open the modal
        btn.onclick = function() {
            modal.style.display = 'block';
        }

        // When the user clicks on <span> (x), close the modal
        span.onclick = function() {
            modal.style.display = 'none';
        }

        // When the user clicks anywhere outside of the modal, close it
        window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = 'none';
            }
        }
    </script>
</body>
</html>
