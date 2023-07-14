<%@ page import="bitlab.techorda.enitites.News" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="bitlab.techorda.enitites.Comment" %><%--
  Created by IntelliJ IDEA.
  User: nurbolyermagambetov
  Date: 12.07.2023
  Time: 15:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="vendor/head.jsp"%>
    <title>Details</title>
</head>
<body>
<%@include file="vendor/navbar.jsp"%>
<%
    News news = (News) request.getAttribute("novost");

%>
<div class="jumbotron mt-5" style="width : 80% ; margin : auto auto">
    <h1 class="display-4" style="font-weight: bold"><%=news.getTitle()%></h1>
    <hr class="my-4">
    <h3 class="mb-3"><b>Category : <%=news.getCategory().getName()%></b></h3>
    <div style="font-size : 40px;"><%=news.getContent()%></div>
    <hr class="my-4">
    <p>Posted at : <%=news.getPostDate().toString().substring(0,16)%></p>
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">Add comment</button>
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">

            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Adding new comment</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form action="/addcomment" method="post">
                <div class="modal-body">
                        <div class="form-group">
                            <label for="comment_text" class="col-form-label">Text of comment:</label>
                            <textarea class="form-control" id="comment_text" name="comment"></textarea>
                        </div>
                </div>
                <div class="modal-footer">
                    <input type="hidden" value="<%=user.getId()%> <%=news.getId()%>" name="info_id">
                    <button class="btn btn-primary">Send</button>
                </div>
                </form>
            </div>

        </div>
    </div>

</div>
<%
    ArrayList<Comment> comments = (ArrayList<Comment>) request.getAttribute("kommenty");
    if(comments != null)
    {
        for(Comment comment : comments)
        {
%>
<form action="/manage" method="post">
<div class="card mt-5 mb-3" style="width: 40%;margin-left: 150px">
    <h5 class="card-header">Comment from <b><%=comment.getUser().getFullName()%></b></h5>
    <div class="card-body">
        <h5 class="card-title"><%=comment.getComment()%></h5>
        <p class="card-text">posted at : <%=comment.getPostDate().toString().substring(0,16)%></p>
        <%
            if(user.getId()==1)
            {
        %>
        <input type="hidden" value="3" name="type_operation">
        <input type="hidden" value="<%=comment.getId()%>" name="comment_id">
        <input type="hidden" value="<%=news.getId()%>" name="post_id">
        <button class="btn btn-danger">Delete</button>
        <%}%>
    </div>
</div>
</form>
<%}}%>
</body>
</html>
