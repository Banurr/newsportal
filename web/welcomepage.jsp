<%--
  Created by IntelliJ IDEA.
  User: nurbolyermagambetov
  Date: 12.07.2023
  Time: 02:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <%@include file="vendor/head.jsp"%>
    <title>Welcome!</title>
</head>
<body>
<%@include file="vendor/navbar.jsp"%>
<div class="jumbotron">
  <h1 class="display-4">Welcome to the CHETAM ? NEWS</h1>
  <p class="lead">This is a informational news site , a simple design for understanding , but pretty informative and interesting. We find and union all hot news from all over the world and show to you</p>
  <hr class="my-4">
  <p>Here you need to authorize , choose your way</p>
  <a class="btn btn-primary btn-lg" href="/auth?id=0">Log in</a>
  <a class="btn btn-success btn-lg" href="/auth?id=1">Register</a>
</div>
</body>
</html>
