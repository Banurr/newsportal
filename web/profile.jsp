<%--
  Created by IntelliJ IDEA.
  User: nurbolyermagambetov
  Date: 14.07.2023
  Time: 00:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="vendor/head.jsp"%>
    <title>Profile</title>
</head>
<body>
<%@include file="vendor/navbar.jsp"%>
<%
    String error = request.getParameter("error");
    if(error != null)
    {
%>
<div class="alert alert-danger alert-dismissible fade show" role="alert" style="margin : 100px auto -80px auto;width : 30%">
    <strong>Error occured!!</strong> Please write down password correctly!
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
</div>
<%}%>
<%
    String error2 = request.getParameter("error2");
    if(error2 != null)
    {
%>
<div class="alert alert-danger alert-dismissible fade show" role="alert" style="margin : 100px auto -80px auto;width : 30%">
    <strong>Error occured!!</strong> New passwords are not matching!
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
</div>
<%}%>
<%
    String error3 = request.getParameter("error3");
    if(error3 != null)
    {
%>
<div class="alert alert-danger alert-dismissible fade show" role="alert" style="margin : 100px auto -80px auto;width : 30%">
    <strong>Error occured!!</strong> Old password is not correct!
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
</div>
<%}%>
<div class="card" style="width: 30%;margin: 100px auto auto">
    <div class="card-header">
        <b>Your Profile</b>
    </div>
    <div class="card-body">
        <h5 class="card-title">Your name is : <%=user.getFullName()%></h5>
        <p class="card-text">Your email is : <%=user.getEmail()%></p>
        <button class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">Change name</button><button class="btn btn-danger" style="margin-left: 30px" data-toggle="modal" data-target="#exampleModal2">Change password</button>
    </div>
</div>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <form action="/profile" method="post">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Updating name</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="message-text1" class="col-form-label">Enter new Name</label>
                        <input style="width: 70%" class="form-control" id="message-text1" name="newname" required>
                    </div>
                    <div class="form-group">
                        <label for="message-text" class="col-form-label">Enter your password</label>
                        <input style="width: 70%;" class="form-control" id="message-text" name="password" required>
                    </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <input name="user_id" type="hidden" value="<%=user.getId()%>">
                    <input name="type_operation" type="hidden" value="0">
                    <button class="btn btn-success">Update</button>
                </div>
            </div>
        </div>
        </div>
    </form>
</div>
<div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel3" aria-hidden="true">
    <form action="/profile" method="post">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel3">Updating password</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="message-text4" class="col-form-label">Enter old password</label>
                        <input style="width: 70%" class="form-control" id="message-text4" name="oldpassword" required type="password">
                    </div>
                    <div class="form-group">
                        <label for="message-text5" class="col-form-label">Enter new password</label>
                        <input style="width: 70%;" class="form-control" id="message-text5" name="newpassword" required type="password">
                    </div>
                    <div class="form-group">
                        <label for="message-text6" class="col-form-label">Enter new password again</label>
                        <input style="width: 70%;" class="form-control" id="message-text6" name="newpassword2" required type="password">
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <input name="user_id" type="hidden" value="<%=user.getId()%>">
                        <input name="type_operation" type="hidden" value="1">
                        <button class="btn btn-success">Update</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
</body>
</html>
