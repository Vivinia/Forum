<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@page import="delete.deleteTitle"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'doDeleteTitle.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <%
    request.setCharacterEncoding("gbk");
    int deleteId=Integer.parseInt(request.getParameter("id"));
    deleteTitle delete=new deleteTitle();
    int line=delete.delete(deleteId);
    if(line>0)
    	request.getRequestDispatcher("forumPage.jsp?page=1").forward(request,response);
    else
    	request.getRequestDispatcher("").forward(request,response);    
     %>
  </body>
</html>
