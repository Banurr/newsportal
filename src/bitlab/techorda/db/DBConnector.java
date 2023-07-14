package bitlab.techorda.db;

import bitlab.techorda.enitites.Comment;
import bitlab.techorda.enitites.News;
import bitlab.techorda.enitites.NewsCategory;
import bitlab.techorda.enitites.User;

import java.sql.*;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;

import static java.time.LocalDateTime.now;

public class DBConnector
{
    private static Connection connection;

    static
    {
        try
        {
            Class.forName("org.postgresql.Driver");
            connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/JavaEE-bitlab",
                    "postgres",
                    "s63amg");
        } catch (Exception e)
        {
            e.printStackTrace();
        }
    }

    public static void updatePassword(long id,String password)
    {
        try
        {
            PreparedStatement preparedStatement = connection.prepareStatement("update users set password = ? where id = ?");
            preparedStatement.setString(1,password);
            preparedStatement.setLong(2,id);
            preparedStatement.executeUpdate();
            preparedStatement.close();
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }

    public static void addUser(String email, String password, String fullName)
    {
        try
        {
            PreparedStatement statement = connection.prepareStatement("insert into users(email,password,full_name,role_id) values(?,?,?,2)");
            statement.setString(1, email);
            statement.setString(2, password);
            statement.setString(3, fullName);
            statement.executeUpdate();
            statement.close();
        } catch (Exception e)
        {
            e.printStackTrace();
        }
    }

    public static void updateUserName(long id,String newname)
    {
        try
        {
            PreparedStatement preparedStatement = connection.prepareStatement("update users set full_name = ? where id = ?");
            preparedStatement.setString(1,newname);
            preparedStatement.setLong(2,id);
            preparedStatement.executeUpdate();
            preparedStatement.close();
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }

    public static User getUser(String email, String password)
    {
        User user = null;
        try
        {
            PreparedStatement statement = connection.prepareStatement("select * from users where email like ? and password like ?");
            statement.setString(1, email);
            statement.setString(2, password);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next())
            {
                user = new User();
                user.setId(Long.parseLong(resultSet.getString("id")));
                user.setEmail(resultSet.getString("email"));
                user.setFullName(resultSet.getString("full_name"));
                user.setPassword(resultSet.getString("password"));
                user.setRoleId(Integer.parseInt(resultSet.getString("role_id")));
            }
            statement.close();
        } catch (Exception e)
        {
            e.printStackTrace();
        }
        return user;
    }

    public static void updateNews(long id, long category_id, String newTitle, String newContent)
    {
        try
        {
            PreparedStatement preparedStatement = connection.prepareStatement("update newss set title = ? , content = ?,category_id = ? where id = ?");
            preparedStatement.setString(1, newTitle);
            preparedStatement.setString(2, newContent);
            preparedStatement.setLong(3, category_id);
            preparedStatement.setLong(4, id);
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (Exception e)
        {
            e.printStackTrace();
        }
    }

    public static void addNews(long id, String title, String content)
    {
        try
        {
            PreparedStatement preparedStatement = connection.prepareStatement("insert into newss(post_date,category_id,title,content) values(?,?,?,?)");
            preparedStatement.setTimestamp(1, Timestamp.valueOf(LocalDateTime.now()));
            preparedStatement.setLong(2, id);
            preparedStatement.setString(3, title);
            preparedStatement.setString(4, content);
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (Exception e)
        {
            e.printStackTrace();
        }
    }

    public static ArrayList<NewsCategory> getCategory()
    {
        ArrayList<NewsCategory> categories = new ArrayList<>();
        try
        {
            PreparedStatement preparedStatement = connection.prepareStatement("select * from news_categories");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next())
            {
                NewsCategory newsCategory = new NewsCategory();
                newsCategory.setId(resultSet.getLong("id"));
                newsCategory.setName(resultSet.getString("name"));
                categories.add(newsCategory);
            }
            preparedStatement.close();
        } catch (Exception e)
        {
            e.printStackTrace();
        }
        return categories;
    }


    public static News getNews(long id)
    {
        News news = null;
        try
        {
            PreparedStatement preparedStatement = connection.prepareStatement("select n.id as news_id,n.post_date,n.content,n.title,c.id as cat_id,c.name from newss as n inner join news_categories as c on c.id=n.category_id where n.id = ?");
            preparedStatement.setLong(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next())
            {
                news = new News();
                news.setId(resultSet.getLong("news_id"));
                news.setTitle(resultSet.getString("title"));
                news.setContent(resultSet.getString("content"));
                news.setPostDate(resultSet.getTimestamp("post_date"));
                NewsCategory category = new NewsCategory();
                category.setId(resultSet.getLong("cat_id"));
                category.setName(resultSet.getString("name"));
                news.setCategory(category);

            }
            preparedStatement.close();
        } catch (Exception e)
        {
            e.printStackTrace();
        }
        return news;
    }

    public static ArrayList<Comment> getComments(long id)
    {
        ArrayList<Comment> comments = new ArrayList<>();
        try
        {
            PreparedStatement preparedStatement = connection.prepareStatement("select c.id,c.comment,c.post_date,c.user_id,c.news_id , u.id, u.full_name from comments as c inner join users as u on u.id = c.user_id where news_id=?");
            preparedStatement.setLong(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next())
            {
                Comment comment = new Comment();
                comment.setId(resultSet.getLong("id"));
                comment.setComment(resultSet.getString("comment"));
                comment.setPostDate(resultSet.getTimestamp("post_date"));
                User user = new User();
                user.setId(resultSet.getLong("user_id"));
                user.setFullName(resultSet.getString("full_name"));
                comment.setUser(user);
                comments.add(comment);
            }
            preparedStatement.close();
        } catch (Exception e)
        {
            e.printStackTrace();
        }
        return comments;
    }

    public static void addComment(String[] ids, String text)
    {
        try
        {
            PreparedStatement preparedStatement = connection.prepareStatement("insert into comments(comment,post_date,user_id,news_id) values(?,?,?,?)");
            preparedStatement.setString(1, text);
            preparedStatement.setTimestamp(2, Timestamp.valueOf(LocalDateTime.now()));
            preparedStatement.setLong(3, Long.parseLong(ids[0]));
            preparedStatement.setLong(4, Long.parseLong(ids[1]));
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (Exception e)
        {
            e.printStackTrace();
        }
    }

    public static ArrayList<News> getAllNews()
    {
        ArrayList<News> news = new ArrayList<>();
        try
        {
            PreparedStatement preparedStatement = connection.prepareStatement("select n.id as news_id,n.post_date,n.content,n.title,c.id as cat_id,c.name from newss as n inner join news_categories as c on c.id=n.category_id");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next())
            {
                News news1 = new News();
                news1.setId(resultSet.getLong("news_id"));
                news1.setPostDate(resultSet.getTimestamp("post_date"));
                news1.setContent(resultSet.getString("content"));
                news1.setTitle(resultSet.getString("title"));
                NewsCategory newsCategory = new NewsCategory();
                newsCategory.setId(resultSet.getLong("cat_id"));
                newsCategory.setName(resultSet.getString("name"));
                news1.setCategory(newsCategory);
                news.add(news1);
            }
            preparedStatement.close();
        } catch (Exception e)
        {
            e.printStackTrace();
        }
        return news;
    }

    public static void deleteNews(long id)
    {
        try
        {
            PreparedStatement preparedStatement2 = connection.prepareStatement("delete from comments where news_id = ?");
            PreparedStatement preparedStatement = connection.prepareStatement("delete from newss where id=?");
            preparedStatement2.setLong(1,id);
            preparedStatement.setLong(1,id);
            preparedStatement2.executeUpdate();
            preparedStatement.executeUpdate();
            preparedStatement2.close();
            preparedStatement.close();
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
    public static void deleteComment(long id)
    {
        try
        {
            PreparedStatement preparedStatement = connection.prepareStatement("delete from comments where id=?");
            preparedStatement.setLong(1,id);
            preparedStatement.executeUpdate();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
}
