
<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@page import="forum.forumSelect"%>
<%@page import="forum.forum"%>
<%@page import="publish.classifySelect"%>
<%@page import="publish.forumClassify"%>
<%@page import="creator.creatorSelect"%>
<%@page import="register.user"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'forumPage.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
<body background="image/forumPage.jpg" style="font-family:'微软雅黑';color:#575757">
<%!int allPage=0;%>
<% int p=Integer.parseInt(request.getParameter("page"));%>
<%String nullName=(String)session.getAttribute("name");%>
	<table align="right" style="font-size=18px;color:#D6D6D6">
		<tr>
			<%if(session.getAttribute("name")==null){%>
				<td><a href="login.jsp">亲，请登录</a></td>
				<td>|</td>
  				<td>&nbsp;<a href="http://localhost:8080/Forum/firstPage.jsp" target="_top">退出</a>&nbsp;&nbsp;</td>
  			<%}else{%>
			<td>亲爱的<a href="creator.jsp?name=<%=session.getAttribute("name")%>&page=1" target="_blank"><%=session.getAttribute("name")%></a>，</td>
			<td>
			  <script language="javaScript"> 
				now = new Date(),hour = now.getHours()
				if(hour>=0&&hour<6){document.write("凌晨了，该休息了！")} 
				else if (hour>=6&&hour<8){document.write("早上好，心情愉快每一天！")} 
				else if (hour>=8&&hour<12){document.write("上午好！")} 
				else if (hour>=12&&hour<14){document.write("中午好！")} 
				else if (hour>=14&&hour<17){document.write("下午好！")} 
				else if (hour>=17&&hour<19){document.write("傍晚好！")} 
				else if (hour>=19&&hour<21){document.write("晚上好！")} 
				else {document.write("夜深了，记得早点休息！")} 
			  </script>
			</td>
			<td>|</td>
			<td><a href="http://localhost:8080/Forum/publishPage.jsp" target="_top">发帖</a>&nbsp;</td>
			<td>|</td>
			<td>&nbsp;<a href="http://localhost:8080/Forum/out.jsp" target="_top">注销</a>&nbsp;&nbsp;</td>
			<td>|</td>
  			<td>&nbsp;<a href="http://localhost:8080/Forum/firstPage.jsp" target="_top">退出</a>&nbsp;&nbsp;</td>
  			<%} %>
  		</tr>
  	</table>
  	<br>
  	<p align="center" style="color:#575757;font-size:25px;margin-top:35px;">读者论坛</p>
  	<table style="font-size:20px;margin-top:30px;margin-left:60px;">
  		<tr>
  			<td><a href="forumPage.jsp?page=1" target="_top">学科</a>&nbsp;</td>
  			<%classifySelect cselect=new classifySelect();
  		 	 List<forumClassify> allclassify=cselect.getAllclassify();
  		 	 for(int i=1;i<allclassify.size();i++){ 
  		 	 	forumClassify fc=allclassify.get(i); %> 			
  				<td>&nbsp;&nbsp;<a href="http://localhost:8080/Forum/forumPageElse.jsp?classifyId=<%=fc.getClassifyId()%>&page=1" target="_top"><%=fc.getClassifyName()%></a>&nbsp;</td>
  		 <%}%>
  		</tr>	
  	</table>
    <div style="width: 1300px;height: 522px;">
  	<table style="margin-top:16px;margin-left:35px;font-size:18px;">
  		
  				<%
  				int creatorId=0;
  				String name=null;
  				request.setCharacterEncoding("gbk");
  				List<forum> list=new forumSelect().getAllForumSubject();
  				allPage=(list.size()%10==0)?(list.size()/10):(list.size()/10+1);      	
    			if(list.size()>0){
  					for(int i=(p-1)*10;i<list.size()&&i<p*10;i++){
  						forum fr=list.get(i);  		
  						session.setAttribute("fr.getForumid()",fr.getForumcreator());
  						session.setAttribute("fr.getForumtitle()",fr.getForumid());%>
					<tr>
  						<td style="width:1210px;">  					
  						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  						<a href="contentPage.jsp?id=<%=fr.getForumid()%>" target="_blank" style="font-size:18px" id="contentPage"><%=fr.getForumtitle()%></a>
  						</td>
  			<%name=(String)session.getAttribute("fr.getForumid()");%>
  			  			
  			
  			<td style="width:50px;">
  			<%if(name.equals(session.getAttribute("name"))){%>
  				<a href="doDeleteTitle.jsp?id=<%=fr.getForumid()%>" target="_self" style="font-size:18px" id="deleteTitle">删除</a>
  			<%}%>
  			</td>
  			
  			<td><a href="creator.jsp?name=<%=name %>&page=1" target="_blank" style="color:#575757"><%=session.getAttribute("fr.getForumid()")%></a></td>
 		</tr>
 		<tr><td colspan="3"><hr style="margin-left:40px;width: 1260;color:#CCCCCC"/> </td></tr>
  		 		<%}
 			}%>	
 	</table>
 	</div>
 	<table style="margin-top:13px;" align="center">
    	<tr>
    	<td style="width: 40px;" ><a href="forumPage.jsp?page=1">首页</a></td>
    	<%    	
    	for(int n=0;n<allPage;n++){
    		if((n+1)==p){%>
    		<td style="width: 15px;" ><%=n+1%></td>
    		<%}else{%>    	
    		<td style="width: 15px;" ><a href="forumPage.jsp?page=<%=n+1%>" id="nowPage" >[<%=n+1%>]</a></td>    	
    		<%}
    	}%>
    	<td style="width: 40px;" ><a href="forumPage.jsp?page=<%=allPage%>">尾页</a></td>
    	</tr>
    </table>
   <style type="text/css">
    	a{
    		text-decoration: none;
    		color:#FFFFFF;
    	}  
    	a:hover {
    		color:#CCCCCC;
    		text-decoration:underline;
    	} 
    	#contentPage,#deleteTitle{
    		color:#336600;
    	} 		
    </style>	  
  </body>
</html>
 
 
 
 
 
 
 
 
 
 
 
