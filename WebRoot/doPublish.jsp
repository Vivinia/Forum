<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@page import="publish.forumClassify"%>
<%@page import="publish.classifySelect"%>
<%@page import="publish.insertForum"%>
<%@page import="forum.forum"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'doPublish.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body background="image/duzheluntan2.jpg" style="font-family:'ºÚÌå'">
  	<%
  	request.setCharacterEncoding("gbk");  	
  	String Publishtitle=request.getParameter("PublishTitle");
  	String Publishclassify=request.getParameter("PublishClassify");
  	String Publishcontent=request.getParameter("PublishContent");
  	forum fr=new forum();
  	fr.setForumcreator((String)session.getAttribute("name"));
  	fr.setForumtitle(Publishtitle);
  	fr.setForumclassid(Integer.parseInt(Publishclassify));
  	fr.setForumcontent(Publishcontent);
    insertForum forum=new insertForum();
  	if(forum.insert(fr)>0){ 
        response.sendRedirect("forumPage.jsp?page=1"); 
  	}else{ 
        response.sendRedirect("publish.jsp"); 
 	} 
  	%>
    <style type="text/css">
    	a{
    		text-decoration: none;   		
    	}
    </style>
  </body>
</html>
