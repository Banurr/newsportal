package bitlab.techorda.enitites;

import java.util.Date;

public class Comment
{
    private long id;
    private String comment;
    private Date postDate;
    private User user;
    private News news;

    public Comment(){}

    public Comment(long id, String comment, Date postDate, User user, News news)
    {
        this.id = id;
        this.comment = comment;
        this.postDate = postDate;
        this.user = user;
        this.news = news;
    }

    public long getId()
    {
        return id;
    }

    public void setId(long id)
    {
        this.id = id;
    }

    public String getComment()
    {
        return comment;
    }

    public void setComment(String comment)
    {
        this.comment = comment;
    }

    public Date getPostDate()
    {
        return postDate;
    }

    public void setPostDate(Date postDate)
    {
        this.postDate = postDate;
    }

    public User getUser()
    {
        return user;
    }

    public void setUser(User user)
    {
        this.user = user;
    }

    public News getNews()
    {
        return news;
    }

    public void setNews(News news)
    {
        this.news = news;
    }
}
