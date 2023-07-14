package bitlab.techorda.servlets;

import bitlab.techorda.db.DBConnector;
import bitlab.techorda.enitites.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(value = "/welcome")
public class WelcomeServlet extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("current_user");
        if(user != null)
        {
            request.setAttribute("list", DBConnector.getAllNews());
            request.getRequestDispatcher("homepage.jsp").forward(request,response);
        }
        request.getRequestDispatcher("welcomepage.jsp").forward(request,response);
    }
}
