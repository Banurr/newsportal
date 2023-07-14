<%@ page import="java.util.ArrayList" %>
<%@ page import="bitlab.techorda.enitites.News" %>
<%@ page import="bitlab.techorda.enitites.NewsCategory" %><%--
  Created by IntelliJ IDEA.
  User: nurbolyermagambetov
  Date: 13.07.2023
  Time: 12:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="vendor/head.jsp"%>
    <title>Manage Panel</title>
</head>
<body>
<%@include file="vendor/navbar.jsp"%>
<%
    ArrayList<News> news = (ArrayList<News>) request.getAttribute("list");
    ArrayList<NewsCategory> categories = (ArrayList<NewsCategory>) request.getAttribute("kategory");
%>
<button type="button" class="btn btn-success mt-4 ml-4 mb-4" data-toggle="modal" data-target="#exampleModal"> + Add news</button>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <form action="/manage" method="post">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Add news</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="recipient-name">Title</label>
                        <input type="text" class="form-control" id="recipient-name" name="title" style="width : 70%" required>
                    </div>
                    <div class="form-group">
                        <label for="message-text" class="col-form-label">Content</label>
                        <input style="width: 70%;height : 80px" class="form-control" id="message-text" name="content" minlength="50" required>
                    </div>
                    <div class="form-group" style="width:70%">
                        <label for="city" class="my-1 mr-sm-2 mt-3">Category</label>
                        <select class="custom-select my-1 mr-sm-2" id="city" name="category">
                            <%
                                if(categories != null)
                                {
                                    for(NewsCategory category : categories)
                                    {

                            %>
                            <option value="<%=category.getId()%>"><%=category.getName()%></option>
                            <%}}%>
                        </select>

                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <input name="type_operation" type="hidden" value="0">
                    <button class="btn btn-success">Add</button>
                </div>
            </div>
        </div>
    </form>
</div>
<table class="table table-striped">
    <thead>
    <tr>
        <th scope="col">ID</th>
        <th scope="col">TITLE</th>
        <th scope="col">CATEGORY</th>
        <th scope="col">POST DATE</th>
        <th scope="col">DETAILS</th>
    </tr>
    </thead>
    <%
        if(news!=null)
        {
            for(News n : news)
            {
    %>
    <tr>
        <th><%=n.getId()%></th>
        <th><%=n.getTitle()%></th>
        <th><%=n.getCategory().getName()%></th>
        <th><%=n.getPostDate().toString().substring(0,16)%></th>
        <th><button class="btn btn-primary" data-toggle="modal" data-target="#aaa<%=n.getId()%>">Details</button></th>
        <div class="modal fade" id="aaa<%=n.getId()%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <form action="/manage" method="post">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="g">Modifying</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="t<%=n.getId()%>">New title</label>
                                <input type="text" class="form-control" id="t<%=n.getId()%>" name="newtitle" style="width : 70%" value="<%=n.getTitle()%>" required>
                            </div>
                            <div class="form-group">
                                <label for="c<%=n.getId()%>">New content</label>
                                <input class="form-control" id="c<%=n.getId()%>" name="newcontent" style="height : 80px;width : 70%" minlength="50" required value="<%=n.getContent()%>">
                            </div>
                            <div class="form-group" style="width:70%">
                                <label for="city<%=n.getId()%>" class="my-1 mr-sm-2 mt-3">New category</label>
                                <select class="custom-select my-1 mr-sm-2" id="city<%=n.getId()%>" name="newcategory">
                                    <%
                                        if(categories != null)
                                        {
                                            for(NewsCategory category1 : categories)
                                            {
                                                if(category1.getId()==n.getCategory().getId())
                                                {
                                    %>
                                    <option value="<%=category1.getId()%>" selected><%=category1.getName()%></option>
                                    <%
                                        }
                                                else {
                                    %>
                                    <option value="<%=category1.getId()%>"><%=category1.getName()%></option>
                                    <%}}}%>
                                </select>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="hidden" value="<%=n.getId()%>" name="aidi">
                            <input name="type_operation" type="hidden" value="1">
                            <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#deletion<%=n.getId()%>">Delete</button>
                            <button class="btn btn-primary">Update</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <div class="modal fade" id="deletion<%=n.getId()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">YOU WILL DELETE THIS NEWS</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        ARE YOU SURE?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <form method="post" action="/manage">
                            <input name="iddd" type="hidden" value="<%=n.getId()%>">
                            <input name="type_operation" type="hidden" value="2">
                            <button class="btn btn-danger">Delete</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <%}}%>
    </tr>
    <tbody>
</table>
</body>
</html>
