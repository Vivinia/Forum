<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body background="image/else.jpg" style="font-family:'微软雅黑';color:#575757">
  	<br>
  	<p align="center" style="font-size:30px">论坛介绍</p>
    <p style="font-size:25px;margin-left:20px;">一.论坛简介</p>
    <p style="font-size:18px;margin-left:20px;">	读者论坛是针对爱好读书的人建立的一个广泛性交流平台，人们可以在论坛内探讨读书心得，分享读书知识，请教读书问题，使爱好读书的人一起学习一起进步。</p>
    <p style="font-size:25px;margin-left:20px;">二.论坛分类</p>
    <p style="font-size:18px;margin-left:20px;">	读者论坛是一个涵盖范围广的交流平台，其中分为学科、名著、小说、心理、科技、论文、古籍、外文等八大类，里边包含各种文章与点评，为读者提供更好的阅读心得。</p>
    <p style="font-size:25px;margin-left:20px;">三.论坛要求</p>
    <p style="font-size:18px;margin-left:20px;">	读者论坛是一个积极上进的交流平台，书友间应互相尊重并良好交流书籍知识，不能用任何语言文字辱骂别人，更不能发表任何对他人对社会造成消极影响的言论。</p>
  </body>
</html>
