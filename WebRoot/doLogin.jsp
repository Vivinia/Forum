<%@ page language="java" import="java.util.*,java.net.*" pageEncoding="gbk"%>
<%@page import="login.userDao"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>This is doLogin.</title>
    
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
    String name=request.getParameter("userName");
    String pass=request.getParameter("userPass");
    userDao ud=new userDao();
    if(ud.getUser(name,pass)){
    	session.setAttribute("name",name);
    	session.setAttribute("pass",pass);
    	
    	String[] remenber=request.getParameterValues("remenber");     //获取checkbox的值，返回的为字符串数组
  		if(remenber!=null&&remenber.length>0){                        //如果选择了checkbox，则字符串数组不为空，长度大于0
  			String username=URLEncoder.encode(request.getParameter("userName"),"utf-8");        //为用户名创建字符串并转码，防止中文出现错误
  			String userpass=request.getParameter("userPass");              //密码不为中文，所以密码可以不转码
  			Cookie usernameCookie=new Cookie("username",username);         //Cookie是一个键值对，类似于map，创建一个Cookie保存用户名
  			Cookie userpassCookie=new Cookie("userpass",userpass);         //创建一个Cookie保存密码
  			usernameCookie.setMaxAge(864000);                              //设置用户名Cookie的保存时间，十天
  			userpassCookie.setMaxAge(864000);                              //设置密码Cookie的保存时间，十天
  			response.addCookie(usernameCookie);                            //将新创建的用户名Cookie添加到Cookie列表中
  			response.addCookie(userpassCookie);                            //将新创建的密码Cookie添加到Cookie列表中
  		}else{                      //如果没有选择记住密码
  			Cookie[] cookies=request.getCookies();            //获取Cookie的对象
  			if(cookies!=null&&cookies.length>0){              //如果Cookie对象不为空，说明曾经保存过用户名和密码
  				for(Cookie c:cookies){                        //遍历Cookie对象
  					if(c.getName().equals("username")||c.getName().equals("userpass")){       //c.getName代表Cookie的第一个元素，类似于键值对的键
  						c.setMaxAge(0);           //如果查找到原先保存过该用户名和密码，将它们的有效时间设置为0，马上失效，相当于不保存
  						response.addCookie(c);    //重新保存Cookie对象，否则不会起作用
  					}
  				}
  			}
 		}
    	
    	request.getRequestDispatcher("forumPage.jsp?page=1").forward(request,response);
    }
    else
    	request.getRequestDispatcher("login.jsp").forward(request,response);
    %>
  </body>
</html>
