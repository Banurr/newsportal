package bitlab.techorda.servlets;

import bitlab.techorda.db.DBConnector;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(value = "/addcomment")
public class AddCommentServlet extends HttpServlet
{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String[] ids = request.getParameter("info_id").split(" ");
        String text = request.getParameter("comment");
        DBConnector.addComment(ids,text);
        response.sendRedirect("/details?id="+ids[1]);
    }
}
