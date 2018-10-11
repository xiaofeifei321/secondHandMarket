<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2017/5/12
  Time: 11:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>北理工二手工坊</title>
    <link rel="icon" href="<%=basePath%>img/logo.jpg" type="image/x-icon"/>
    <META HTTP-EQUIV="Refresh" CONTENT="0;URL=<%=basePath%>goods/homeGoods">
</head>
<body>
</body>
</html>
