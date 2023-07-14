<%@ page import="java.util.Enumeration" %><%--
  Created by IntelliJ IDEA.
  User: nurbolyermagambetov
  Date: 12.07.2023
  Time: 01:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="vendor/head.jsp"%>
    <title>Authorization</title>
</head>
<body>
<%@include file="vendor/navbar.jsp"%>
<%
    String error = request.getParameter("error"); //not working???
    if(error != null)
    {
%>
<div class="alert alert-danger alert-dismissible fade show" role="alert" style="margin : 100px auto -80px auto;width : 30%">
    <strong>Oops!</strong> Please check your email and password
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
</div>
<%}%>
<%
    String type = request.getAttribute("type").toString();
    if(type.equals("1"))
    {
%>
<div class="card" style="width: 30%;margin: 50px auto auto">
    <h5 class="card-header" style="text-align: center"><b>REGISTER</b></h5>
    <div class="card-body">
        <form action="/auth" method="post">
            <div class="form-group" style="margin: auto auto">
                <label for="exampleInputEmail1">Email address</label>
                <input type="email" class="form-control" id="exampleInputEmail0" name="email">
            </div>
            <div class="form-group">
                <label for="fullname">Your Name</label>
                <input type="text" class="form-control" id="fullname" name="fullname">
            </div>
            <div class="form-group">
                <label for="exampleInputPassword1">Password</label>
                <input type="password" class="form-control" id="exampleInputPassword0" name="password">
            </div>
            <input type="hidden" value="1" name="tip">
            <button type="submit" class="btn btn-primary">Confirm</button>
        </form>
    </div>
</div>

<%
    }
    else
    {
%>
<div class="card" style="width: 30%;margin: 100px auto auto">
    <h5 class="card-header" style="text-align: center"><b>LOGIN</b></h5>
    <div class="card-body">
        <form action="/auth" method="post">
            <div class="form-group" style="margin: auto auto">
                <label for="exampleInputEmail1">Email address</label>
                <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="email">
            </div>
            <div class="form-group">
                <label for="exampleInputPassword1">Password</label>
                <input type="password" class="form-control" id="exampleInputPassword1" name="password">
            </div>
            <input type="hidden" value="0" name="tip">
            <button class="btn btn-primary">Confirm</button>
        </form>
    </div>
</div>

<%
    }
%>
</body>
</html>
