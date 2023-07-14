package bitlab.techorda.enitites;

public class User
{
    private long id;
    private String fullName;
    private String email;
    private String password;
    private int roleId;

    public long getId()
    {
        return id;
    }

    public void setId(long id)
    {
        this.id = id;
    }

    public String getFullName()
    {
        return fullName;
    }

    public void setFullName(String fullName)
    {
        this.fullName = fullName;
    }

    public String getEmail()
    {
        return email;
    }

    public void setEmail(String email)
    {
        this.email = email;
    }

    public String getPassword()
    {
        return password;
    }

    public void setPassword(String password)
    {
        this.password = password;
    }

    public int getRoleId()
    {
        return roleId;
    }

    public void setRoleId(int roleId)
    {
        this.roleId = roleId;
    }

    public User(){}

    public User(long id, String fullName, String email, String password, int roleId)
    {
        this.id = id;
        this.fullName = fullName;
        this.email = email;
        this.password = password;
        this.roleId = roleId;
    }
}
