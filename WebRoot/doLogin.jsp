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
    	
    	String[] remenber=request.getParameterValues("remenber");     //��ȡcheckbox��ֵ�����ص�Ϊ�ַ�������
  		if(remenber!=null&&remenber.length>0){                        //���ѡ����checkbox�����ַ������鲻Ϊ�գ����ȴ���0
  			String username=URLEncoder.encode(request.getParameter("userName"),"utf-8");        //Ϊ�û��������ַ�����ת�룬��ֹ���ĳ��ִ���
  			String userpass=request.getParameter("userPass");              //���벻Ϊ���ģ�����������Բ�ת��
  			Cookie usernameCookie=new Cookie("username",username);         //Cookie��һ����ֵ�ԣ�������map������һ��Cookie�����û���
  			Cookie userpassCookie=new Cookie("userpass",userpass);         //����һ��Cookie��������
  			usernameCookie.setMaxAge(864000);                              //�����û���Cookie�ı���ʱ�䣬ʮ��
  			userpassCookie.setMaxAge(864000);                              //��������Cookie�ı���ʱ�䣬ʮ��
  			response.addCookie(usernameCookie);                            //���´������û���Cookie��ӵ�Cookie�б���
  			response.addCookie(userpassCookie);                            //���´���������Cookie��ӵ�Cookie�б���
  		}else{                      //���û��ѡ���ס����
  			Cookie[] cookies=request.getCookies();            //��ȡCookie�Ķ���
  			if(cookies!=null&&cookies.length>0){              //���Cookie����Ϊ�գ�˵������������û���������
  				for(Cookie c:cookies){                        //����Cookie����
  					if(c.getName().equals("username")||c.getName().equals("userpass")){       //c.getName����Cookie�ĵ�һ��Ԫ�أ������ڼ�ֵ�Եļ�
  						c.setMaxAge(0);           //������ҵ�ԭ�ȱ�������û��������룬�����ǵ���Чʱ������Ϊ0������ʧЧ���൱�ڲ�����
  						response.addCookie(c);    //���±���Cookie���󣬷��򲻻�������
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
