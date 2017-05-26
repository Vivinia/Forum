<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@page import="register.userInsert"%>
<%@page import="register.user"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'doRegister.jsp' starting page</title>
    
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
  	
  	String Username=request.getParameter("UserName");
  	String Userpass=request.getParameter("UserPass");
  	String Usersex=request.getParameter("UserSex");
  	String Useremail=request.getParameter("UserEmail");
  	String Userbirthday=request.getParameter("UserBirthday");
  	String Useraddress=request.getParameter("UserAddress");
  	user us=new user();
  	us.setUsername(Username);
  	us.setUserpass(Userpass);
  	us.setUsersex(Usersex);
  	us.setUseremail(Useremail);
  	us.setUserbirthday(Userbirthday);
  	us.setUseraddress(Useraddress);
  	userInsert ui=new userInsert();
  	if(ui.userinsert(us)>0){
  		session.setAttribute("name",Username);
  		session.setAttribute("pass",Userpass);
  		request.getRequestDispatcher("forumPage.jsp?page=1").forward(request,response);
  	}
  	else
  		request.getRequestDispatcher("register.jsp").forward(request,response);  	
  	%>
    
  </body>
</html>
