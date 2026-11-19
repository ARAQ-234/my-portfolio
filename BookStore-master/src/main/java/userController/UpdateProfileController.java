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

@SuppressWarnings("serial")
@WebServlet("/update_profile")
public class UpdateProfileController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            String name = req.getParameter("fname");
            String email = req.getParameter("email");
            String phoneNo = req.getParameter("phno"); // JSP က name="phno" နဲ့ ကိုက်အောင် ပြင်ထားသည်
            String password = req.getParameter("password");
            
            User us = new User();
            us.setId(id);
            us.setName(name);
            us.setEmail(email);
            us.setPhoneNo(phoneNo);
            
            HttpSession session = req.getSession();
            UserDAOImpl dao = new UserDAOImpl(DBConnection.getConn());
            
            // Password စစ်ခြင်း
            boolean f = dao.checkPassword(id, password);
            
            if (f) {
                boolean f2 = dao.updateProfile(us);
                if (f2) {
                    // Update အောင်မြင်ရင် Session ထဲက data ကိုပါ အသစ်လဲပေးရမည်
                    session.setAttribute("userobj", us); 
                    session.setAttribute("succMsg", "Profile Updated Successfully...");
                    resp.sendRedirect("edit_profile.jsp");
                } else {
                    session.setAttribute("failedMsg", "Something went wrong on Server...");
                    resp.sendRedirect("edit_profile.jsp");
                }
            } else {
                session.setAttribute("failedMsg", "Your Password is Incorrect");
                resp.sendRedirect("edit_profile.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}


