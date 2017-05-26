<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>This is firstPage.</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body background="image/firstPage.jpg">   
  <%session.setAttribute("name",null); %>
  	<table align="right" style="font-family:'微软雅黑';color:#D6D6D6">
  		<tr>
  			<td><a href="http://localhost:8080/Forum/forumPage.jsp?page=1" target="_top">进入论坛</a></td>
  			<td>|</td>
  			<td><a href="http://localhost:8080/Forum/login.jsp" target="_top">用户登录</a></td>
  			<td>|</td>
  			<td><a href="http://localhost:8080/Forum/register.jsp" target="_top">用户注册</a></td>
  			<td>|</td>
  			<td><a href="http://localhost:8080/Forum/index.jsp" target="_blank">论坛介绍</a></td>
  		</tr>
  	</table> 
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
