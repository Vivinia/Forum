<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@page import="traceForum.traceInsert"%>
<%@page import="traceForum.trace"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'doTraceForum.jsp' starting page</title>
    
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
    int tfid=Integer.parseInt(request.getParameter("traceId"));
    String tcontent=request.getParameter("tcontent");
    trace t=new trace();
    t.setTcreator((String)session.getAttribute("name"));
    t.setTfid(tfid);
    t.setTcontent(tcontent);       
    traceInsert traceinsert=new traceInsert();
    if(traceinsert.insert(t)>0)
    	request.getRequestDispatcher("success.jsp").forward(request,response);
    else
    	request.getRequestDispatcher("fail.jsp").forward(request,response);
     %>
     
  </body>
</html>
