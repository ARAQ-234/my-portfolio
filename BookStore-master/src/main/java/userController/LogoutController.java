package userController;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/logout")
public class LogoutController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // လက်ရှိရှိနေတဲ့ session ကို ယူမယ်
            HttpSession session = req.getSession();
            
            // session ထဲက userobj ကို ဖယ်ထုတ်မယ် (သို့မဟုတ်) session တစ်ခုလုံးကို ဖျက်လိုက်မယ်
            session.removeAttribute("userobj");
            
            // Logout ဖြစ်သွားပြီဆိုတဲ့ Message ပြချင်ရင် session အသစ်ထဲ ထည့်နိုင်ပါတယ်
            HttpSession session2 = req.getSession();
            session2.setAttribute("succMsg", "Logout Successfully");
            
            // Login page ကို ပြန်ပို့မယ်
            resp.sendRedirect("index.jsp");
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
	
	

