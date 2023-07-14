package bitlab.techorda.servlets;

import bitlab.techorda.db.DBConnector;
import bitlab.techorda.enitites.Comment;
import bitlab.techorda.enitites.News;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(value = "/details")
public class DetailsServlet extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        long id = Long.parseLong(request.getParameter("id"));
        News news = DBConnector.getNews(id);
        ArrayList<Comment> comments = DBConnector.getComments(id);
        if(news != null)
        {
            request.setAttribute("kommenty",comments);
            request.setAttribute("novost",news);
            request.getRequestDispatcher("details.jsp").forward(request,response);
        }
        request.getRequestDispatcher("nosuchnews.jsp").forward(request,response);

    }
}
