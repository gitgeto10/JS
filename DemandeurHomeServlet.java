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

@WebServlet("/homeDem")
public class DemandeurHomeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    List<Intervention> interventions = getInterventionsFromDatabase();
    
    request.setAttribute("interventions", interventions);
    request.getRequestDispatcher("homeDem.jsp").forward(request, response);
}

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String machineName = request.getParameter("machineName");
        String problem = request.getParameter("problem");

        // Insert the new intervention into the database
        insertIntervention(machineName, problem);

        // Redirect back to the home page
        response.sendRedirect(request.getContextPath() + "/homeDem");
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
            e.printStackTrace();
        } finally {
            // Close the resources
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return interventions;
    }

    // Method to insert a new intervention into the database
    private void insertIntervention(String machineName, String problem) {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            // Establish database connection (replace URL, username, and password with your database credentials)
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/gestion_mecanique", "root", "");

            // SQL query to insert the new intervention
            String sql = "INSERT INTO interventions (machine, probleme, statut) VALUES (?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, machineName);
            stmt.setString(2, problem);
            // Assuming statut is a default value or can be set based on certain conditions
            stmt.setInt(3, 1); // Change 1 to the appropriate value

            // Execute the query
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Close the resources
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
