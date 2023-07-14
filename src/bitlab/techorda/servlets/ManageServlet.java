package bitlab.techorda.servlets;

import bitlab.techorda.db.DBConnector;
import bitlab.techorda.enitites.News;
import bitlab.techorda.enitites.NewsCategory;
import bitlab.techorda.enitites.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(value = "/manage")
public class ManageServlet extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("current_user");
        ArrayList<News> news = DBConnector.getAllNews();
        ArrayList<NewsCategory> categories = DBConnector.getCategory();
        request.setAttribute("list",news);
        request.setAttribute("kategory",categories);
        if(user.getId()==1)
        {
            request.getRequestDispatcher("manage.jsp").forward(request,response);
        }
        else
        {
            response.sendRedirect("/home");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String type = request.getParameter("type_operation");
        String redirect = "/manage";
        switch (type)
        {
            case "0" ->
            {
                String title = request.getParameter("title");
                String content = request.getParameter("content");
                long id = Long.parseLong(request.getParameter("category"));
                DBConnector.addNews(id, title, content);
                break;
            }
            case "1" ->
            {
                String newTitle = request.getParameter("newtitle");
                String newContent = request.getParameter("newcontent");
                long id = Long.parseLong(request.getParameter("aidi"));
                long category_id = Long.parseLong(request.getParameter("newcategory"));
                DBConnector.updateNews(id, category_id, newTitle, newContent);
                break;
            }
            case "2" ->
            {
                long id = Long.parseLong(request.getParameter("iddd"));
                DBConnector.deleteNews(id);
                break;
            }
            case "3" ->
            {
                long id = Long.parseLong(request.getParameter("post_id"));
                long comment_id = Long.parseLong(request.getParameter("comment_id"));
                DBConnector.deleteComment(comment_id);
                redirect = "/details?id="+id;
                break;
            }
        }
        response.sendRedirect(redirect);
    }
}
