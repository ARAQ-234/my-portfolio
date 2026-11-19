package userController;

import java.io.IOException;

import DAO.CartDAOImpl;
import DB.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/remove_book")
public class RemoveBookCartController extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    String cidParam = req.getParameter("cid"); // bid အစား cid ကို ယူမယ်

	    if (cidParam != null) {
	        int cid = Integer.parseInt(cidParam);
	        
	        CartDAOImpl dao = new CartDAOImpl(DBConnection.getConn());
	        boolean f = dao.deleteBook(cid); // cid နဲ့ ဖျက်မယ်

	        HttpSession session = req.getSession();
	        if (f) {
	            session.setAttribute("succMsg", "Book Removed from Cart");
	            resp.sendRedirect("checkout.jsp");
	        } else {
	            session.setAttribute("failedMsg", "Something wrong on server");
	            resp.sendRedirect("checkout.jsp");
	        }
	    }
	}
		
	}

	
	

