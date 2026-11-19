package userController;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import DAO.CartDAOImpl;
import DAO.OrderImpl;
import DB.DBConnection;
import entity.Book_order;
import entity.Cart;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/order")
public class OrderController extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			HttpSession session = req.getSession();

			int id = Integer.parseInt(req.getParameter("id"));

			String name = req.getParameter("username");

			String email = req.getParameter("email");

			String phno = req.getParameter("phoneNo");

			String address = req.getParameter("address");

			String landmark = req.getParameter("landmark");

			String city = req.getParameter("city");

			String payment = req.getParameter("payment");

			String fullAdd = address + "," + landmark + "," + city;

//			System.out.println(name+" "+email+" "+phno+" "+fullAdd+" "+payment);

			CartDAOImpl dao = new CartDAOImpl(DBConnection.getConn());
			List<Cart> bList = dao.getBookByUser(id);

			if (bList.isEmpty()) {
				resp.sendRedirect("checkout.jsp");
			} else {
				OrderImpl dao2 = new OrderImpl(DBConnection.getConn());
				int i = dao2.getOrderNo();

				ArrayList<Book_order> orderList = new ArrayList<Book_order>();
				for (Cart c : bList) {
					Book_order o = new Book_order();
					o.setOrderId("BOOK-ORD-00" + i);
					o.setUserName(name);
					o.setEmail(email);
					o.setPhno(phno);
					o.setFulladd(fullAdd);
					o.setBookName(c.getBookName());
					o.setAuthor(c.getAuthor());
					o.setPrice(c.getPrice() + "");
					o.setPayment(payment);
					orderList.add(o);
					i++;
				}

				if ("noselect".equals(payment)) {
					session.setAttribute("failedMsg", "Choose Payment Method");
					resp.sendRedirect("checkout.jsp");
				} else {
					boolean f = dao2.saveOrder(orderList);
					if (f) {
						resp.sendRedirect("order_success.jsp");
					} else {
						session.setAttribute("failedMsg", "Something went wrong on server");
						resp.sendRedirect("checkout.jsp");
					}
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
