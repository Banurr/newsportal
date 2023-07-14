package bitlab.techorda.servlets;

import bitlab.techorda.db.DBConnector;
import bitlab.techorda.enitites.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(value = "/auth")
public class AuthorizationServlet extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("current_user");
        if(user != null)
        {
            response.sendRedirect("/home");
        }
        else
        {
            request.setAttribute("type",request.getParameter("id"));
            request.getRequestDispatcher("authorization.jsp").forward(request,response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        HttpSession session = request.getSession();
        String type = request.getParameter("tip");
        String redirect = "";
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        if(type.equals("0"))
        {
            User user = DBConnector.getUser(email,password);
            if(user != null)
            {
                session.setAttribute("current_user",user);
                redirect = "/home";
            }
            else
            {
                redirect = "/auth?id=0&error";
            }
        }
        else
        {
            String fullName = request.getParameter("fullname");
            DBConnector.addUser(email,password,fullName);
            redirect = "/auth?id=0";
        }
        response.sendRedirect(redirect);
    }
}
