<%@ page import="java.util.ArrayList" %>
<%@ page import="bitlab.techorda.enitites.News" %><%--
  Created by IntelliJ IDEA.
  User: nurbolyermagambetov
  Date: 12.07.2023
  Time: 00:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="vendor/head.jsp"%>
    <title>HomePage</title>
</head>
<body>
<%@include file="vendor/navbar.jsp"%>
<div style="display:grid;grid-template-columns: repeat(3,1fr);grid-gap: 30px 10px;grid-auto-flow: row;margin: auto auto;width: 85%;justify-items: center;
  align-items: center;margin-top: 100px">
    <%
        ArrayList<News> news = (ArrayList<News>) request.getAttribute("list");
        if(news != null)
        {
            for(News news1 : news)
            {
    %>
    <div class="card" style="width: 90%">
        <h4 class="card-header"><%=news1.getTitle()%></h4>
        <div class="card-body">
            <h5 class="card-title">Category : <%=news1.getCategory().getName()%></h5>
            <p class="card-text"><%=news1.getContent().substring(0,40)+"..."%></p>
            <p class="card-text">posted at : <%=news1.getPostDate().toString().substring(0,16)%></p>
            <a href="/details?id=<%=news1.getId()%>" class="btn btn-primary">Read more</a>
        </div>
    </div>
    <%}}%>
</div>
</body>
</html>
