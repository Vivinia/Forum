<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@page import="collect.collectSelect"%>
<%@page import="collect.collect"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'collect.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body background="image/failSuccess.jpg" style="font-family:'微软雅黑';color:#575757;">
    <%
    int id=Integer.parseInt(request.getParameter("id"));
    collectSelect collectinsert=new collectSelect();
    collect c=new collect();
    c.setCname((String)session.getAttribute("name"));
    c.setCfid(id);    
    int inertLine=collectinsert.insertCollect(c);
    if(inertLine>0){%>
    	<p align="right"><a href="http://localhost:8080/Forum/contentPage.jsp?id=<%=session.getAttribute("id") %>" target="_self" style="font-size:18px">退出</a>&nbsp;&nbsp;</p>
    	<p align="center" style="font-size:25px;margin-top:60px;">操作成功!</p>
    	<%} else{%>
    	<p align="right"><a href="http://localhost:8080/Forum/contentPage.jsp?id=<%=session.getAttribute("id") %>" target="_self" style="font-size:18px">退出</a>&nbsp;&nbsp;</p>
        <p align="center" style="font-size:25px;margin-top:60px;">操作失败!</p>
    	<%} %>
    <style type="text/css">
    	a{
    		text-decoration: none;
    		color:#FFFFFF;
    	}  
    	a:hover {
    		color:#CCCCCC;
    		text-decoration:underline;
    	} 	
    </style>	
  </body>
</html>
