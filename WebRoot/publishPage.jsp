<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@page import="publish.forumClassify"%>
<%@page import="publish.classifySelect"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'publishPage.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body background="image/publishPage.jpg" style="font-family:'΢���ź�';color:#575757">
  	<table align="right" style="font-size=18px;">
  		<tr><td>&nbsp;<a href="http://localhost:8080/Forum/forumPage.jsp?page=1" target="_top">�˳�</a>&nbsp;&nbsp;</td></tr>
  	</table>
    <br><br>
  	<p style="font-size:25px;margin-top:25px;" align="center">�û�����</p>
  	<form name="publishPage" method="post" action="doPublish.jsp">
    <table align="center" style="font-size=18px;margin-top:75px;color:#4D4D4D">
    	<tr>
    		<td>���⣺</td>
    		<td><input type="text" name="PublishTitle"style="width:450px;height:30px;"></td>
    	</tr>
    	<tr><td colspan="2"> </td></tr>
    	<tr>
    		<td>���ࣺ</td>
    		<td>
    			<select name="PublishClassify">
    				<%
  					classifySelect cselect=new classifySelect();
  					List<forumClassify> allclassify=cselect.getAllclassify();
  					for(forumClassify fc:allclassify){%>
  					<option value="<%=fc.getClassifyId() %>"><%=fc.getClassifyName() %></option>  
  					<%} 
  					%>
    			</select>
    		</td>
    	</tr>
    	<tr><td colspan="2"> </td></tr>
    	<tr>
    		<td>���ݣ�</td>
    		<td><textarea rows="20" cols="40" name="PublishContent" style="width:450px;height:300px;"></textarea></td>
    	</tr>
    	<tr><td colspan="2"></td></tr>
    	<tr ><td colspan="2" ><input type="submit" id="submit" style="margin-left:110px;" value="ȷ��"/>
   		    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" id="reset" style="margin-left:140px;" value="���"/></td>
   			</tr>
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
    </style>
  </body>
</html>
