package bitlab.techorda.enitites;

import java.util.Date;

public class News
{
    private long id;
    private Date postDate;
    private NewsCategory category;
    private String title;
    private String content;

    public News(){}

    public News(long id, Date postDate, NewsCategory category, String title, String content)
    {
        this.id = id;
        this.postDate = postDate;
        this.category = category;
        this.title = title;
        this.content = content;
    }

    public long getId()
    {
        return id;
    }

    public void setId(long id)
    {
        this.id = id;
    }

    public Date getPostDate()
    {
        return postDate;
    }

    public void setPostDate(Date postDate)
    {
        this.postDate = postDate;
    }

    public NewsCategory getCategory()
    {
        return category;
    }

    public void setCategory(NewsCategory category)
    {
        this.category = category;
    }

    public String getTitle()
    {
        return title;
    }

    public void setTitle(String title)
    {
        this.title = title;
    }

    public String getContent()
    {
        return content;
    }

    public void setContent(String content)
    {
        this.content = content;
    }
}
