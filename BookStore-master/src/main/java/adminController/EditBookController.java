package adminController;

import java.io.IOException;
import java.security.KeyStore.PrivateKeyEntry;

import DAO.BookDAOImpl;
import DB.DBConnection;
import entity.BookDtls;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@WebServlet("/edit_books")
public class EditBookController extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id=Integer.parseInt(req.getParameter("id"));
			String bookName = req.getParameter("bname");
			String author = req.getParameter("author");
			String price = req.getParameter("price");
			String categories = req.getParameter("categories");
			String status = req.getParameter("status");
			
			BookDtls b=new BookDtls();
			b.setBookId(id);
			b.setBookName(bookName);
			b.setAuthor(author);
			b.setPrice(price);
			b.setStatus(status);
			
			BookDAOImpl dao=new BookDAOImpl(DBConnection.getConn());
			boolean f=dao.updateEditBooks(b);
			
			HttpSession session=req.getSession();
			if(f) {
				session.setAttribute("succMsg", "Book Update Successfully..");
				resp.sendRedirect("admin/all_books.jsp");
				return;
			}
			else {
				session.setAttribute("failedMsg", "Something wrong on Server");
				resp.sendRedirect("admin/all_books.jsp");
				return;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
