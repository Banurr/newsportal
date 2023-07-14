package bitlab.techorda.servlets;

import bitlab.techorda.db.DBConnector;
import bitlab.techorda.enitites.News;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(value = "/home")
public class HomeServlet extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        ArrayList<News> news = DBConnector.getAllNews();
        request.setAttribute("list",news);
        request.getRequestDispatcher("homepage.jsp").forward(request,response);
    }
}
