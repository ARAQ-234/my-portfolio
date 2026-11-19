package adminController;

import java.io.IOException;
import DAO.BookDAOImpl;
import DB.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/delete_books")
public class BookDeleteController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // URL ကနေပါလာတဲ့ id ကို ယူမယ်
            int id = Integer.parseInt(req.getParameter("id"));

            BookDAOImpl dao = new BookDAOImpl(DBConnection.getConn());
            boolean f = dao.deleteBooks(id);

            HttpSession session = req.getSession();

            if (f) {
                session.setAttribute("succMsg", "Book Deleted Successfully");
            } else {
                session.setAttribute("failedMsg", "Something wrong on server");
            }
            
            // ဖျက်ပြီးရင် All Books list စာမျက်နှာကို ပြန်ပို့မယ်
            resp.sendRedirect("admin/all_books.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}