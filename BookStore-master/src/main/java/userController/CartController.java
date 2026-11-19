package userController;

import java.io.IOException;
import DAO.BookDAOImpl;
import DAO.CartDAOImpl;
import DB.DBConnection;
import entity.BookDtls;
import entity.Cart;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/cart")
public class CartController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            String bidParam = req.getParameter("bid");
            String uidParam = req.getParameter("uid");
            String page = req.getParameter("page"); 

            if (bidParam != null && uidParam != null && !bidParam.isEmpty() && !uidParam.isEmpty()) {
                
                int bid = Integer.parseInt(bidParam);
                int uid = Integer.parseInt(uidParam);

                BookDAOImpl dao = new BookDAOImpl(DBConnection.getConn());
                BookDtls b = dao.getBookById(bid);
                
                if(b == null) {
                    resp.sendRedirect("index.jsp");
                    return;
                }

                Cart c = new Cart();
                c.setBid(bid);
                c.setUid(uid);
                c.setBookName(b.getBookName());
                c.setAuthor(b.getAuthor());
                
                String priceStr = b.getPrice().replaceAll("[^0-9.]", "");
                double price = Double.parseDouble(priceStr);
                c.setPrice(price);
                c.setTotalPrice(price);

                CartDAOImpl dao2 = new CartDAOImpl(DBConnection.getConn());
                boolean f = dao2.addCart(c);

                HttpSession session = req.getSession();
                
                if (f) {
                    session.setAttribute("addCart", "Book Added to Cart");
                    
                    if ("old".equals(page)) {
                        resp.sendRedirect("all_old_book.jsp");
                    } else if ("new".equals(page)) {
                        resp.sendRedirect("all_new_book.jsp");
                    } else if ("recent".equals(page)) {
                        resp.sendRedirect("all_recent_book.jsp");
                    } else {
                        resp.sendRedirect("index.jsp");
                    }
                    // ------------------------------------------
                    
                } else {
                    session.setAttribute("failed", "Something went wrong on server");
                    resp.sendRedirect("index.jsp");
                }
            } else {
                resp.sendRedirect("index.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}