import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/homeTech")
public class TechnicienHomeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Intervention> interventions = getInterventionsFromDatabase();
        
        request.setAttribute("interventions", interventions);
        request.getRequestDispatcher("homeTech.jsp").forward(request, response);
    }

    // Method to retrieve interventions from the database
    private List<Intervention> getInterventionsFromDatabase() {
        List<Intervention> interventions = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try {
            // Establish database connection (replace URL, username, and password with your database credentials)
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/gestion_mecanique", "root", "");
            
            // SQL query to select all interventions
            String sql = "SELECT * FROM interventions";
            stmt = conn.prepareStatement(sql);
            
            // Execute the query
            rs = stmt.executeQuery();
            
            // Process the result set
            while (rs.next()) {
                Intervention intervention = new Intervention();
                intervention.setCode(rs.getInt("code"));
                intervention.setMachine(rs.getString("machine"));
                intervention.setProbleme(rs.getString("probleme"));
                intervention.setStatut(rs.getInt("statut"));
                intervention.setCodeDem(rs.getString("code_dem"));
                intervention.setCodeTech(rs.getString("code_tech"));
                
                interventions.add(intervention);
            }
        } catch (SQLException e) {
        } finally {
            // Close the resources
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
            }
        }
        
        return interventions;
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve intervention code from the form submission
        String interventionCode = request.getParameter("code");

        // Update the status of the intervention in the database
        updateInterventionStatut(interventionCode);

        // Redirect back to the technician home page
        response.sendRedirect(request.getContextPath() + "/homeTech");
    }

    // Method to update the status of the intervention in the database
    private void updateInterventionStatut(String interventionCode) {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            // Establish a database connection
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/gestion_mecanique?useSSL=false", "root", "");

            // Update the status of the intervention
            String sql = "UPDATE interventions SET statut = 2 WHERE code = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, interventionCode);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle the exception
        } finally {
            // Close the database resources
            try {
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
                // Handle the exception
            }
        }
    }
}
