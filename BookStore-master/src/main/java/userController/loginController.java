package userController;

import java.io.IOException;

import DAO.UserDAOImpl;
import DB.DBConnection;
import entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class loginController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            HttpSession session = req.getSession();

            String email = req.getParameter("email");
            String password = req.getParameter("password");
			String adminEmail = setting("ADMIN_EMAIL", "admin@gmail.com");
			String adminPassword = setting("ADMIN_PASSWORD", "admin123");

            if (adminEmail.equals(email) && adminPassword.equals(password)) {
                User us = new User();
                us.setName("Admin");
                session.setAttribute("userobj", us);
                resp.sendRedirect(req.getContextPath() + "/admin/home.jsp");
                return;
            } else {
				UserDAOImpl dao = new UserDAOImpl(DBConnection.getConn());
                User us = dao.login(email, password);
                if (us != null) {
                    session.setAttribute("userobj", us);
                    resp.sendRedirect(req.getContextPath() + "/index.jsp");
                    return;
                } else {
                    session.setAttribute("failedMsg", "Email and Password Invalid");
                    resp.sendRedirect(req.getContextPath() + "/login.jsp");
                    return;
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

	private static String setting(String name, String fallback) {
		String value = System.getProperty(name);
		if (value == null || value.isBlank()) value = System.getenv(name);
		return value == null || value.isBlank() ? fallback : value;
	}
}
