<%@ page import="bitlab.techorda.enitites.User" %><%
    User user = (User) session.getAttribute("current_user");
%>
<nav class="navbar bg-dark navbar-dark">
    <a class="navbar-brand ms-5" style="color : white" href="/welcome"><b>CHETAM ? NEWS.COM</b></a>
    <%
      if(user != null && user.getId()==1)
      {

    %>
    <a class="btn btn-primary" href="/manage" style="margin-right: 200px">Manage Panel</a>
    <%}%>
    <%
        if(user != null)
        {
    %>
    <div class="dropdown" style="margin-right: 100px">
        <button class="btn btn-info dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <%=user.getFullName()%>
        </button>
        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
            <a class="dropdown-item" href="/profile">My profile</a>
            <hr style="border: none;
  height: 1px;
  /* Set the hr color */
  color: #333;  /* old IE */
  background-color: #333;  /* Modern Browsers */;width: 140px">
            <form action="/signout" method="post">
            <button class="dropdown-item" >Log out</button>
            </form>
        </div>
    </div>
<%
    }
%>
</nav>
