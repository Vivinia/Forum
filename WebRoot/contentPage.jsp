<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@page import="everyClassify.contentSelect"%>
<%@page import="forum.forum"%>
<%@page import="traceForum.traceInsert"%>
<%@page import="traceForum.trace"%>
<%@page import="collect.collectSelect"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'subjectHowToLearnMath.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body background="image/contentPage.jpg">
  <div style="font-family:'΢���ź�';color:#575757;margin-left:35px;margin-right:35px;">
   <%!int Forumid;%>
	<%int id=Integer.parseInt(request.getParameter("id"));%>
    <%if(session.getAttribute("name")!=null){ 
		collectSelect select=new collectSelect();
		int selectLine=select.showOrHideCollect((String)session.getAttribute("name"),id);%>	
		<%if(selectLine>0){%>
		<div id="show" style="display:block">
		<p align="center"><a href="javascript:void(0);" id="collect" onmouseover="showHide()">���ղ�</a></p>
		</div>
		<div id="hide" style="display:none">
		<p align="center"><a href="doDeleteCollect.jsp?id=<%=id %>" id="collect" onmouseout="hideShow()">ȡ���ղ�</a></p>
		</div>
		<%}else{ %>
   		<p align="center"><a href="collect.jsp?id=<%=id %>" id="collect">�ղ�</a></p> 
    <%} }%>
    
	<%session.setAttribute("id",id);
	List<forum> list=new contentSelect().getForum(id);
    if(list.size()>0){
  	for(int i=0;i<list.size();i++){
  		forum fr=list.get(i);  		%>
  		<p style="font-size:18px;color:#336600;"><%=fr.getForumcontent() %></p>
  		<%Forumid=fr.getForumid();%> 
  		<br/>
  <hr style="margin-left:3px;width:1250" colspan="3">		
  <table>
  <%
  request.setCharacterEncoding("gbk");
  traceInsert traceinsert=new traceInsert();
  List<trace> traceList=traceinsert.select(id);   
  	for(int j=0;j<traceList.size();j++){%>
  	
  	<%trace t=traceList.get(j);%> 
  	
  	<tr>
  		<td style="width:1150px;color:#575757"><%=t.getTcontent()%></td>
  		<td style="width:50px;">
  		<%
  		if(session.getAttribute("name")!=null){
  		if(session.getAttribute("name").equals(t.getTcreator())){ %>
  		<a href="doDeleteTrace.jsp?id=<%=t.getTid()%>" target="_self" style="font-size:18px;color:#336600;" id="deleteTrace">ɾ��</a>
  		<%}} %>
  		</td>
  		<td><a href="creator.jsp?name=<%=t.getTcreator()%>" target="_blank" style="color:#575757"><%=t.getTcreator()%></a></td>
  	</tr>	
  	<tr><td colspan="3"><hr style="margin-left:3px;width:1250"></td></tr>
  	<%}%>
  	</table>
  	
  	<%}
  }%>
   <br/>
   <%if(session.getAttribute("name")!=null){ %>
   <p style="font-size:20px;margin-top:20px;" align="center">����</p>
  <form action="doTraceForum.jsp?traceId=<%=Forumid%>" method="post">
  <table align="center">
  	<tr>
  		<td colspan="2"><textarea rows="20" cols="40" style="width:500;height:300" name="tcontent" id="tcontent"></textarea></td>
  	</tr>
  	<tr><td colspan="2"></td></tr>
  	<tr align="center">
  		<td><input type="submit" name="submit" id="submit" value="ȷ��"/></td>
  		<td><input type="reset" name="reset" id="reset" value="���"/></td>
  	</tr>
  </table>
   </form>
   <%} %>
    </div>
    <style type="text/css">
   	    a{
    		text-decoration: none;
    	}  
    	a:hover {
    		text-decoration:underline;
    	} 
  		#submit,#reset{
    		width:60px;
    		height:30px;
    		font-size:15PX;
    		background:#33300; 
    		color:#575757;
    	}
    	#collect{
    		font-size:20px;
    		color:#C7C7C7;
    	}  
    	#collect:hover {
    		font-size:20px;
    		color:#575757;
    	}
    	
    </style>
    <script type="text/javascript">
    function showHide()
    {
    	document.getElementById("show").style.display="none";
     	document.getElementById("hide").style.display="block";
    }
    function hideShow()
    {
    	document.getElementById("show").style.display="block";
     	document.getElementById("hide").style.display="none";
    }
    </script>
  </body>
</html>