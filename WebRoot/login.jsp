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
  
  <body background="image/loginNullText.jpg" style="font-family:'΢���ź�';color:#575757">
  <%
  String username="";        //�����������ȡCookieֵ
  String userpass="";
  Cookie[] cookies=request.getCookies();         //��ȡCookie�Ķ���
  if(cookies!=null&&cookies.length>0){           //���Cookie����Ϊ�գ�˵������������û���������
  	for(Cookie c:cookies){                       //����Cookie����
  		if(c.getName().equals("username")){           //����ҵ���Ϊusername��Cookie
  			username=URLDecoder.decode(c.getValue(),"utf-8");       //���û���Cookie���벢��ֵ���ַ���username��
  		}
  		if(c.getName().equals("userpass")){           //����ҵ���Ϊuserpass��Cookie
  			userpass=c.getValue();               //������Cookie��ֵ���ַ���userpass��
  		}
  	}
  }
  
  %>
  	<p align="right"><a href="http://localhost:8080/Forum/firstPage.jsp" target="_top">�˳�</a>&nbsp;&nbsp;</p>
  	<p style="font-size:25px;margin-left:663px;margin-top:50px;">�û���¼</p>
  	<form name="loginPage" method="post" action="doLogin.jsp"> 	       
   		<table style="margin-left:580px;margin-top:75px;">
   			<tr><td>�û�����</td>
  	 			<td><input type="text" style="width:180px;height:30px;"   name="userName" value="<%=username%>" placeholder="�������û���"/></td>
   			</tr>
   			<tr><td colspan="2"> </td></tr>
   			<tr><td colspan="2"> </td></tr>
   			<tr><td colspan="2"> </td></tr>
   			<tr><td>��&nbsp;&nbsp;�룺</td>
   				<td><input type="password" style="width:180px;height:30px;" name="userPass" value="<%=userpass%>" placeholder="����������"/></td>
   			</tr>
   			<tr>
   				<td><input type="checkbox" id="remenber" name="remenber" style="margin-top:5px;"/>��ס����</td>
   				<td align="right"><a href="register.jsp"  id="toRegister" >ע���˺�</a></td>
   			</tr>
   			<tr align="center"><td colspan="2"><input type="submit" name="submit" id="submit" style="margin-left:30px;margin-top:10px;" style="width:60px; height:30px; font-size:15PX; background:#33300; color:#575757;" value="��  ¼"/>
   				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" name="reset" id="reset" style="margin-right:30px;margin-top:10px;" value="��  ��"/></td>
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
