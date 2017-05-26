<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@page import="register.user"%>
<%@page import="update.userInfoUpdate"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'doUpdateInfoPage.jsp' starting page</title>
    
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
    int sign=Integer.parseInt(request.getParameter("sign"));
    if(sign==1){  	
  		String name=(String)session.getAttribute("name");
  		String Usersex=request.getParameter("UserSex");
  		String Useremail=request.getParameter("UserEmail");
  		String Userbirthday=request.getParameter("UserBirthday");
  		String Useraddress=request.getParameter("UserAddress");
  		user us=new user();
  	
  		us.setUsersex(Usersex);
  		us.setUseremail(Useremail);
  		us.setUserbirthday(Userbirthday);
  		us.setUseraddress(Useraddress);
  		userInfoUpdate update=new userInfoUpdate();
  		if(update.updateInfo(us,name)>0){
  			request.getRequestDispatcher("updateSuccess.jsp").forward(request,response);
  		}
  		else
  			request.getRequestDispatcher("updateInfoPage.jsp").forward(request,response);  
  	}else if(sign==2){
  		String name=(String)session.getAttribute("name");
  		String newPassOne=request.getParameter("newPassOne");
  	    String newPassTwo=request.getParameter("newPassTwo");
  	    
  	    user us=new user();
  	    us.setUserpass(newPassOne);
  	    userInfoUpdate update=new userInfoUpdate();
  	    if(update.updatePass(us,name)>0){
  	    	request.getRequestDispatcher("updateSuccess.jsp").forward(request,response);
  		}
  		else
  			request.getRequestDispatcher("updateInfoPage.jsp").forward(request,response); 
  	}	
  	%>
    
  </body>
</html>
