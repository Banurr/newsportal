package bitlab.techorda.servlets;

import bitlab.techorda.db.DBConnector;
import bitlab.techorda.enitites.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(value = "/profile")
public class ProfileServlet extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("current_user");
        if(user != null)
        {
            request.getRequestDispatcher("profile.jsp").forward(request,response);
        }
        response.sendRedirect("/");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String redirect = "";
        HttpSession session = request.getSession();
        String type = request.getParameter("type_operation");
        User user = (User) session.getAttribute("current_user");
        if (type.equals("0"))
        {
            long id = Long.parseLong(request.getParameter("user_id"));
            String newname = request.getParameter("newname");
            String password = request.getParameter("password");

            if(user.getPassword().equals(password))
            {
                DBConnector.updateUserName(id,newname);
                user.setFullName(newname);
                request.getRequestDispatcher("profile.jsp").forward(request,response);
            }
            else
            {
                redirect = "profile?error";
            }
        }
        else
        {
            long id = Long.parseLong(request.getParameter("user_id"));
            String oldpassword = request.getParameter("oldpassword");
            String newpassword = request.getParameter("newpassword");
            String newpassword2 = request.getParameter("newpassword2");
            if(!newpassword2.equals(newpassword))
            {
                redirect = "profile?error2";
            }
            else
            {
                if(user.getPassword().equals(oldpassword))
                {
                    DBConnector.updatePassword(id,newpassword);
                    session.removeAttribute("current_user");
                    redirect = "welcome";
                }
                else
                {
                    redirect = "profile?error3";
                }
            }
        }
        response.sendRedirect(redirect);
    }
}
