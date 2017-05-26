<%@ page language="java" import="java.util.*,java.net.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>This is login.</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body background="image/loginNullText.jpg" style="font-family:'微软雅黑';color:#575757">
  <%
  String username="";        //定义变量，获取Cookie值
  String userpass="";
  Cookie[] cookies=request.getCookies();         //获取Cookie的对象
  if(cookies!=null&&cookies.length>0){           //如果Cookie对象不为空，说明曾经保存过用户名和密码
  	for(Cookie c:cookies){                       //遍历Cookie对象
  		if(c.getName().equals("username")){           //如果找到键为username的Cookie
  			username=URLDecoder.decode(c.getValue(),"utf-8");       //将用户名Cookie解码并赋值到字符串username中
  		}
  		if(c.getName().equals("userpass")){           //如果找到键为userpass的Cookie
  			userpass=c.getValue();               //将密码Cookie赋值到字符串userpass中
  		}
  	}
  }
  
  %>
  	<p align="right"><a href="http://localhost:8080/Forum/firstPage.jsp" target="_top">退出</a>&nbsp;&nbsp;</p>
  	<p style="font-size:25px;margin-left:663px;margin-top:50px;">用户登录</p>
  	<form name="loginPage" method="post" action="doLogin.jsp"> 	       
   		<table style="margin-left:580px;margin-top:75px;">
   			<tr><td>用户名：</td>
  	 			<td><input type="text" style="width:180px;height:30px;"   name="userName" value="<%=username%>" placeholder="请输入用户名"/></td>
   			</tr>
   			<tr><td colspan="2"> </td></tr>
   			<tr><td colspan="2"> </td></tr>
   			<tr><td colspan="2"> </td></tr>
   			<tr><td>密&nbsp;&nbsp;码：</td>
   				<td><input type="password" style="width:180px;height:30px;" name="userPass" value="<%=userpass%>" placeholder="请输入密码"/></td>
   			</tr>
   			<tr>
   				<td><input type="checkbox" id="remenber" name="remenber" style="margin-top:5px;"/>记住密码</td>
   				<td align="right"><a href="register.jsp"  id="toRegister" >注册账号</a></td>
   			</tr>
   			<tr align="center"><td colspan="2"><input type="submit" name="submit" id="submit" style="margin-left:30px;margin-top:10px;" style="width:60px; height:30px; font-size:15PX; background:#33300; color:#575757;" value="登  录"/>
   				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" name="reset" id="reset" style="margin-right:30px;margin-top:10px;" value="清  除"/></td>
   			</tr>    			
   			<tr><td colspan=""></td></tr> 			
   		</table>
   	</form>
    <style type="text/css">
    	a{
    		text-decoration: none;
    		color:#FFFFFF;
    	}  
    	a:hover {
    		color:#CCCCCC;
    		text-decoration:underline;
    	}  
    	#submit,#reset{
    		width:60px;
    		height:30px;
    		font-size:15PX;
    		background:#33300; 
    		color:#575757;
    	} 	
    	#toRegister{
    		color:#575757;
    	}	   	
    </style> 
  </body>
</html>
