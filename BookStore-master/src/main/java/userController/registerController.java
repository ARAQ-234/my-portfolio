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

@WebServlet("/register")
public class registerController extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String name=req.getParameter("fname");
			String email=req.getParameter("email");
			String phoneNo=req.getParameter("phoneNo");
			String password=req.getParameter("password");
			String check=req.getParameter("check");
			
			//System.out.println(name+"  "+email+"  "+phoneNo+"  "+password+"  "+check);
			
			User us=new User();
			us.setName(name);
			us.setEmail(email);
			us.setPhoneNo(phoneNo);
			us.setPassword(password);
			
			HttpSession session=req.getSession();
			
			if(check!=null)
			{
				UserDAOImpl dao=new UserDAOImpl(DBConnection.getConn());
				boolean f= dao.userRegister(us);
				if(f) {
					//System.out.println("User Register Success..");
					session.setAttribute("succMsg","Registration Successfully...");
					resp.sendRedirect("register.jsp");
					
				}
				else {
					//System.out.println("Somting Wrong on Server..");
					session.setAttribute("failedMsg","Somting Wrong on Server...");
					resp.sendRedirect("register.jsp");
				}
			}
			else {
				//System.out.println("Please Check Agree & Terms Condition");
				session.setAttribute("failedMsg","Please Check Agree & Terms Condition");
				resp.sendRedirect("register.jsp");
			}
			
		} catch (Exception e) {
			
		}
	
	
	}
}
