package gestion.mecanique.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.*;
import gestion.mecanique.bean.LoginB;
import gestion.mecanique.model.LoginM;

@WebServlet("/index")
public class LoginServelet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private LoginM LoginM;

    public void init() {
        LoginM = new LoginM();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

        String code = request.getParameter("code");
        String password = request.getParameter("password");
        LoginB loginBean = new LoginB();
        loginBean.setUsername(code);
        loginBean.setPassword(password);

        try {
        if (LoginM.validate(loginBean)) {
            // Récupérer le type d'utilisateur depuis la base de données
            int userType = getUserTypeFromDatabase(code);
            
            // Rediriger en fonction du type d'utilisateur
            switch (userType) {
                case 1:
                    response.sendRedirect("homeAdmin.jsp");
                    break;
                case 2:
                    response.sendRedirect("homeDem.jsp");
                    break;
                case 3:
                    response.sendRedirect("homeTech.jsp");
                    break;
                default:
                    response.sendRedirect("index.jsp"); // Redirection par défaut si le type d'utilisateur n'est pas reconnu
                    break;
            }
        } else {
            HttpSession session = request.getSession();
            //session.setAttribute("user", username);
            response.sendRedirect("index.jsp");
        }
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }
}

// Méthode pour récupérer le type d'utilisateur depuis la base de données
private int getUserTypeFromDatabase(String code) {
    int userType = 0; // Valeur par défaut
    try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/gestion_mecanique?useSSL=false", "root", "");
        PreparedStatement preparedStatement = connection.prepareStatement("select type from users where code = ?")) {
        preparedStatement.setString(1, code);
        ResultSet rs = preparedStatement.executeQuery();
        if (rs.next()) {
            userType = rs.getInt("type");
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return userType;
}
}